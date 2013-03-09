<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html>
<!-- saved from url=(0027)https://steamcommunity.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>INFOSHOP</title>
<link rel="shortcut icon" href="https://steamcommunity.com/favicon.ico" type="image/x-icon">
<link href= "<%=request.getContextPath()%>/common/css/global.css" rel="stylesheet" type="text/css">
<link href= "<%=request.getContextPath()%>/common/css/home.css" rel="stylesheet" type="text/css">
<link href= "<%=request.getContextPath()%>/common/css/login.css" rel="stylesheet" type="text/css">
<link href= "<%=request.getContextPath()%>/common/css/header.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/prototype-1.7.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/scriptaculous.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/effects.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/controls.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/slider.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/dragdrop.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/global.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/home.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/login.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/modalv2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/rsa.js"></script>

</head>
<body>
<center>

<!-- header bar, contains info browsing user if logged in -->

<div id="global_header">

	<div class="content">

	

		<div class="logo">

			<span id="logo_holder">

				<a href="http://store.steampowered.com/">

					<img src="<%=request.getContextPath()%>/common/images/globalheader_logo.png" width="176" height="44" border="0" alt="Steam Logo" />

				</a>

			</span>

			<!--[if lt IE 7]>

			<style type="text/css">

			#logo_holder img { filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0); }

			#logo_holder { display: inline-block; width: 176px; height: 44px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath()%>/common/images/header/globalheader_logo.png'); }

			</style>

			<![endif]-->

		</div>

	

		<a class="menuitem" href="http://store.steampowered.com/">

			상점		</a> 

		<a class="menuitem active" href="https://steamcommunity.com">

			<div class="activebg">&nbsp;</div>

			커뮤니티		</a>

		<a class="menuitem" href="http://store.steampowered.com/news/">

			뉴스		</a>

		<a class="menuitem" href="http://store.steampowered.com/forums/">

			게시판		</a>

		<a class="menuitem" href="http://store.steampowered.com/about/">

			정보		</a>

		<a class="menuitem" href="http://support.steampowered.com/">

			지원		</a>

		<a class="menuitem" href="http://store.steampowered.com/stats/">

			통계		</a>

		

		<div id="global_actions">

						<div id="global_action_menu">



				<div class="header_installsteam_btn header_installsteam_btn_green">

					<div class="header_installsteam_btn_leftcap"></div>

					<div class="header_installsteam_btn_rightcap"></div>

					<a class="header_installsteam_btn_content" href="http://store.steampowered.com/about/">

						Steam 설치					</a>

				</div>

															<a class="global_action_link" href="https://steamcommunity.com?goto=%3Fgoto%3D0">로그인</a>

						&nbsp;|&nbsp;

										<span class="pulldown global_action_link" id="language_pulldown" onclick="ShowMenu( this, 'language_dropdown', 'right' );">언어</span>

					<div class="popup_block" id="language_dropdown" style="display: none;">

						<div class="shadow_ul"></div><div class="shadow_top"></div><div class="shadow_ur"></div><div class="shadow_left"></div><div class="shadow_right"></div><div class="shadow_bl"></div><div class="shadow_bottom"></div><div class="shadow_br"></div><div class="iepopupfix"><img class="iepopupfix_img" src="<%=request.getContextPath()%>/common/images/blank.gif" alt =""></div>						<div class="popup_body popup_menu shadow_content">

																						<a class="popup_menu_item tight" href="?l=bulgarian">Български (Bulgarian)</a>

																						<a class="popup_menu_item tight" href="?l=czech">čeština (체코)</a>

																						<a class="popup_menu_item tight" href="?l=danish">Dansk (덴마크어)</a>

																						<a class="popup_menu_item tight" href="?l=dutch">Nederlands (네덜란드어)</a>

																						<a class="popup_menu_item tight" href="?l=english">English (영어)</a>

																						<a class="popup_menu_item tight" href="?l=finnish">Suomi (핀란드어)</a>

																						<a class="popup_menu_item tight" href="?l=french">Français (프랑스어)</a>

																						<a class="popup_menu_item tight" href="?l=german">Deutsch (독일어)</a>

																						<a class="popup_menu_item tight" href="?l=greek">Ελληνικά (Greek)</a>

																						<a class="popup_menu_item tight" href="?l=hungarian">Magyar (Hungarian)</a>

																						<a class="popup_menu_item tight" href="?l=italian">Italiano (이탈리아어)</a>

																						<a class="popup_menu_item tight" href="?l=japanese">日本語 (일본어)</a>

																														<a class="popup_menu_item tight" href="?l=norwegian">Norsk (노르웨이어)</a>

																						<a class="popup_menu_item tight" href="?l=polish">Polski (폴란드어)</a>

																						<a class="popup_menu_item tight" href="?l=portuguese">Português (포르투갈어)</a>

																						<a class="popup_menu_item tight" href="?l=brazilian">Português-Brasil (Portuguese-Brazil)</a>

																						<a class="popup_menu_item tight" href="?l=romanian">Română (로마어)</a>

																						<a class="popup_menu_item tight" href="?l=russian">Русский (러시아어)</a>

																						<a class="popup_menu_item tight" href="?l=schinese">简体中文 (중국어 간자체)</a>

																						<a class="popup_menu_item tight" href="?l=spanish">Español (스페인어)</a>

																						<a class="popup_menu_item tight" href="?l=swedish">Svenska (스웨덴어)</a>

																						<a class="popup_menu_item tight" href="?l=tchinese">繁體中文 (중국어 번자체)</a>

																						<a class="popup_menu_item tight" href="?l=thai">ไทย (태국어)</a>

																						<a class="popup_menu_item tight" href="?l=turkish">Türkçe (Turkish)</a>

														<a class="popup_menu_item tight" href="http://translation.steampowered.com" target="_blank">Steam 번역을 도와주세요</a>

						</div>

					</div>

							</div>

		</div>

		

				

	</div>

