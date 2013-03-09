
//Used to add a unique get var to all ajax calls, so IE doesn't do stupid caching
var iAjaxCalls = 0;

function HighlightFailure( msg )
{
	var errorDisplay = $('error_display');
	if ( errorDisplay )
	{
		errorDisplay.update( msg );
		errorDisplay.show();
		errorDisplay.style.color = '#ffffff';
		new Effect.Morph( 'error_display', { style: 'color: #ff0000' } );
	}
}


//Refresh the catpcha image 
function RefreshCaptcha()
{
	++iAjaxCalls;
	
		new Ajax.Request('https://steamcommunity.com/actions/RefreshCaptcha/',
	  {
	    method:'get',
	    parameters: { count : iAjaxCalls },
	    onSuccess: function(transport){
	      if ( transport.responseText ){
	        
	        try {
	      	  var result = transport.responseText.evalJSON(true);
	      	} catch ( e ) {
	      	  //alert(e);
	      	  return;
	      	}
	      	
	      	gid = result.gid;
	      	UpdateCaptcha( gid );
		  }
	    },
	    onFailure: function(){ 
	    	//alert('Something went wrong...') 
	    }
	  });
}

function UpdateCaptcha( gid )
{
	if ( gid != -1 ) 
	{
		$('captcha_entry').show();
		$('captchaImg').src = 'https://steamcommunity.com/public/captcha.php?gid='+gid;
		$('input_captcha').value='';
	}
	$('captchagid').value = gid;
}

var g_bLoginInFlight = false;
var g_bInEmailAuthProcess = false;
var g_bEmailAuthSuccessful = false;
var g_bLoginTransferInProgress = false;
var g_bEmailAuthSuccessfulWantToLeave = false;
var g_sOAuthRedirectURI = 'steammobile://mobileloginsucceeded';

function DoLogin()
{
	var form = document.forms['logon'];

	if ( g_bLoginInFlight )
		return;
	g_bLoginInFlight = true;
	$('login_btn_signin').hide();
	$('login_btn_wait').show();
	new Ajax.Request( 'https://steamcommunity.com/login/getrsakey/',
		{
			method: 'post',
			parameters: {
				username: form.elements['username'].value
			},
			onSuccess: OnRSAKeyResponse,
			onException: function( req, e ) { throw e; }
		}
	);
}


function OnRSAKeyResponse( transport )
{
	var results = transport.responseJSON;
	if ( results.publickey_mod && results.publickey_exp && results.timestamp )
	{
		var form = document.forms['logon'];

		var pubKey = RSA.getPublicKey( results.publickey_mod, results.publickey_exp );
		var encryptedPassword = RSA.encrypt( form.elements['password'].value, pubKey );
		new Ajax.Request( 'https://steamcommunity.com/login/dologin/',
			{
				method: 'post',
				parameters: {
					password: encryptedPassword,
					username: form.elements['username'].value,
					emailauth: form.elements['emailauth'].value,
										captchagid: form.elements['captchagid'].value,
					captcha_text: form.elements['captcha_text'].value,
					emailsteamid: form.elements['emailsteamid'].value,
					rsatimestamp: results.timestamp
				},
				onSuccess: OnLoginResponse,
				onException: function( req, e ) { throw e; }
			}
		);
	}
	else
	{
		if ( results.message )
		{
			HighlightFailure( results.message );
		}

		$('login_btn_signin').show();
		$('login_btn_wait').hide();

		g_bLoginInFlight = false;
	}
}

function OnLoginResponse( transport )
{
	var results = transport.responseJSON;
	g_bLoginInFlight = false;
	var bRetry = true;
	
	if ( results.login_complete )
	{
		
		var bRunningTransfer = false;
		if ( results.transfer_url && results.transfer_parameters )
		{
			bRunningTransfer = true;
			TransferLogin( results.transfer_url, results.transfer_parameters );
		}
		
		if ( g_bInEmailAuthProcess )
		{
			g_bEmailAuthSuccessful = true;
			SetEmailAuthModalState( 'success' );
		}
		else
		{
			bRetry = false;
			if ( !bRunningTransfer )
				LoginComplete();
		}
	}
	else
	{
		if ( results.captcha_needed && results.captcha_gid )
		{
			UpdateCaptcha( results.captcha_gid );
		}
		else if ( results.emailauth_needed )
		{
			if ( results.emaildomain )
				$('emailauth_entercode_emaildomain').update( results.emaildomain );
			
			if ( results.emailsteamid )
				$('emailsteamid').value = results.emailsteamid;
			
			if ( !g_bInEmailAuthProcess )
				StartEmailAuthProcess();
			else
				SetEmailAuthModalState( 'incorrectcode' );
		}
		else if ( results.denied_ipt )
		{
			$('loginIPTModal').OnModalDismissal = ClearLoginForm;
			showModal( 'loginIPTModal' );
		}
		
		if ( results.message )
		{
			HighlightFailure( results.message );
		}
	}
	if ( bRetry )
	{
		$('login_btn_signin').show();
		$('login_btn_wait').hide();
	}
}

