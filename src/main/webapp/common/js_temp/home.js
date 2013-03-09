

function setLoginFocus()
{
	focalbox = document.getElementById('steamAccountName');
	if ( focalbox )
	{
		focalbox.focus();
	}
}

addEvent( window, 'load', setLoginFocus, false );