</div>

<div id="modalBG"></div>

<div id="userControls">

		<div id="headerSearch">



		<form id="headerSearchForm" method="GET" action="http://steamcommunity.com/actions/Search" accept-charset="UTF-8">

		<input id="searchInputBoxNew" type="text" name="K" value="검색" onClick="if( this.value == '검색' ) { this.value='' }" onFocus="if( this.value == '검색' ) { this.value='' }" onBlur="if( this.value == '' ) { this.value='검색' }" />

		<input id="searchSubmitImg" type="image" src="<%=request.getContextPath()%>/common/images/searchbox_submit.gif" alt="Submit" width="23" height="18" />

		</form>

	</div>	<a class="userControlsLink" href="http://steamcommunity.com">&nbsp;</a>

</div>

<script type="text/javascript">

	g_sessionID = "MTQxMDA1NzQ4Nw==";

	g_steamID = false;

</script><!-- /header bar -->

<div id="mainBody">

	<div id="mainBodyHeader">

		<h1>Steam 커뮤니티</h1>

		<p>Steam 커뮤니티에는 다양한 PC 그리고 Mac 게임을 플레이하는 사람들이 참여하고 있습니다.<br />이제 손쉽게 온라인에서 친구를 만나고 그룹을 만들고 채팅하고 시합을 주최할 수 있습니다.<br />모든 서비스는 무료입니다.</p>

		<div id="userNumbers">

			<span id="iAccountsInGame">647,964 게임 중</span> &nbsp;&nbsp;|&nbsp;&nbsp;

			<span id="iAccountsOnline">4,379,529 온라인</span>

		</div>

			

	</div>

	<div id="lowerContents">

		<div id="lowerRightContents">

			<div id="rightActionBlockHeader"><img src="<%=request.getContextPath()%>/common/images/trans.gif" width="254" height="8" border="0" /></div>

			<div id="rightActionBlock">

				<form action="#" method="POST" name="logon" id="loginForm" onsubmit="DoLogin(); return false;">

					<input type="hidden" name="redir" value="http://steamcommunity.com/actions/RedirectToHome">

					<input type="hidden" name="msg" value="">

					<input type="hidden" name="emailauth" id="emailauth" value="">

					<input type="hidden" name="emailsteamid" id="emailsteamid">

					<label for="steamAccountName">Steam 사용자 이름:</label>

					<input class="textField" type="text" name="username" id="steamAccountName" maxlength="64" /><br />

					<label for="steamPassword">비밀번호:</label>

					<input class="textField" type="password" name="password" id="steamPassword" autocomplete="off" maxlength="64" /><br />

					<div id="captcha_entry" style="display: none;">

						<input type="hidden" id="captchagid" name="captchagid" value="-1" />

						<div id="CaptchaFormArea">

						<label id="captchaLabel">사용자 확인 텍스트:</label><span id="captchaRefresh"><img src="<%=request.getContextPath()%>/common/images//skin_1/blue_refresh_icon.png" id="captchaRefreshImg" border="0" onClick="RefreshCaptcha();return false;" />&nbsp;<a href="#" id="captchaRefreshLink" title="Refresh" onClick="RefreshCaptcha();return false;">Refresh</a></span>

						<img id="captchaImg" src="https://steamcommunity.com/public/captcha.php?gid=-1" border="0" /><br />

						<input class="textField" type="text" name="captcha_text" id="input_captcha" autocomplete="off" /><br />

						<label class="smallLabel" id="captchaExplanation">실제 사용자라는 것을 확인할 수 있도록 위에 표시된 내용을 입력해 주십시오.</label>

						</div>

					</div>

					<div id="login_btn_signin">

						<input class="subImage" type="image" id="imageLogin" onMouseover="iSwap('imageLogin','skin_1/buttonLoginOver.gif')" onMouseout="iSwap('imageLogin','skin_1/buttonLogin.gif')" src="<%=request.getContextPath()%>/common/images/buttonLogin.gif" width="104" height="25" border="0"/>

					</div>

					<div id="login_btn_wait" style="display: none;">

						<img src="<%=request.getContextPath()%>/common/images/throbber.gif">

					</div>

				</form>

				<h2 id="error_display" style="display: none;"></h2>

			</div>

			<div id="rightActionBlockFooter"><img src="<%=request.getContextPath()%>/common/images/trans.gif" width="254" height="8" border="0" /></div>



			<div class="rightLowBlockHeader"><img src="<%=request.getContextPath()%>/common/images/trans.gif" width="254" height="8" border="0" /></div>

				<div class="rightLowBlock">

					<h2>무료로 Steam에 가입하세요!</h2>

					<p><a class="linkStandard" href="http://store.steampowered.com/about/" target="_blank">Steam에 대해 더 알아보기</a></p>

					<p><a class="linkStandard" href="http://steamcommunity.com/actions/GroupList">기존 그룹 검색</a></p>

					

				</div>

			<div class="rightLowBlockFooter"><img src="<%=request.getContextPath()%>/common/images/trans.gif" width="254" height="8" border="0" /></div>



			<div class="rightLowBlockHeader"><img src="<%=request.getContextPath()%>/common/images/trans.gif" width="254" height="8" border="0" /></div>

				<div class="rightLowBlock">

					<p class="ulTitle">Steam 커뮤니티의 다양한 기능...</p>

					<ul>

						<li>사용자 프로필 페이지 만들기</li>

						<li>그룹 만들기 및 참가</li>

						<li>온라인 및 게임 중인 친구들을 쉽게 볼수 있습니다</li>

						<li>시합 및 이벤트 일정 관리</li>

						<li>최근에 함께 플레이한 사용자 확인</li>

						<li>게임 플레이 통계 추적</li>

						<li>그룹 채팅</li>

						<li>게임 내외에서 음성 채팅</li>

					</ul>

				</div>

			<div class="rightLowBlockFooter"><img src="<%=request.getContextPath()%>/common/images/trans.gif" width="254" height="8" border="0" /></div>



		</div>

		<div id="lowerLeftContents" style="background-image:url(<%=request.getContextPath()%>/common/images/homeMessaging/homeMessaging_12.jpg); cursor: pointer;" onclick="top.location.href='http://steamcommunity.com/workshop'">

			<div id="lowerLeftColLeft">

				<div id="lowerLeftColRight">

					<h2>이미 계정을 갖고계십니까?</h2>

					<div class="halfBreak"><img src="<%=request.getContextPath()%>/common/images/homeBoxHalfBreak.gif" width="315" height="1" border="0" /></div>

					한 단계만 더 거치면 정식 회원이 되실 수 있습니다. <a href="steam://open/main">Steam에 로그인</a>하고 커뮤니티 탭을 클릭하여 사용자 프로필 페이지를 설정해 주십시오.				</div>

				<h2>Steam에 처음 오셨습니까?</h2>

				<div class="halfBreak"><img src="<%=request.getContextPath()%>/common/images/homeBoxHalfBreak.gif" width="315" height="1" border="0" /></div>

				<a href="http://store.steampowered.com/about/">Steam에 무료로 가입</a>하고 정품 버전의 게임을 구매하여 데스크톱에 설치하면 자동 업데이트와 게임 내 커뮤니티 기능이 완벽하게 제공됩니다.				<br /><br />

				자세한 내용을 위해 <a id="tourSteam" href="http://www.steampowered.com/steamtour/" onClick="window.open(this.href, null, 'width=800,height=570');return false"> Steam을 둘러보세요. </a>			</div>



            <script type="text/javascript">

                Event.observe( 'tourSteam', 'click', function(event) { event.stop(); } );

            </script>

			

		</div>

		

	</div>

