var selStates = new Array();
var modalDismissHandler = false;
var bIsMobileController = false;

function showGotSteamModal( contentEl, steamURL, appName )
{
	$('gotSteam_SteamURL').href = steamURL;
	$('gotSteam_AppName').update( appName );
	showModal( contentEl );
}

function showContentAsModal( idModal, elContent, bExplicitDismissalOnly )
{
	var elModal = $(idModal);
	var elModalContent = elModal.down('.modal_box');

	if ( elContent.parentNode != elModalContent )
	{
		if ( elContent.parentNode )
			elContent.remove();

		elModalContent.appendChild( elContent );
	}
	elContent.siblings().invoke('hide');
	elContent.show();
	
	showModal( elModal, bExplicitDismissalOnly );
}

function showModal( contentEl, bExplicitDismisalOnly, bIgnoreResizeAndScrollEvents )
{
	if ( contentEl.is_visible_modal )
	{
		modalSizing( contentEl );
		return;
	}

	// hide selects, which have an infinitely high z-index in IE
	sels = document.getElementsByTagName('select');
	selStates.length = 0;
	for(x=0;x<sels.length;x++)
	{
		selStates.push((sels[x].style.visibility == undefined ? 'visible' : sels[x].style.visibility));
		sels[x].style.visibility = 'hidden';
	}
	
	bgEl = $('modalBG');
	if(!bgEl)
	{
		bgEl = document.createElement('div');
		bgEl.id = 'modalBG';
	}
	if ( bgEl.effect )
		bgEl.effect.cancel();
	bgEl.setOpacity( 0 );
	bgEl.effect = new Effect.Appear( bgEl, { from: 0.0, to: 0.7, duration: 0.4 } );
	
	cEl = $(contentEl);
	cEl.show();

	if ( !bIsMobileController )
	{
		modalSizing( cEl );

		cEl.sizingListener = modalSizing.bind( null, cEl );
	}

	// skip registering the resize/scroll events on iphone as we don't calculate the position correctly
	if ( !Prototype.Browser.MobileSafari && !bIsMobileController && ( bIgnoreResizeAndScrollEvents == null || bIgnoreResizeAndScrollEvents == false ) )
	{
		Event.observe( window, 'resize', cEl.sizingListener );
		Event.observe( window, 'scroll', cEl.sizingListener );
	}
	
	if ( !bExplicitDismisalOnly )
		modalDismissHandler = RegisterPopupDismissal( hideModal.bind( null, cEl ), cEl, true );

	contentEl.is_visible_modal = true;
}

function modalSizing( cEl )
{
	var flInverseZoom = 1 / (document.body.style.zoom || 1);
	w = document.viewport.getWidth() * flInverseZoom;
	h = document.viewport.getHeight() * flInverseZoom;
	sl = document.viewport.getScrollOffsets().left;
	st = document.viewport.getScrollOffsets().top;

	cw = cEl.offsetWidth;
	ch = cEl.offsetHeight;

	bgEl = $('modalBG');
	bgEl.style.top = 0 + 'px';
	bgEl.style.left = 0 + 'px';
	bgEl.style.width = Math.max( $(document.body).getWidth(), cw) + 'px';
	bgEl.style.height = Math.max( $(document.body).getHeight(), ch) + 'px';

	t = (Math.floor((h / 2) - (ch / 2)) + st);
	l = (Math.floor((w / 2) - (cw / 2)) + sl);
	cEl.style.top = (t < 0 ? 0 : t) + 'px';
	cEl.style.left = (l < 0 ? 0 : l ) + 'px';
}

function hideModal(contentEl)
{
	var cEl = $(contentEl);
	
	sels = document.getElementsByTagName('select');
	for(x=0;x<sels.length;x++)
	{
		sels[x].style.visibility = selStates[x];
	}

	var bgEl = $('modalBG');
	if ( bgEl.effect )
		bgEl.effect.cancel();
	bgEl.effect = new Effect.Fade( bgEl, { duration: 0.2 } );
	cEl.hide();
	
	currentModal = false;


	if ( !Prototype.Browser.MobileSafari )
	{
		Event.stopObserving( window, 'resize', cEl.sizingListener );
		Event.stopObserving( window, 'scroll', cEl.sizingListener );
	}
	if ( modalDismissHandler ) 
	{
		modalDismissHandler.unregister();
		modalDismissHandler = false;
	}
	
	if ( cEl.OnModalDismissal )
		cEl.OnModalDismissal();

	cEl.is_visible_modal = false;
}

function modalAlert(msg)
{
	modalEl = document.getElementById('modalAlert');
	if(modalEl)
	{
		for(x=0;x<modalEl.childNodes.length;x++)
		{
			modalEl.removeChild(modalEl.childNodes[x]);
		}
		modalEl.parentNode.removeChild(modalEl);
	}
	
	modalEl = document.createElement('div');
	
}

