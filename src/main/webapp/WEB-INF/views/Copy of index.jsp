<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="ko-KR"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="ko-KR"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="ko-KR"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="ko-KR"> <!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>INFOSHOP</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/common/daum/css/common.css" type="text/css">

<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/jigu.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/suggest.min.js" charset="utf-8"></script>

<script type="text/javascript">//<![CDATA[
var __defchk = false; 
document.domain = "daum.net";
//]]></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/util_gzip.js"></script>
<script type="text/javascript" id="imideo-extension-info">var imideo_extension=true;</script>
<script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/tiara.min.js"></script>
<script id="PersonalScript" type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/allcount_hdn"></script>
<script type="text/javascript" charset="utf-8" defer="" id="breakingNewsSearchCallBack" src="<%=request.getContextPath()%>/common/daum/js/breakingnews.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/login.js"></script>
</head>
<body>


<h2>미니다음 영역</h2>
<div id="wrapMinidaum">
<iframe id="__magic_frame" width="0px" height="0px" border="0" frameborder="0" scrolling="no" style="overflow:hidden; border:0; width:0px; height:0px;" src="./Daum 카페_files/index.htm"></iframe>
<div id="minidaum">
        <div class="minidaum_gnb">
    <div id="minidaumUser" class="minidaum_login">
        <a href="http://profile.daum.net/" target="_top" id="minidaumNick">${userName}</a>
        <div id="minidaumUserLayer" class="minidaum_layer">
            <p class="minidaum_logout">
                <a href="https://logins.daum.net/accounts/logout.do?url=http://www.daum.net/?nil_profile=logout" target="_top" id="btnMinidaumLogout">로그아웃</a>
            </p>
            <ul class="minidaum_mylayer minidaum_myservice">
                <li><a href="http://blog.daum.net/_blog/myBlog.do?nil_profile=mini&amp;nil_src=myblog" target="_top">내블로그</a></li>
                <li><a href="http://calendar.daum.net/?nil_profile=mini&amp;nil_src=mycalendar" target="_top">내캘린더</a></li>
                <li><a href="http://cloud.daum.net/?nil_profile=mini&amp;nil_src=mycloud" target="_top">내클라우드</a></li>
            </ul>
            <ul class="minidaum_mylayer minidaum_myinfo">
                <li><a href="http://profile.daum.net/?nil_profile=mini&amp;nil_src=profile" target="_top">프로필</a></li>
                <li><a href="https://user.daum.net/modifyuser/modifyuser.daum?nil_profile=mini&amp;nil_src=user">회원정보</a></li>
            </ul>
            <img src="https://logins.daum.net/accounts/auth.gif" style="display:none">
        </div>
    </div>
    <h2 class="screen_out">서비스 바로가기</h2>
    <div id="minidaumService">
        <ul class="minidaum_service_list">
            <li class="minidaum_top"><a href="http://www.daum.net/?nil_profile=mini&amp;nil_src=daum" target="_top" class="minidaum_top_link">Daum</a></li>
            <li id="minidaumMail" class="minidaum_mail"><a href="http://mail.daum.net/?nil_profile=mini&amp;nil_src=mail" target="_top">메일</a><a href="http://mail.daum.net/?nil_profile=mini&amp;nil_src=mail_alarm" target="_top" class="minidaum_count" id="minidaumMailCnt"> 99</a></li>
            <li id="minidaumCafe" class="minidaum_cafe"><a href="http://cafe.daum.net/?nil_profile=mini&amp;nil_src=cafe" target="_top">카페</a><a href="http://cafe.daum.net/_c21_/myalimi_main?nil_profile=mini&amp;nil_src=cafe_alarm" target="_top" class="minidaum_count" id="minidaumCafeCnt"> 99</a></li>
            <li class="minidaum_news"><a href="http://media.daum.net/?nil_profile=mini&amp;nil_src=news" target="_top">뉴스</a></li>
            <li class="minidaum_shopping"><a href="http://shopping.daum.net/main.daum?nil_profile=mini&amp;nil_src=shophow">쇼핑</a></li>
        </ul>
    </div>
    <div id="minidaumExtra">
        <a href="http://mobile.daum.net/" id="minidaumApps" target="_top">다음앱<span></span></a>
    </div>
    <span style="clear: left;"></span>