function ClearLoginForm()
{
	var rgElements = document.forms['logon'].elements;
	rgElements['username'].value = '';
	rgElements['password'].value = '';
	rgElements['emailauth'].value = '';
	rgElements['emailsteamid'].value = '';
	$('authcode').value = '';
	
	if ( rgElements['captchagid'].value )
		RefreshCaptcha();
	
	rgElements['username'].focus();
}

function StartEmailAuthProcess()
{
	g_bInEmailAuthProcess = true;
	$('loginAuthCodeModal').OnModalDismissal = CancelEmailAuthProcess;
	SetEmailAuthModalState( 'entercode' );
	showModal ( 'loginAuthCodeModal', true );
}

function CancelEmailAuthProcess()
{
	g_bInEmailAuthProcess = false;
	// if the user closed the auth window on the last step, just redirect them like we normally would
	if ( g_bEmailAuthSuccessful )
		LoginComplete();
	else
		ClearLoginForm();
}

function TransferLogin( url, parameters)
{
	if ( g_bLoginTransferInProgress )
		return;
	g_bLoginTransferInProgress = true;
	
	var iframe = new Element( 'iframe', {id: 'transfer_iframe' } );
	iframe.hide();
	$(document.body).appendChild( iframe );
	
	var doc = iframe.contentWindow.document;
	doc.open();
	doc.write( '<form method="POST" action="' + url + '" name="transfer_form">' );
	for ( var param in parameters )
	{
		doc.write( '<input type="hidden" name="' + param + '" value="' + parameters[param] + '">' );
	}
	doc.write( '</form>' );
	doc.write( '<script>window.onload = function(){ document.forms["transfer_form"].submit(); }</script>' );
	doc.close();
	
	// firefox fires the onload event twice
	var cLoadCount = Prototype.Browser.Gecko ? 2 : 1;
	
	Event.observe( iframe, 'load', function( event ) { if ( --cLoadCount == 0 ) OnTransferComplete() } );
	Event.observe( iframe, 'error', function( event ) { OnTransferComplete(); } );
	
	// after 10 seconds, give up on waiting for transfer
	window.setTimeout( OnTransferComplete, 10000 );
}

function OnTransferComplete()
{
	if ( !g_bLoginTransferInProgress )
		return;
	g_bLoginTransferInProgress = false;
	if ( !g_bInEmailAuthProcess )
		LoginComplete();
	else if ( g_bEmailAuthSuccessfulWantToLeave )
		LoginComplete();
}

function OnEmailAuthSuccessContinue()
{
	if ( g_bLoginTransferInProgress )
	{
				$('auth_buttonsets').childElements().invoke('hide');
		if ( $('auth_buttonset_waiting') )
			$('auth_buttonset_waiting').show();
		
		g_bEmailAuthSuccessfulWantToLeave = true;
	}
	else
		LoginComplete();
}

function LoginComplete()
{
		if ( $('openidForm') )
		$('openidForm').submit();
	else
		window.location = document.forms['logon'].elements['redir'].value;
}

function SubmitAuthCode()
{
	$('auth_buttonsets').childElements().invoke('hide');
	if ( $('auth_buttonset_waiting') )
		$('auth_buttonset_waiting').show();
	
	document.forms['logon'].elements['emailauth'].value = $('authcode').value;
	DoLogin();
}

function SetEmailAuthModalState( step )
{
	$('auth_messages').childElements().invoke('hide');
	$('auth_message_' + step ).show();
	
	$('auth_details_messages').childElements().invoke('hide');
	if ( $('auth_details_' + step ) )
		$('auth_details_' + step ).show();
	
	$('auth_buttonsets').childElements().invoke('hide');
	if ( $('auth_buttonset_' + step ) )
		$('auth_buttonset_' + step ).show();
	
	$('authcode_help_supportlink').hide();
	
	var icon='key';
	var bShowAuthcodeEntry = true;
	if ( step == 'entercode' )
	{
		icon = 'key';
	}
	else if ( step == 'checkspam' )
	{
		icon = 'trash';
	}
	else if ( step == 'success' )
	{
		icon = 'unlock';
		bShowAuthcodeEntry = false;
		$('success_continue_btn').focus();
	}
	else if ( step == 'incorrectcode' )
	{
		icon = 'lock';
	}
	else if ( step == 'help' )
	{
		icon = 'steam';
		bShowAuthcodeEntry = false;
		$('authcode_help_supportlink').show();
	}
	
	if ( bShowAuthcodeEntry )
		$('authcode_entry').show();
	else
		$('authcode_entry').hide();
	
	$('auth_icon').className = 'auth_icon auth_icon_' + icon;
}

function OnAuthcodeFocus( defaultText )
{
	if ( $('authcode').value == defaultText )
	{
		$('authcode').value = '';
		$('authcode').removeClassName( 'defaulttext' );
	}
}

function OnAuthcodeBlur( defaultText )
{
	if ( $('authcode').value == '' )
	{
		$('authcode').value = defaultText;
		$('authcode').addClassName( 'defaulttext' );
	}
}