</div>

<!-- footer -->

<div id="footer">

	<div id="footerLogo"><img src="<%=request.getContextPath()%>/common/images/footerLogo.gif" width="94" height="26" border="0" alt="Valve 로고" /></div>

	<div id="footerText">

		&copy; Valve Corporation. 모든 권리 보유. 모든 상표는 미국 및 기타 국가에서 각각 해당 소유자의 재산입니다. 이 웹 사이트의 일부 지역정보 데이터는 <a href="http://www.geonames.org/">geonames.org</a>에서 제공합니다.			</div>



</div>

<!-- /footer -->



</center>





	<div id="loginAuthCodeModal" class="modal_frame" style="display:none; " >

		<div class="modal_top_band">

			<div class="modal_close"><a href="javascript:hideModal( 'loginAuthCodeModal' )"><img src="<%=request.getContextPath()%>/common/images/x9x9.gif" width="9" height="9" border="0" /></a></div>

		</div>

		<div class="modal_box">

			<div class="auth_message_area">

				<div id="auth_icon" class="auth_icon auth_icon_key">

				</div>

				<div class="auth_messages" id="auth_messages">

					<div class="auth_message" id="auth_message_entercode" style="display: none;">

						<h1>안녕하세요!</h1>

						<p>새 브라우저 또는 새 컴퓨터에서 Steam에 로그인하려 하시는 것 같군요. 아니면 오랜만에 접속하셨거나.......</p>

					</div>

					<div class="auth_message" id="auth_message_checkspam" style="display: none;">

						<h1>스팸함에 있지 않을까요?</h1>

						<p>스팸 메일함을 확인해 보셨습니까? 받은 메일함에 Steam 고객지원에서 보낸 메일이 없다면 스팸 메일함을 확인해 보십시오.</p>

					</div>

					<div class="auth_message" id="auth_message_success" style="display: none;">

						<h1>성공!</h1>

						<p>이제 이 브라우저 또는 이 컴퓨터에서 귀하의 Steam 계정을 사용할 수 있습니다.</p>

					</div>

					<div class="auth_message" id="auth_message_incorrectcode" style="display: none;">

						<h1>오, 이런!</h1>

						<p>죄송하지만, <br>입력하신 코드가 틀린 것 같네요.......</p>

					</div>

					<div class="auth_message" id="auth_message_help" style="display: none;">

						<h1>도와드릴게요!</h1>

						<p>문제를 겪게 해 드려 죄송합니다. Steam 계정에 접속이 불가능하심을 확인하였으며, 도움을 드리려 노력하고 있습니다.</p>

					</div>

				</div>

			</div>

			<div id="auth_details_messages" class="auth_details_messages">

				<div class="auth_details" id="auth_details_entercode" style="display: none;">

					추가적인 보안 절차로써, 귀하의 메일 주소( <span id="emailauth_entercode_emaildomain"></span> )로 발송된 코드를 입력해 이 브라우저로부터의 접근을 허가해주셔야 합니다.				</div>

				<div class="auth_details" id="auth_details_success" style="display: none;">

					공용 컴퓨터라면 브라우저를 종료할 때 Steam에서 꼭 로그아웃 해주세요.				</div>

				<div class="auth_details" id="auth_details_help" style="display: none;">

					Steam 고객지원에 문의하셔서 저희 직원의 도움을 받으십시오. 귀하의 계정 접근과 관련된 정당한 요청은 저희가 가장 중요하게 다루는 사안입니다.				</div>

			</div>

			<div class="authcode_entry_area">

				<div id="authcode_entry">

					<div class="authcode_entry_box">

						<form action="#" method="POST" onsubmit="javascript:SubmitAuthCode(); return false;"

																>

							<input class="authcode_entry_input defaulttext" id="authcode" type="text" value="여기에 코드를 입력해주세요" onfocus="javascript:OnAuthcodeFocus( '여기에 코드를 입력해주세요');" onblur="javascript:OnAuthcodeBlur( '여기에 코드를 입력해주세요');">

						</form>

					</div>

				</div>

				<div id="authcode_help_supportlink">

					<a href="https://support.steampowered.com/kb_article.php?ref=8232-WSGZ-8021&auth=b7ecc37bd8f4a297efbafdce3d00a564"

														>계정 접근과 관련하여 Steam 고객 지원에 도움 요청하기</a>

				</div>

			</div>

			<div class="modal_buttons" id="auth_buttonsets">

				<div class="auth_buttonset" id="auth_buttonset_entercode" style="display: none;">

					<a href="javascript:SubmitAuthCode();" class="auth_button leftbtn">

						<h3>메일을 받았습니다</h3>

						<h5>그리고 위에 승인 코드를 입력했습니다</h5>

					</a>

					<a href="javascript:SetEmailAuthModalState( 'checkspam' );" class="auth_button">

						<h3>무슨 메일이요?</h3>

						<h5>Steam 고객지원에서 아무런 메일도 받지 못했는데요......</h5>

					</a>

					<div style="clear: left;"></div>

				</div>

				<div class="auth_buttonset" id="auth_buttonset_checkspam" style="display: none;">

					<a href="javascript:SubmitAuthCode();" class="auth_button leftbtn">

						<h3>찾았습니다!</h3>

						<h5>그리고 위에 승인 코드를 입력했습니다</h5>

					</a>

					<a href="javascript:SetEmailAuthModalState( 'help' );" class="auth_button">

						<h3>여전히 안 보여요......</h3>

						<h5>Steam 고객지원에서 아무런 메일도 받지 못했습니다......</h5>

					</a>

					<div style="clear: left;"></div>

				</div>

				<div class="auth_buttonset" id="auth_buttonset_success" style="display: none;">

					<div class="auth_button auth_button_spacer">

					</div>

					<a href="javascript:LoginComplete();" class="auth_button" id="success_continue_btn">

						<h3 style="padding-top: 20px;">Steam으로 접속합니다!</h3>

					</a>

					<div style="clear: left;"></div>

				</div>

				<div class="auth_buttonset" id="auth_buttonset_incorrectcode" style="display: none;">

					<a href="javascript:SubmitAuthCode();" class="auth_button leftbtn">

						<h3>다시 해 볼게요</h3>

						<h5>그리고 위에 승인 코드를 다시 입력했습니다</h5>

					</a>

					<a href="javascript:SetEmailAuthModalState( 'help' );" class="auth_button">

						<h3>도와주세요</h3>

						<h5>Steam 고객지원의 도움이 필요할 것 같습니다.......</h5>

					</a>

					<div style="clear: left;"></div>

				</div>

				<div class="auth_buttonset" id="auth_buttonset_waiting" style="display: none;">

				</div>

			</div>

		</div>

	</div>

	

	<div id="loginIPTModal" class="modal_frame" style="display:none; top:0; left: 0">

		<div class="modal_top_band">

			<div class="modal_close"><a href="javascript:hideModal( 'loginIPTModal' )"><img src="<%=request.getContextPath()%>/common/images/x9x9.gif" width="9" height="9" border="0" /></a></div>

		</div>

		<div class="modal_box">

			<div class="auth_message_area">

				<div id="" class="auth_icon ipt_icon">

				</div>

				<div class="auth_messages" id="">

					<div class="auth_message" id="" >

						<h1>죄송합니다</h1>

						<p>추가적인 인증 없이는 이 컴퓨터에서 계정에 접근할 수 없습니다.</p>

					</div>

				</div>

			</div>

			<div id="" class="auth_details_messages">

				<div class="auth_details">

					Steam 고객 지원에 문의하시면 저희 직원 중 한 명이 귀하를 도와드릴 것입니다. 저희는 계정 접속에 대한 정당한 요청을 제일 먼저 처리할 수 있도록 노력하고 있습니다.				</div>

			</div>

			<div class="authcode_entry_area">

			</div>

			<div class="modal_buttons" id="">

				<div class="auth_buttonset" >

					<a href="https://support.steampowered.com/kb_article.php?ref=9400-IPAX-9398&auth=e39b5c227cffc8ae65414aba013e5fef" class="auth_button leftbtn"

														>

						<h3>더 알아보기</h3>

						<h5>Intel&reg; Identity Protection Technology에 대해서</h5>

					</a>

					<a href="https://support.steampowered.com" class="auth_button"

														>

						<h3>도와주세요</h3>

						<h5>Steam 고객지원의 도움이 필요한 것 같습니다......</h5>

					</a>

					<div style="clear: left;"></div>

				</div>

			</div>

		</div>

	</div>

	<div id="modalBG" style="display: none;"></div>



</body>

</html>