</div>
</div>        
<div id="minidaumRank"> </div>

</div>
<script src="<%=request.getContextPath()%>/common/daum/cafe/minidaum.jsa" charset="utf-8" type="text/javascript"></script>
<div id="cHeader" class="cafeHeader">

        <h1>
        <a class="daumLogo" href="http://www.daum.net/?nil_profile=daum&nil_src=cafe" title="Daum"><img src="./Daum 카페_files/img_daum.gif" width="62" height="26" alt="Daum"></a>
        <a class="serviceLogo" href="http://cafe.daum.net/?nil_profile=title&nil_src=cafe" title="카페">카페</a>
    </h1>
    <h2>관련 서비스</h2>
    <ul class="relatedsvcs">
        <li class="blog"><a href="http://blog.daum.net/?t__nil_logo=blog" title="블로그">블로그</a></li>
        <li class="tistory"><a href="http://www.tistory.com/?t__nil_navi=tistory" target="_blank" title="티스토리">티스토리</a></li>
        <li class="view"><a href="http://v.daum.net/?t__nil_navi=view" title="뷰">뷰</a></li>
        <li class="yozm"><a href="http://yozm.daum.net/?t__nil_navi=yozm" title="yozm">yozm</a></li>
        <li class="widgetbank"><a href="http://widgetbank.daum.net/?t__nil_navi=widgetbank" title="위젯뱅크">위젯뱅크</a></li>
    </ul>
    <h2>검색</h2>
    <form id="daumSearch" name="daumSearch" action="" onsubmit="return checkSubmit(this)">
        <div class="searchbar">
            <p id="daumSearchOptionLayer"><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#+++" onclick="return false;">카페검색</a><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#+++name" onclick="return false;">카페이름</a><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#+++board" onclick="return false;">카페글</a></p><div class="option" id="daumSearchOption">카페검색</div>
            <select id="daumSearchOptionSelect" name="m">
                <option value="">카페검색</option>
                <option value="name">카페이름</option>
                <option value="board">카페글</option>
            </select>
            <input type="text" class="search" id="q" name="q" autocomplete="off">
            <input type="button" id="daumSuggest" value="서제스트 보기" title="서제스트 보기">
        </div>
        <input type="hidden" name="w" value="cafe">
        <input type="hidden" name="f" value="section">
        <input type="hidden" name="SA" value="daumsec">
        <input type="hidden" name="lpp" value="10">
        <input type="hidden" name="nil_profile" value="vsearch">
        <input type="hidden" name="nil_src" value="cafe">       
        <input type="button" id="daumBtnSearch" value="검색" onclick="goSearch();">
        <input type="button" id="daumBtnSearchAll" value="My소셜 검색" onclick="goMySocial();">
    </form>

        
    <h2>목차</h2>
    <div class="gnb">
        <!-- 로고데코 영역 -->
        <a href="http://hope.daum.net/accessory/bankbook/list.daum?fancafeflag=1&keepScroll=523" class="logodeco" style="width: 220px; height: 52px;" target="_new"><img src="./Daum 카페_files/121220_cafetopbar.GIF" width="220" height="52" alt=""></a> 
<!-- 로고데코 영역 -->
        <ul id="cafe-gnb" class="mycafe
        ">
            <li class="cafehome"><a title="카페 홈" href="http://cafe.daum.net/?t__nil_navi=cafe">카페 홈</a></li>
            <li class="mycafe"><a title="내 카페" href="./Daum 카페_files/Daum 카페.htm">내 카페</a></li>
            <li class="cafecategory"><a title="카테고리" href="http://cafe.daum.net/_ranking/rank_top100_1.html?t__nil_navi=cate">카테고리</a></li>
            <li class="vipcafe"><a title="우수카페" href="http://cafe.daum.net/_c21_/bestcafe?t__nil_navi=vipcafe">우수카페</a></li>
            <li class="fancafe"><a title="팬카페" href="http://cafe.daum.net/brand/brandstar.html?t__nil_navi=community">팬카페</a><em class="new">new</em></li>
            <li class="qnacafe"><a title="지식카페" href="http://cafe.daum.net/_c21_/official_qna_cafe?t__nil_navi=officialqna">지식카페</a></li>
            <li class="cafeskin"><a title="카페스킨" href="http://cafe.daum.net/_c21_/recommset_list?t__nil_navi=recommset">카페스킨</a></li>
            <li class="cafegame"><a title="카페게임" href="http://cafe.daum.net/_c21_/game_home?t__nil_navi=cafegame">카페게임</a></li>
        </ul>
    </div>


</div>

<div id="cSubWrap" class="smallWidthBack">

<div id="cLeftSmall">
	<div id="your" class="#loginbox">
	    
	<h2 class="daumhide">로그인</h2>
	
	    <form action="" method="post" accept-charset="utf-8" name="loginform" id="loginForm">
	        <input type="hidden" name="url" value="http://www.daum.net/?t__nil_top=login">
	        <input type="hidden" name="weblogin" value="1">
	        <fieldset class="#logoff">
	            <legend class="daumhide">로그인 폼</legend>
	            <label for="id" class="daumhide">아이디</label>
	            <input type="text" value="cgi-bin" title="아이디 입력" maxlength="50" tabindex="2" name="id" id="id" autocomplete="off">
	            <label for="inputPwd" class="daumhide">비밀번호</label>
	            <input type="password" value="" title="비밀번호 입력" maxlength="32" tabindex="3" name="password" id="inputPwd" class="empty">
	            <input type="checkbox" title="아이디 저장" checked="checked" tabindex="4" name="saved_id" id="sid">
	            <label id="lbSid" for="sid">ID저장</label>
	            <button type="button" title="로그인" tabindex="5" id="loginSubmit" onclick="doLogin();"><span class="submit_desc">로그인</span>
	            </button>
	            <ul class="user">
	                <li class="user_li join">
	                    <a href="https://user.daum.net/joinuser/join_step1.do?t__nil_loginbox=registration"
	                    class="join_a #registration">회원가입</a>
	                </li>
	                <li class="user_li find">
	                    <a href="https://user.daum.net/finduser/findid.do?t__nil_loginbox=id"
	                    class="find_a #id">아이디</a>
	                    <a href="https://user.daum.net/finduser/findpw.do?t__nil_loginbox=password"
	                    class="find_a pwd #password">비밀번호 찾기</a>
	                </li>
	            </ul>
	            <p class="setting">
	                <a href="https://logins.daum.net/accounts/authsetup.do?t__nil_loginbox=security"
	                id="currentLevel" title="로그인 보안설정 자세히보기" class="currentLevel1">보안1단계</a>
	<span id="radios">
	<input type="radio" value="1" name="securityLevel" id="securityLevel1" class="daumhide"> <label id="lbSecurityLevel1" for="securityLevel1" class="on">보안1단계</label>
	<input type="radio" value="2" name="securityLevel" id="securityLevel2" class="daumhide"> <label id="lbSecurityLevel2" for="securityLevel2" class="off">보안2단계</label>
	<input type="radio" value="3" name="securityLevel" id="securityLevel3" class="daumhide"> <label id="lbSecurityLevel3" for="securityLevel3">보안3단계</label>
	</span>
	
	            </p>
	        </fieldset>
	    </form>
	</div>
	
	<!-- 로그인 정보 -->
	<div id="my" class="#loginbox" style="z-index: 1; display: none;">
	    <h2 class="daumhide">내정보</h2>
	    <form action="https://logins.daum.net/accounts/logout.do" method="post" name="logonForm" id="logoutForm">
	        <input type="hidden" name="url" id="url" value="http://www.daum.net/">
	        <div class="txt">
	            <a href="" class="daumname"><span id="userInfo"></span></a>
	            <a href="" class="myinfo">내정보</a>
	        </div>
	        <button type="submit" class="logout ir"><span class="ir_desc">로그아웃</span></button>
	    </form>
	    <h3 class="daumhide">기본 서비스</h3>
	    <ul class="svc">
	        <li class="svc_li mail #mail"><a href="" class="svc_name">메일</a><em><a href="" class="read">읽기</a>
	        </em></li>
	        <li class="svc_li note #msg"><a href="" class="svc_name">쪽지</a><em><a href="" class="cnt">38</a></em></li>
	        <li class="svc_li cloud #cloud"><a href="" class="svc_name">클라우드</a></li>
	    </ul>
	    <h3 class="daumhide">My 서비스 설정</h3>
	    <input type="checkbox" id="mySetting"><label for="mySetting" id="mySettingLabel" class="my_setting">설정</label>
	    <div id="mySvcSetting" class="content_wrap daumhide" style="display: none;">
	        <h4 class="title">순서변경</h4>
	        <p class="txt">
	            마우스를 이용하여 자주 쓰는 서비스를 내가 원하는 위치로 변경하실 수 있습니다.
	        </p>
	        <ul id="svcIconArea">
	            <li class="svc_icon cafe ir"><span class="ir_desc">카페</span></li>
	            <li class="svc_icon mypeople ir"><span class="ir_desc">마이피플</span></li>
	            <li class="svc_icon age ir"><span class="ir_desc">내또래</span></li>
	            <li class="svc_icon stock ir"><span class="ir_desc">증권</span></li>
	            <li class="svc_icon blog ir "><span class="ir_desc">블로그</span></li>
	            <li class="svc_icon tistory ir"><span class="ir_desc">티스토리</span></li>
	        </ul>
	        <button type="button" id="mySvcSave" class="save_btn ir"><span class="ir_desc">저장</span></button>
	        <button type="button" id="mySvcReset" class="reset_btn ir"><span class="ir_desc">초기화</span></button>
	        <button type="button" id="mySvcClose" class="close_btn ir"><span class="ir_desc">닫기</span></button>
	    </div>
	    <h3 id="mySvcMore" class="svc_more">My 서비스 리스트</h3>
	    <div id="svcWrap" class="svc_wrap" style="display: none;">
	        <ul id="mySvcList" class="" style="width: 528px;">
	            <li id="cafeTitle" class="svc_li cafe tab_1"><a href="" class="ir new #loginbox#cafe#title"><span class="ir_desc">카페</span></a><span class="daumhide">new</span></li>
	            <li id="mypeopleTitle" class="svc_li mypeople tab_2"><a href="" class="ir"><span class="ir_desc">마이피플</span></a></li>
	            <li id="ageTitle" class="svc_li age tab_3"><a href="http://www.daum.net/?src=age/dsp/age" class="ir"><span class="ir_desc">내또래</span></a>
	            </li>
	            <li id="stockTitle" class="svc_li stock tab_4"><a href="" class="ir"><span class="ir_desc">증권</span></a>
	            <!-- my -->
	            </li>
	            <li id="blogTitle" class="svc_li blog tab_5"><a href="" class="ir #loginbox#blog#title"><span class="ir_desc">블로그</span></a>
	            </li>
	            <li id="tistoryTitle" class="svc_li tistory tab_6"><a href="" class="ir #loginbox#tistory#title"><span class="ir_desc">티스토리</span></a></li>
	        </ul>
	    </div>
	    <div id="myContentWrap" class="content_wrap daumhide" style="display: none;">
	        <script type="text/javascript">
	//<![CDATA[
	document.writeln('<iframe src="about:blank" width="280" height="309" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" id="myContentFrame"></iframe>');
	//]]>
	        </script>
	        <iframe src="about:blank" width="280" height="309" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" id="myContentFrame">
	        </iframe>
	        <div id="myLoading" class="deactive">
	        </div>
	        <button type="button" id="myContentClose" class="close_btn">닫기</button>
	    </div>
	</div>
	<!-- 로그인정보 END -->
	
	<!-- 메뉴 -->
    <div id="myCafeLeftMenu">
        <h3 class="menu_top"><a href="http://cafe.daum.net/_c21_/myalimi_main">내 카페 소식</a></h3>
        <h3><a href="http://cafe.daum.net/_c21_/myarticle_main">내가 쓴 글</a></h3>
        <h3 class="menu_cafe">
            <a class="link_mycafe" href="http://cafe.daum.net/_c21_/mycafelist_main">내 카페 목록</a>
            <a class="link_group" href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#" onclick="popJoinGroupManagement(); return false;">관리</a>
        </h3>
        <h4 class="menu_favor">
            <img src="./Daum 카페_files/img_blank2.gif" width="13" height="13" alt="" class="ico_favor vMid">&nbsp;<a href="http://cafe.daum.net/_c21_/mycafelist_favorite">자주가는 카페</a>
        </h4>
        <h4 class="menu_all">
            <img src="./Daum 카페_files/img_blank2.gif" width="13" height="13" alt="" class="ico_cafeall vMid">&nbsp;<a href="http://cafe.daum.net/_c21_/mycafelist_main">전체보기</a>
        </h4>
        <ul class="mycafe_list">
                    <li class="last">
                <a href="http://cafe.daum.net/_c21_/mycafelist_main?joingrpid=1">
                    기본 그룹
                </a> &nbsp;<span class="count">(<span id="joinGroup1">51</span>)</span>
            </li>       
                </ul>
        <h3 class="mybackup">
            <a href="http://cafe.daum.net/_c21_/cafebackup_result?cmd=result&t__nil_menu=backup"><img src="./Daum 카페_files/img_blank2.gif" width="13" height="13" alt="" class="ico_backup vMid"> 내글 백업</a>
        </h3>
        <div class="cafe_banner">
            <a href="http://intro.mobile.daum.net/sub.daum?cmd=cafeapp" target="_blank"><img src="./Daum 카페_files/img_banner1.jpg" width="160" height="100" alt="다음카페어플"></a>
        </div>
        <p class="bottom_space"></p>
    </div>
</div><!-- end cLeftSmall -->
<div id="loadingLayer" style="display: none;">
    <div id="loadingIcon"><div id="loadingFlash"></div></div>
</div>
<div id="shortLoading" style="display: none;"><img src="./Daum 카페_files/loading.gif" width="12" height="13" alt="로딩중"></div>
<!-- end loading layer --><script type="text/javascript">window.jstTemplates = new Object();</script>
    <script type="text/javascript" src="./Daum 카페_files/mycafe-all.js"></script>
    <script type="text/javascript" src="./Daum 카페_files/jst-all.js"></script>
    <script type="text/javascript">
    //<![CDATA[
    new ClientErrorHandler().install();
    new ServerErrorHandler().install();
    //]]>
    </script> 
<style type="text/css">
#gameListViewer { border-bottom: 1px solid #D5D5D5; margin: 5px 0 27px 0; }
#gameListViewer li { height: 50px; padding: 12px 10px 12px 15px; border-bottom: 1px solid #E9E9E9; overflow: hidden; }
#gameListViewer li.empty { height: 105px; }
#gameListViewer li.lastLine { border-bottom: none 0; }
#gameListViewer li img.msgThumb { float: left; width:48px; height: 48px; border: 1px solid #DBDBDB; margin: 0 19px 0 0; }
#gameListViewer li .msgTit { height: 21px; padding: 8px 0 0 0; }
#gameListViewer li .msgTit .gameName { font-weight: bold; }
#gameListViewer li .userName { color: #6073E9; }
#gameListViewer li .gamemsg { height: 18px; }
#gameListViewer li .msgCont { float: left; color: #999; width: 500px; }
#gameListViewer li .msgCont a { color: #999; }
#gameListViewer li .msgCont .vBar { margin-left: 2px;}
#gameListViewer li .acceptGift { float: right; display: block; width: 74px; height: 23px; margin: 13px 0 0 0; background: url("http://i1.daumcdn.net/cafeimg/top7/cafe/btn_present.gif") no-repeat; text-indent: -1000em; overflow: hidden; }
</style>

<div id="wrap_sub_content" class="mycafeList">
    <div class="mycafe_title">
        <h3 class="mycafe_tit2">내 카페 소식</h3>
        <span class="vbar">|</span>
        <span class="desc">
            <img src="./Daum 카페_files/title_cafenews.gif" alt="내 카페 관련 소식을 알려드립니다.">
        </span>
    </div>  
    <ul id="myAlimiTab" class="tab_menu">
        <li><a id="alimiTab" class="activeAlimi">카페 활동 알림</a></li>
        <li><a id="visitTab" class="inactiveVisit">최근 방문한 카페</a></li>
        <li><a id="gameTab" class="inactiveGame">게임 활동 알림</a></li>
        <li class="line"></li>
    </ul>
    <!-- 카페 활동 알림 -->
    <div id="myAlimiViewer" style="display: block;">
        <div class="control_box">
            <ul id="myAlimiFilters" class="alimi_filters">
                
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#total" id="totalFilter" class="selected">전체 <strong id="alimiTotal">222</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#join">가입 <strong id="alimiJoin">0</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#roleup">등업 <strong id="alimiRoleup">0</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#comment">댓글 <strong id="alimiComment">205</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#reply">답글 <strong id="alimiReply">0</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#qareply">답변 <strong id="alimiQaReply">0</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#adoption">채택 <strong id="alimiAdoption">0</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#scrap">스크랩 <strong id="alimiScrap">17</strong></a></li>
                <li class="vbar">|</li>
                <li><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#escrow">거래 <strong id="alimiEscrow"> 0 </strong></a></li>
        </ul>       
            <span class="noti_message">30일 이내의 활동 알림</span>
        </div>
        <div id="myAlimiListViewer"><table class="noLineList">
<colgroup>
    <col width="60"><col width="170"><col width="340"><col width="70"><col width="33">
</colgroup>
<tbody>
    <tr>
        <td class="center">[댓글]</td>
        <td><a href="http://cafe.daum.net/WorldcupLove" class="cafe_link" target="_blank">I Love Socce...</a></td>
        <td>
                <a href="http://cafe.daum.net/WorldcupLove/IC6M/6977793" class="cafe_link" target="_blank">[좌표좀!!!!]
            에 <span>댓글[1]</span>이 달렸습니다.</a>
            
                <img src="./Daum 카페_files/ico_news.gif" alt="new">
        </td>
        <td class="date">13.01.16 23:40</td>
        <td><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#Jnt6|IC6M|6977793|BBS_COMMENTREPLY" class="delete_alimi">삭제</a></td>
    </tr>
    <tr>
        <td class="center">[댓글]</td>
        <td><a href="http://cafe.daum.net/WorldcupLove" class="cafe_link" target="_blank">I Love Socce...</a></td>
        <td>
                <a href="http://cafe.daum.net/WorldcupLove/BAOB/1508644" class="cafe_link" target="_blank">[마르세유에 있는거보면..]
            에 <span>댓글[1]</span>이 달렸습니다.</a>
            
        </td>
        <td class="date">13.01.15 12:03</td>
        <td><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#Jnt6|BAOB|1508644|BBS_COMMENTREPLY" class="delete_alimi">삭제</a></td>
    </tr>
</tbody>
</table></div>
        <div id="myAlimiPagingViewer" class="prevNextBtnPaging"><dl>
    <dt>
        <strong>1</strong>/10
    </dt>
    <dd>
        <a class="prev_btn_disable">이전</a>
         <a class="next_btn_enable">다음</a>
    </dd>
</dl></div>
    </div>
    
    <!-- 최근 방문한 카페 -->
    <div id="myVisitViewer" style="display: none;">
        <div class="control_box">
            <span class="visit_count">
                최근 방문한 카페 <strong id="visitCount" class="txt_point">40</strong>개
                <img id="recentVisitHelp" src="./Daum 카페_files/img_blank2.gif" alt="help" width="14" height="14" onmouseover="toggleHelpLayer(&#39;over&#39;, &#39;recentVisitHelpLayer&#39;);" onmouseout="toggleHelpLayer(&#39;out&#39;, &#39;recentVisitHelpLayer&#39;);">
                <p id="recentVisitHelpLayer" style="display: none;">최근방문카페가 40개 이상 있는 경우<br>최대 40개까지만 표시 됩니다.</p>
            </span>         
            <a class="delete_all_enable">전체삭제</a>           
        </div>
        <div id="myVisitListViewer"><table class="noLineList">
<colgroup>
    <col width="489"><col width="93"><col width="62"><col width="29">
</colgroup>
<tbody>
    <tr>
        <td><a href="http://cafe.daum.net/WorldcupLove" target="_blank">I Love Soccer (축구동영상)</a></td>
        <td class="member_info">
                회원
        </td>
        <td class="date">20:07</td>
        <td>
            <a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#Jnt6" class="delete_visitcafe">삭제</a>
        </td>
    </tr>
    <tr>
        <td><a href="http://cafe.daum.net/ssaumjil" target="_blank">이종격투기</a></td>
        <td class="member_info">
                손님 <span>|</span> <a href="http://cafe.daum.net/_c21_/joincafe?grpcode=ssaumjil" target="_blank">가입</a> 
        </td>
        <td class="date">13.01.16</td>
        <td>
            <a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#Uzlo" class="delete_visitcafe">삭제</a>
        </td>
    </tr>
</tbody>
</table></div>
        <div id="myVisitPagingViewer" class="prevNextBtnPaging"><dl>
    <dt>
        <strong>1</strong>/4
    </dt>
    <dd>
        <a class="prev_btn_disable">이전</a>
         <a class="next_btn_enable">다음</a>
    </dd>
</dl></div>
    </div>
    
    <!-- 게임 활동 알림 -->
    <div id="gameViewer" style="display: none;">
        <div class="control_box">
            <span class="visit_count">
                게임 활동 알림 <strong id="gameCount" class="txt_point"></strong>개
                <img id="gameNotiHelp" src="./Daum 카페_files/img_blank2.gif" alt="help" width="14" height="14" onmouseover="toggleHelpLayer(&#39;over&#39;, &#39;gameNotiHelpLayer&#39;);" onmouseout="toggleHelpLayer(&#39;out&#39;, &#39;gameNotiHelpLayer&#39;);">
                <p id="gameNotiHelpLayer" style="display: none;">전체 게임 알림 중 최근 알림이<br>최대 6개까지 표시됩니다.<br>지난 알림 확인 및 알림 지우기는<br>개별카페 카페게임의 게임알림탭에서<br>가능합니다.</p>
            </span>
        </div>
        <div id="gameListViewer"></div>
    </div>
    
    <!-- 내 카페 최신글  -->
    <div class="mycafe_title title_bottom">
        <h3 class="mycafe_tit4">내 카페 최신글</h3>
        <span class="vbar">|</span>             
        <span class="recent_desc">최근 업데이트된 카페 <strong class="txt_point ">8</strong>개</span>
    </div>
    <div class="admin_box">
        <select id="selectMyCafeList" class="fl">
                            <option value="CM3Korea">챔피온쉽 매니저 - 대한민국</option>
                            <option value="commouse">컴퓨터 마우스 동호회</option>
                            <option value="hardware">하드웨어 논하기</option>
                            <option value="Wrestling">WWE 레슬매니아</option>
                            <option value="WorldcupLove">I Love Soccer (축구동영상)</option>
                            <option value="FIFA2003roster">천배카페&amp;천배패치-PES2012(위닝2012),피파2012을 바꾸다!</option>
                            <option value="adidas2003">♡아디다스매니아♡</option>
                            <option value="mousesuri">마우스수리.G1수리.Logitech.MS.스틸.레이져.</option>
                            <option value="Mouse123">마우스튜닝샵</option>
                            </select>
        <img id="loadingImg2" style="display: none;" src="./Daum 카페_files/loading.gif" width="12" height="13" alt="로딩중">
        <span class="txt_friend">카페프렌즈 제외</span>
    </div>
    <table class="basicList2">
    <colgroup>
        <col width="145"><col width="322"><col width="134"><col width="72">
    </colgroup>
    <thead>
    <tr>
        <th>게시판</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>작성일</th>
    </tr>
    </thead>
    </table>
    <div id="myRecentListViewer"><table class="basicList2">
<colgroup>
    <col width="145"><col width="322"><col width="134"><col width="72">
</colgroup>
<tbody>
<tr>
    <td>감독 휴게실</td>
    <td>
        1
    </td>
    <td>레알감독무링요</td>
    <td class="date">20:06</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352631&contentval=05fsdzzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117200504" target="_blank">주식왕 이 케릭 좋은 건가요??
        </a>
    </td>
    <td>S.S.BlueWings</td>
    <td class="date">20:05</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352628&contentval=05fsazzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117195917" target="_blank">인생 가장 빠른 순간
            <span class="txt_point">[<b>2</b>]</span>
        </a>
    </td>
    <td>아돌프 히틀러</td>
    <td class="date">19:59</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352627&contentval=05fsZzzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117195452" target="_blank">아니 사람 호칭 부를때 지역마다 부르...
            <span class="txt_point">[<b>2</b>]</span>
        </a>
    </td>
    <td>커플망해라</td>
    <td class="date">19:54</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352626&contentval=05fsYzzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117195307" target="_blank">오늘 잘만하면 빡찬기 나오겠는데..ㅋ...
        </a>
    </td>
    <td>FM하자</td>
    <td class="date">19:53</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352625&contentval=05fsXzzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117195252" target="_blank">알싸 전여친 아버지에게 욕먹음.. 
            <span class="txt_point">[<b>3</b>]</span>
        </a>
    </td>
    <td>이러니</td>
    <td class="date">19:52</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352624&contentval=05fsWzzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117195224" target="_blank">FM13 하시는옹들
            <span class="txt_point">[<b>5</b>]</span>
        </a>
    </td>
    <td>간지♂</td>
    <td class="date">19:52</td>
</tr>
<tr>
    <td>감독 휴게실</td>
    <td>
        <a href="http://cafe307.daum.net/_c21_/recent_bbs_read?grpid=9nQ&fldid=CWi&datanum=1352623&contentval=05fsVzzzzzzzzzzzzzzzzzzzzzzzzz&regdt=20130117195218" target="_blank">천조국의 흔한 장난 전화..SWF
        </a>
    </td>
    <td>벡스의택배크로스</td>
    <td class="date">19:52</td>
</tr>
</tbody>
</table></div>
    <div id="myRecentPagingViewer" class="prevNextBtnPaging"><dl>
    <dt>
        <strong>1</strong>/4
    </dt>
    <dd>
        <a class="prev_btn_disable">이전</a>
         <a class="next_btn_enable">다음</a>
    </dd>
</dl></div>
</div>
<script type="text/javascript">
//<![CDATA[
    MyCafeController.init();
    MyCafeController.showAlimi();
    MyRecentListViewController.init();

    function toggleHelpLayer(type, layerID){
        var layer = $E(layerID);
        if(layer != null){          
            if(type == 'over') layer.show();
            else if(type == 'out') layer.hide();
        }
    } 
//]]>
</script>

            
        <br style="clear: both;">
    <div id="cBottom">
        <div id="cGuide">
            <div class="links">
                <h3>관련링크</h3>
                <ul>
                    <li class="first"><a href="http://cafe.daum.net/supporters?t__nil_menu=cafesupporters">카페 서포터즈</a></li>
                    <li><a href="http://cafe.daum.net/_clean/cleancafe.html?t__nil_menu=cleancafe">클린 카페</a></li>
                    <li><a href="http://army.daum.net/?t__nil_menu=army" target="_blank">육군 공식카페</a></li>
                    <li><a href="http://cafe.daum.net/brand/brandcafe.html?t__nil_menu=brandcafe">브랜드 카페</a></li>
                    <li><a href="http://intro.mobile.daum.net/sub.daum?cmd=cafe&t__nil_menu=mobilecafe" target="_blank">모바일 카페</a></li>
                    <li class="cafeMake"><a href="http://cafe.daum.net/make/cafe_make.html?t__nil_menu=cafemake">카페 만들기</a></li>
                </ul>
            </div>
            <div class="blogHelp">
                <h3>도움말</h3>
                <ul>
                    <li class="first"><a href="http://cs.daum.net/faq/site/36.html?t__nil_menu=cs">고객센터</a></li>
                    <li><a href="http://cs.daum.net/mail/form/36.html?t__nil_menu=csmall">문의하기</a></li>
                </ul>
            </div>
        </div>
        <div id="footer">
            <a href="http://www.daum.net/doc/info.html?t__nil_footer=info" class="first">서비스약관/정책</a>
            <a href="http://cs.daum.net/redbell/right.html?t__nil_footer=right">권리침해신고</a>
            <a href="http://cafe.daum.net/agreement/agreement_2010.html?t__nil_footer=agreement">이용약관</a>
            <a href="http://clean.daum.net/" target="_blank">즐거운 人터넷</a>
            <!-- <a href="" target="_blank">검색비공개요청</a> -->
            <p>Copyright (c) <a href="http://info.daum.net/">Daum Communications.</a> All rights reserved.</p>
        </div>
    </div>

    
</div>


<iframe name="proxyIframe" src="" style="display: none;" title="Suggest Proxy Frame"></iframe>

<div id="layerBreakingNewsSearch"></div>

</body>
</html>
