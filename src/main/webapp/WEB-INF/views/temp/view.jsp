<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/daum/css/default.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/daum/css/20130115090146.7.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/jigu.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/suggest.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/util_gzip.js"></script>
<script type="text/javascript" id="imideo-extension-info">var imideo_extension=true;</script>
<script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/tiara.min.js"></script>
<script id="PersonalScript" type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/allcount_hdn"></script>
<script type="text/javascript" charset="utf-8" defer="" id="breakingNewsSearchCallBack" src="<%=request.getContextPath()%>/common/daum/js/breakingnews.js"></script>
<script language="javascript">
function goGo(){

	var c= window.confirm("삭제합니까?");
	if(c==true){
	alert("삭제합니다.");

	}else{
	alert("삭제안합니다.");
	}
	}
function checkSubmit() {
	
	
	
	
}
</script>

</head>

<body>


<h2>미니다음 영역</h2>
<div id="wrapMinidaum"><iframe id="__magic_frame" width="0px" height="0px" border="0" frameborder="0" scrolling="no" style="overflow:hidden; border:0; width:0px; height:0px;" src="<%=request.getContextPath()%>/common/daum/cafe/index.htm"></iframe><div id="minidaum"><div class="minidaum_gnb"><div id="minidaumUser" class="minidaum_login"><a href="http://profile.daum.net/" target="_top" id="minidaumNick">The Ma..님</a><div id="minidaumUserLayer" class="minidaum_layer"><p class="minidaum_logout"><a href="https://logins.daum.net/accounts/logout.do?url=http://www.daum.net/?nil_profile=logout" target="_top" id="btnMinidaumLogout">로그아웃</a></p><ul class="minidaum_mylayer minidaum_myservice"><li><a href="http://blog.daum.net/_blog/myBlog.do?nil_profile=mini&nil_src=myblog" target="_top">내블로그</a></li><li><a href="http://calendar.daum.net/?nil_profile=mini&nil_src=mycalendar" target="_top">내캘린더</a></li><li><a href="http://cloud.daum.net/?nil_profile=mini&nil_src=mycloud" target="_top">내클라우드</a></li></ul><ul class="minidaum_mylayer minidaum_myinfo"><li><a href="http://profile.daum.net/?nil_profile=mini&nil_src=profile" target="_top">프로필</a></li><li><a href="https://user.daum.net/modifyuser/modifyuser.daum?nil_profile=mini&nil_src=user">회원정보</a></li></ul><img src="<%=request.getContextPath()%>/common/daum/cafe/auth.gif" style="display:none"></div></div><h2 class="screen_out">서비스 바로가기</h2><div id="minidaumService"><ul class="minidaum_service_list"><li class="minidaum_top"><a href="http://www.daum.net/?nil_profile=mini&nil_src=daum" target="_top" class="minidaum_top_link">Daum</a></li><li id="minidaumMail" class="minidaum_mail"><a href="http://mail.daum.net/?nil_profile=mini&nil_src=mail" target="_top">메일</a><a href="http://mail.daum.net/?nil_profile=mini&nil_src=mail_alarm" target="_top" class="minidaum_count" id="minidaumMailCnt"> 99</a></li><li id="minidaumCafe" class="minidaum_cafe"><a href="http://cafe.daum.net/?nil_profile=mini&nil_src=cafe" target="_top">카페</a><a href="http://cafe.daum.net/_c21_/myalimi_main?nil_profile=mini&nil_src=cafe_alarm" target="_top" class="minidaum_count" id="minidaumCafeCnt"> 99</a></li><li class="minidaum_news"><a href="http://media.daum.net/?nil_profile=mini&nil_src=news" target="_top">뉴스</a></li><li class="minidaum_shopping"><a href="http://shopping.daum.net/main.daum?nil_profile=mini&nil_src=shophow">쇼핑</a></li></ul><a href="http://www.daum.net/doc/sitemap/" id="minidaumMore" target="_top">더보기</a></div><div id="minidaumMoreLayer" class="minidaum_layer"><span class="minidaum_idx minidaum_idx1"></span><ul class="minidaum_list_group minidaum_list_group1"><li><a href="http://game.daum.net/?nil_profile=mini&nil_src=game" target="_top">게임</a></li><li><a href="http://gamepack.game.daum.net/?nil_profile=mini&nil_src=gamepack" target="_top">게임팩</a></li><li><a href="http://finance.daum.net/?nil_profile=mini&nil_src=finance" target="_top">금융</a></li><li><a href="http://weather.media.daum.net/?nil_profile=mini&nil_src=weather" target="_top">날씨</a></li><li><a href="http://tvnews.media.daum.net/?nil_profile=mini&nil_src=news" target="_top">뉴스</a></li><li><a href="http://media.daum.net/life?nil_profile=mini&nil_src=life" target="_top">라이프</a></li><li><a href="http://local.daum.net/map/index.jsp?cx=494917&cy=1128521&level=6&panoid=107438&pan=348.6&tilt=-8.6&map_type=TYPE_SKYVIEW&map_hybrid=true&map_attribute=ROADVIEW&screenMode=normal&nil_profile=mini&nil_src=roadview" target="_top">로드뷰</a></li><li><a href="http://ruliweb.daum.net/?nil_profile=mini&nil_src=ruriweb" target="_top">루리웹</a></li></ul> <span class="minidaum_idx minidaum_idx2"></span><ul class="minidaum_list_group minidaum_list_group2"><li><a href="http://mypeople.daum.net/?nil_profile=mini&nil_src=mypeople" target="_top">마이피플</a></li><li><a href="http://cartoon.media.daum.net/?nil_profile=mini&nil_src=cartoon" target="_top">만화속세상</a></li><li><a href="http://mobile.daum.net/?nil_profile=mini&nil_src=mobile" target="_top">모바일</a></li><li><a href="http://mail.daum.net/hanmail/mobile/MsgComposeExpress.daum?nil_profile=mini&nil_src=sms" target="_top">문자</a></li><li><a href="http://music.daum.net/?nil_profile=mini&nil_src=music" target="_top">뮤직</a></li><li><a href="http://miznet.daum.net/?nil_profile=mini&nil_src=miznet" target="_top">미즈넷</a></li><li><a href="http://v.daum.net/?nil_profile=mini&nil_src=view" target="_top">view</a></li><li><a href="http://blog.daum.net/?nil_profile=mini&nil_src=blog" target="_top">블로그</a></li></ul> <span class="minidaum_idx minidaum_idx3"></span><ul class="minidaum_list_group minidaum_list_group3"><li><a href="http://social.shopping.daum.net/main.daum?nil_profile=mini&nil_src=socialshopping" target="_top">소셜쇼핑</a></li><li><a href="http://sports.media.daum.net/?nil_profile=mini&nil_src=sports" target="_top">스포츠</a></li><li><a href="http://agora.media.daum.net/?nil_profile=mini&nil_src=agora" target="_top">아고라</a></li><li><a href="http://alldic.daum.net/?nil_profile=mini&nil_src=dictionary" target="_top">어학사전</a></li><li><a href="http://travel.daum.net/main.daum?nil_profile=mini&nil_src=travel" target="_top">여행</a></li><li><a href="http://movie.daum.net/?nil_profile=mini&nil_src=movie" target="_top">영화</a></li><li><a href="http://yozm.daum.net/?nil_profile=mini&nil_src=yozm" target="_top">요즘</a></li><li><a href="http://fortune.daum.net/?nil_profile=mini&nil_src=fortune" target="_top">운세</a></li></ul> <span class="minidaum_idx minidaum_idx4"></span><ul class="minidaum_list_group minidaum_list_group4"><li><a href="http://auto.daum.net/?nil_profile=mini&nil_src=auto" target="_top">자동차</a></li><li><a href="http://stock.daum.net/?nil_profile=mini&nil_src=stock" target="_top">증권</a></li><li><a href="http://local.daum.net/map/?nil_profile=mini&nil_src=map" target="_top">지도</a></li><li><a href="http://k.daum.net/qna/index.html?nil_profile=mini&nil_src=knowledge" target="_top">지식</a></li><li><a href="http://ebs.daum.net/?nil_profile=mini&nil_src=ebs" target="_top">EBS지식</a></li><li><a href="http://book.daum.net/?nil_profile=mini&nil_src=book" target="_top">책</a></li><li><a href="http://k.daum.net/qna/item/fstudy/?nil_profile=mini&nil_src=study" target="_top">체험학습</a></li><li><a href="http://job.daum.net/?nil_profile=mini&nil_src=job" target="_top">취업</a></li></ul> <span class="minidaum_idx minidaum_idx5"></span><ul class="minidaum_list_group minidaum_list_group5"> <li><a href="http://cafe.daum.net/?nil_profile=mini&nil_src=cafe" target="_top">카페</a></li><li><a href="http://cloud.daum.net/?nil_profile=mini&nil_src=cloud" target="_top">클라우드</a></li><li><a href="http://kids.daum.net/?nil_profile=mini&nil_src=kids" target="_top">키즈짱</a></li><li><a href="http://telzone.daum.net/?nil_profile=mini&nil_src=telzone" target="_top">텔존</a></li><li><a href="http://tvpot.daum.net/Top.do?nil_profile=mini&nil_src=tvpot" target="_top">tv팟</a></li><li><a href="http://www.tistory.com/?nil_profile=mini&nil_src=tistory" target="_top">티스토리</a></li><li><a href="http://hope.agora.media.daum.net/?nil_profile=mini&nil_src=hope" target="_top">희망해</a></li><li class="last minidaum_all"><a href="http://www.daum.net/doc/sitemap/?nil_profile=mini&nil_src=all" target="_top">전체보기</a></li></ul></div><div id="minidaumExtra"><a href="http://mobile.daum.net/" id="minidaumApps" target="_top">다음앱<span></span></a></div><span style="clear: left;"></span><div id="minidaumAppsLayer" class="minidaum_layer"></div></div><div id="minidaumRank"><span class="minidaum_rank_tit">실시간 이슈검색어</span><ol id="minidaumRankList" class="minidaum_rank_list"><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EA%B9%80%EC%9E%AC%EB%B2%94+%EA%B2%B0%ED%98%BC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword1" class="minidaum_word">김재범 결혼</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">96</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%8B%AC%EC%98%81%EC%84%AD&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword2" class="minidaum_word">심영섭</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">78</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%82%BC%EC%84%B1%ED%99%94%EC%9E%AC+%EB%8C%80%ED%95%9C%ED%95%AD%EA%B3%B5&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword3" class="minidaum_word">삼성화재 대한항공</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">13</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%BF%A8%EA%B9%8C%EB%8B%B9&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword4" class="minidaum_word">쿨까당</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">78</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%84%B1%EC%9E%AC%EA%B8%B0&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword5" class="minidaum_word">성재기</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">117</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EA%B9%80%EC%9B%90%EC%A4%80+%EA%B3%B5%EA%B0%9C%EA%B5%AC%ED%98%BC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword6" class="minidaum_word">김원준 공개구혼</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">34</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%84%9C%EC%9D%B8%EA%B5%AD+%EA%B2%BD%EC%B0%B0%EA%B0%80%EC%A1%B1&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword7" class="minidaum_word">서인국 경찰가족</a><span class="minidaum_status minidaum_new">new</span><span class="minidaum_num"></span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%B0%A8%EA%B5%AC%EC%B0%A8%EA%B5%AC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword8" class="minidaum_word">차구차구</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">234</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EB%B0%B1%EC%95%84%EC%97%B0+1%EC%9D%BC%EA%B8%B0%EC%9E%90&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword9" class="minidaum_word">백아연 1일기자</a><span class="minidaum_status minidaum_new">new</span><span class="minidaum_num"></span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%88%AD%EC%8B%A4%EB%8C%80&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword10" class="minidaum_word">숭실대</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">396</span></li><li class="minidaum_dummy"><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EA%B9%80%EC%9E%AC%EB%B2%94+%EA%B2%B0%ED%98%BC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword1" class="minidaum_word">김재범 결혼</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">96</span></li></ol></div></div></div><script src="<%=request.getContextPath()%>/common/daum/cafe/minidaum.jsa" charset="utf-8" type="text/javascript"></script>
<div id="cHeader" class="cafeHeader">

        <h1>
        <a class="daumLogo" href="http://www.daum.net/?nil_profile=daum&nil_src=cafe" title="Daum"><img src="<%=request.getContextPath()%>/common/daum/cafe/img_daum.gif" width="62" height="26" alt="Daum"></a>
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
    <form id="daumSearch" name="daumSearch" action="emailCheck" onsubmit="return checkSubmit(this)">
        <div class="searchbar">
            <p id="daumSearchOptionLayer"><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#+++" onclick="return false;">카페검색</a><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#+++name" onclick="return false;">카페이름</a><a href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#+++board" onclick="return false;">카페글</a></p><div class="option" id="daumSearchOption">카페검색</div>
            <select id="daumSearchOptionSelect" name="">
                <option value="">카페검색</option>
                <option value="name">카페이름</option>
                <option value="board">카페글</option>
            </select>
            <input type="text" class="search" id="q" name="email" autocomplete="off">
            <input type="button" id="daumSuggest" value="서제스트 보기" title="서제스트 보기">
        </div>
        <input type="hidden" name="" value="cafe">
        <input type="hidden" name="" value="section">
        <input type="hidden" name="" value="daumsec">
        <input type="hidden" name="" value="10">
        <input type="hidden" name="" value="vsearch">
        <input type="hidden" name="" value="cafe">       
        <input type="submit" id="daumBtnSearch" value="검색">
        <input type="button" id="daumBtnSearchAll" value="My소셜 검색" onclick="goMySocial();">
    </form>

        
    <h2>목차</h2>
    <div class="gnb">
        <!-- 로고데코 영역 -->
        <a href="http://hope.daum.net/accessory/bankbook/list.daum?fancafeflag=1&keepScroll=523" class="logodeco" style="width: 220px; height: 52px;" target="_new"><img src="<%=request.getContextPath()%>/common/daum/cafe/121220_cafetopbar.GIF" width="220" height="52" alt=""></a> 
<!-- 로고데코 영역 -->
        <ul id="cafe-gnb" class="mycafe
        ">
            <li class="cafehome"><a title="카페 홈" href="http://cafe.daum.net/?t__nil_navi=cafe">카페 홈</a></li>
            <li class="mycafe"><a title="내 카페" href="<%=request.getContextPath()%>/common/daum/cafe/Daum 카페.htm">내 카페</a></li>
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
	    <form action="https://logins.daum.net/accounts/login.do" method="post" accept-charset="utf-8" name="loginform" id="loginForm" autocomplete="off">
	        <input type="hidden" name="url" value="http://www.daum.net/?t__nil_top=login">
	        <input type="hidden" name="weblogin" value="1">
	        <fieldset class="#logoff">
	            <legend class="daumhide">로그인 폼</legend>
	            <label for="id" class="daumhide">아이디</label>
	            <input type="text" value="cgi-bin" title="아이디 입력" maxlength="50" tabindex="2" name="id" id="id" autocomplete="off">
	            <label for="inputPwd" class="daumhide">비밀번호</label>
	            <input type="password" value="" title="비밀번호 입력" maxlength="32" tabindex="3" name="pw" id="inputPwd" class="empty">
	            <input type="checkbox" title="아이디 저장" checked="checked" tabindex="4" name="saved_id" id="sid"><label id="lbSid" for="sid">ID저장</label>
	            <button type="submit" title="로그인" tabindex="5" id="loginSubmit"><span class="submit_desc">로그인</span></button>
	            <ul class="user">
	                <li class="user_li join"><a href="https://user.daum.net/joinuser/join_step1.do?t__nil_loginbox=registration" class="join_a #registration">회원가입</a></li>
	                <li class="user_li find"><a href="https://user.daum.net/finduser/findid.do?t__nil_loginbox=id" class="find_a #id">아이디</a><a href="https://user.daum.net/finduser/findpw.do?t__nil_loginbox=password" class="find_a pwd #password">비밀번호 찾기</a></li>
	            </ul>
	            <p class="setting">
	                <a href="https://logins.daum.net/accounts/authsetup.do?t__nil_loginbox=security" id="currentLevel" title="로그인 보안설정 자세히보기" class="currentLevel1">보안1단계</a>
	                <span id="radios">
	                <input type="radio" value="1" name="securityLevel" id="securityLevel1" class="daumhide"><label id="lbSecurityLevel1" for="securityLevel1" class="on">보안1단계</label>
	                <input type="radio" value="2" name="securityLevel" id="securityLevel2" class="daumhide"><label id="lbSecurityLevel2" for="securityLevel2" class="off">보안2단계</label>
	                <input type="radio" value="3" name="securityLevel" id="securityLevel3" class="daumhide"><label id="lbSecurityLevel3" for="securityLevel3">보안3단계</label>
	                </span>
	            </p>
	        </fieldset>
	    </form>
	</div><div id="your" class="#loginbox">
	    <h2 class="daumhide">로그인</h2>
	    <form action="https://logins.daum.net/accounts/login.do" method="post" accept-charset="utf-8" name="loginform" id="loginForm" autocomplete="off">
	        <input type="hidden" name="url" value="http://www.daum.net/?t__nil_top=login">
	        <input type="hidden" name="weblogin" value="1">
	        <fieldset class="#logoff">
	            <legend class="daumhide">로그인 폼</legend>
	            <label for="id" class="daumhide">아이디</label>
	            <input type="text" value="cgi-bin" title="아이디 입력" maxlength="50" tabindex="2" name="id" id="id" autocomplete="off">
	            <label for="inputPwd" class="daumhide">비밀번호</label>
	            <input type="password" value="" title="비밀번호 입력" maxlength="32" tabindex="3" name="pw" id="inputPwd" class="empty">
	            <input type="checkbox" title="아이디 저장" checked="checked" tabindex="4" name="saved_id" id="sid"><label id="lbSid" for="sid">ID저장</label>
	            <button type="submit" title="로그인" tabindex="5" id="loginSubmit"><span class="submit_desc">로그인</span></button>
	            <ul class="user">
	                <li class="user_li join"><a href="https://user.daum.net/joinuser/join_step1.do?t__nil_loginbox=registration" class="join_a #registration">회원가입</a></li>
	                <li class="user_li find"><a href="https://user.daum.net/finduser/findid.do?t__nil_loginbox=id" class="find_a #id">아이디</a><a href="https://user.daum.net/finduser/findpw.do?t__nil_loginbox=password" class="find_a pwd #password">비밀번호 찾기</a></li>
	            </ul>
	            <p class="setting">
	                <a href="https://logins.daum.net/accounts/authsetup.do?t__nil_loginbox=security" id="currentLevel" title="로그인 보안설정 자세히보기" class="currentLevel1">보안1단계</a>
	                <span id="radios">
	                <input type="radio" value="1" name="securityLevel" id="securityLevel1" class="daumhide"><label id="lbSecurityLevel1" for="securityLevel1" class="on">보안1단계</label>
	                <input type="radio" value="2" name="securityLevel" id="securityLevel2" class="daumhide"><label id="lbSecurityLevel2" for="securityLevel2" class="off">보안2단계</label>
	                <input type="radio" value="3" name="securityLevel" id="securityLevel3" class="daumhide"><label id="lbSecurityLevel3" for="securityLevel3">보안3단계</label>
	                </span>
	            </p>
	        </fieldset>
	    </form>
	</div>
    <div id="myCafeLeftMenu">
        <h3 class="menu_top"><a href="http://cafe.daum.net/_c21_/myalimi_main">내 카페 소식</a></h3>
        <h3><a href="http://cafe.daum.net/_c21_/myarticle_main">내가 쓴 글</a></h3>
        <h3 class="menu_cafe">
            <a class="link_mycafe" href="http://cafe.daum.net/_c21_/mycafelist_main">내 카페 목록</a>
            <a class="link_group" href="http://cafe.daum.net/_c21_/myalimi_main?t__nil_navi=mycafe#" onclick="popJoinGroupManagement(); return false;">관리</a>
        </h3>
        <h4 class="menu_favor">
            <img src="<%=request.getContextPath()%>/common/daum/cafe/img_blank2.gif" width="13" height="13" alt="" class="ico_favor vMid">&nbsp;<a href="http://cafe.daum.net/_c21_/mycafelist_favorite">자주가는 카페</a>
        </h4>
        <h4 class="menu_all">
            <img src="<%=request.getContextPath()%>/common/daum/cafe/img_blank2.gif" width="13" height="13" alt="" class="ico_cafeall vMid">&nbsp;<a href="http://cafe.daum.net/_c21_/mycafelist_main">전체보기</a>
        </h4>
        <ul class="mycafe_list">
                    <li class="last">
                <a href="http://cafe.daum.net/_c21_/mycafelist_main?joingrpid=1">
                    기본 그룹
                </a> &nbsp;<span class="count">(<span id="joinGroup1">51</span>)</span>
            </li>       
                </ul>
        <h3 class="mybackup">
            <a href="http://cafe.daum.net/_c21_/cafebackup_result?cmd=result&t__nil_menu=backup"><img src="<%=request.getContextPath()%>/common/daum/cafe/img_blank2.gif" width="13" height="13" alt="" class="ico_backup vMid"> 내글 백업</a>
        </h3>
        <div class="cafe_banner">
            <a href="http://intro.mobile.daum.net/sub.daum?cmd=cafeapp" target="_blank"><img src="<%=request.getContextPath()%>/common/daum/cafe/img_banner1.jpg" width="160" height="100" alt="다음카페어플"></a>
        </div>
        <p class="bottom_space"></p>
    </div>
</div><!-- end cLeftSmall -->
<div id="loadingLayer" style="display: none;">
    <div id="loadingIcon"><div id="loadingFlash"></div></div>
</div>
<div id="shortLoading" style="display: none;"><img src="<%=request.getContextPath()%>/common/daum/cafe/loading.gif" width="12" height="13" alt="로딩중"></div>
<!-- end loading layer --><script type="text/javascript">window.jstTemplates = new Object();</script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/mycafe-all.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/jst-all.js"></script>
    <script type="text/javascript">
    //<![CDATA[
    new ClientErrorHandler().install();
    new ServerErrorHandler().install();
    //]]>
    </script> 


<div id="wrap_sub_content" class="mycafeList" ">
    <div id="primaryContent">
        <table class="roundTable">
            <tbody class="pos_rel">
                <tr>
                    <td class="tlb" nowrap="">&nbsp;</td>
                    <td class="tcb" nowrap="">&nbsp;</td>
                    <td class="trb" nowrap="">&nbsp;</td>
                </tr>
                <tr class="pos_rel">
                    <td class="lb" nowrap="">&nbsp;</td>
                    <td class="cb pos_rel">
                        <!-- content start -->
                        <a name="bbs_list_title"></a>
                        
<h3 class="title">
                     <a href="" class="list_title_sub">★ …… 프 리 토 크☆</a><span class="bar2">|</span><span>축구 매니아들의 실시간 프리 토크^^</span>
                                     <span><a href="" target="_blank"><img src="ic_msn2.gif" width="128" height="19" alt="windows live 메신저 알림" class="vam imgL"></a></span>
                                            
                        <span><a id="btnShowRssMenu" class="rss p11" href="" target="_blank" onclick="showLayerMenu(&#39;RssLayer&#39;, &#39;btnShowRssMenu&#39;); return false;">구독하기</a></span>
        <div id="RssLayer" class="commLayer">
        <ul>    
            <li class="first"><a href="javascript:copyRssChannel('', false)">주소 복사하기</a></li>
            <li class="layer_dotline"></li>
            <li><a href="javascript:copyRssChannelToCafe('')">카페 RSS게시판</a></li>
            <li><a href="javascript:copyRssChannelToBlog('')" onclick="">블로그 알리미</a></li>
        </ul>
        </div>
            
</h3> 
                        <div class="list_btn_areaT">
                            <a href="/infoshop/bbs/form/bbs"
                            class="btn"><span class="btn_bg bg03"></span><span class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span>
                            </a> <span class="newdata_cnt"> &nbsp;새글 <strong class="txt_point">1877</strong> / 4437035</span> 
                            <div
                            class="list_tr_area"> <span class="hide_noti">
                            <input id="hideNotiCheck" type="checkbox" onclick="hideNotiItem(&#39;Jnt6&#39;, &#39;IC6M&#39;);">
                            <label for="hideNotiCheck">공지감추기</label>
                        </span>
 <span class="bar2">|</span> 
                                <a href="" id="viewListBtn"
                                onclick="showLayerMenu(&#39;viewListLayer&#39;,this.id, {top: 5});return false;">목록 20개</a><span class="arrow">▼</span>

                                <div id="viewListLayer" class="cafeLayer scroll">
                                    <ul>
                                        <li>
                                            <a href="" onclick="setListNum(10); return false;">10개</a>
                                        </li>
                                        <li>
                                            <a href="" onclick=" return false;">20개</a>
                                        </li>
                                        <li>
                                            <a href="" onclick="setListNum(30); return false;">30개</a>
                                        </li>
                                        <li>
                                            <a href="" onclick="setListNum(40); return false;">40개</a>
                                        </li>
                                        <li>
                                            <a href="" onclick="setListNum(50); return false;">50개</a>
                                        </li>
                                    </ul>
                                </div>
                        </div>
    </div>
    <form name="listForm" method="post">
        <input type="hidden" name="moveto" value="">
        <input type="hidden" name="changerolecode" value="">
        <table class="bbsList" summary="★ …… 프 리 토 크☆ - 축구 매니아들의 실시간 프리 토크^^">
            <caption>★ …… 프 리 토 크☆</caption>
            <thead>
                <tr>
                    <th></th>
                    <th nowrap="nowrap" class="header"></th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th nowrap="nowrap">작성일</th>
                    <th nowrap="nowrap">조회</th>
                    <th nowrap="nowrap">추천</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="num" nowrap="nowrap">공지
                        <br>
                    </td>
                    <td class="headcate txt_sub" nowrap="nowrap"></td>
                    <td class="subject">
                        <a href="" class="b"><b><font color="#FF5E00">지금만나러 갑니다 : 런던올림픽 축구대표팀&amp;대한민국 축구국가대표팀 수비수 윤석영선수</font></b>
                        </a>
                        <a href="javascript:;" onclick="viewShortCommentForUnifiedNotice(&#39;PGL&#39;, 284, &#39;&#39;); return false;"
                        class="txt_point num b">[119]</a>
                    </td>
                    <td class="nick">
                        <a href="javascript:;" onclick="showSideView(this, &#39;lVd.fYn6Egs0&#39;, &#39;&#39;, &#39;\uB9CC\uCE58\uB2C8\uC5B4\uB51C\uB9CC\uCE58\uB2C8&#39;); return false;">만치니어딜만치니</a>
                    </td>
                    <td class="date" nowrap="nowrap">13.01.11</td>
                    <td class="count" nowrap="nowrap">14700</td>
                    <td class="recommend_cnt" nowrap="nowrap">28</td>
                </tr>
                <!-- 공지기능 적용끝 -->
                <c:forEach var="info" items="${tableslist}" varStatus="c">
                <tr>
                    <td class="num" nowrap="nowrap">${info.SEQ}</td>
                    <td class="headcate txt_sub" nowrap="nowrap"></td>
                    <td class="subject">
                        <a href="http://cafe971.daum.net/_c21_/bbs_read?grpid=Jnt6&mgrpid=&fldid=IC6M&page=1&prev_page=0&firstbbsdepth=0THrXzzzzzzzzzzzzzzzzzzzzzzzzz&lastbbsdepth=zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz&contentval=0THrszzzzzzzzzzzzzzzzzzzzzzzzz&datanum=6980200&listnum=20">
                            <img src="ico_mobile.gif" width="8" height="12" alt="모바일 작성글" class="icon_mobile">${info.SUBJECT}</a>
                        <img src="img_blank2.gif" width="8" height="12" alt="새글" class="icon_new">
                    </td>
                    <td class="nick">
                        <a href="javascript:;" onclick="showSideView(this, &#39;gngtdM1O8gk0&#39;, &#39;&#39;, &#39;\uAC15 \uC2B9 \uC870&#39;); return false;">${info.WRITER}</a>
                    </td>
                    <td class="date" nowrap="nowrap">${info.WTIME}</td>
                    <td class="count" nowrap="nowrap">${info.HIT}</td>
                    <td class="recommend_cnt" nowrap="nowrap">0</td>
                </tr>
                </c:forEach> 
            </tbody>
        </table>
        <!-- end bbsList -->
        <input type="hidden" name="grpid" value="Jnt6">
        <input type="hidden" name="fldid" value="IC6M">
        <input type="hidden" name="firstbbsdepth">
        <input type="hidden" name="lastbbsdepth">
        <input type="hidden" name="page">
        <input type="hidden" name="prev_page">
    </form>
    <div class="list_btn_area">
        <a href="http://cafe971.daum.net/_c21_/bbs_list?grpid=Jnt6&mgrpid=&fldid=IC6M&firstbbsdepth=0THrXzzzzzzzzzzzzzzzzzzzzzzzzz&lastbbsdepth=0THrDzzzzzzzzzzzzzzzzzzzzzzzzz&prev_page=2&page=1&listnum=20&sortType=#"
        onclick="caller(&#39;/_c21_/united_write?grpid=Jnt6&amp;mgrpid=&amp;fldid=IC6M&amp;page=1&#39;); return false;"
        class="btn"><span class="btn_bg bg03"></span><span class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span>
        </a>
        <div class="paging "> <span class="num_prev">
    <span class="arrow txt_sub">◀</span><span class="txt_sub">이전</span> </span>
            <a
            href="javascript:;" class="num_box txt_point u b">1</a>
                <a href="javascript:goPage(2);" class="num_box">2</a>
                <a href="javascript:goPage(3);" class="num_box">3</a>
                <a href="javascript:goPage(4);" class="num_box">4</a>
                <a href="javascript:goPage(5);" class="num_box">5</a> <span>...</span>

                <a href="javascript:goPage(221852)" class="num_box last_pg_box">221852</a>
<span class="num_next">
    <a href="javascript:goPage(10)">다음</a><span class="arrow">▶</span>
</span>
        </div>
        <!-- end paging -->
    </div>
    <!-- end list_btn_area -->
    <form name="pageForm" method="get">
        <input type="hidden" name="grpid" value="Jnt6">
        <input type="hidden" name="mgrpid" value="">
        <input type="hidden" name="fldid" value="IC6M">
        <input type="hidden" name="firstbbsdepth" value="0THrszzzzzzzzzzzzzzzzzzzzzzzzz">
        <input type="hidden" name="lastbbsdepth" value="0THrZzzzzzzzzzzzzzzzzzzzzzzzzz">
        <input type="hidden" name="page" value="">
        <input type="hidden" name="prev_page" value="1">
        <input type="hidden" name="listnum" value="20">
    </form>
    <div class="search_box_wrap search_box_bottom">
        <div class="search_box_floated_elem searchBox_bbsList_bottom">
            <select name="searchPeriod" class="inp" id="searchPeriod1" onchange="alert(1);">
                <option value="all">전체기간</option>
                <option value="aWeek">최근 1주</option>
                <option value="aMonth">최근 1달</option>
                <option value="#DURATION">직접 입력</option>
            </select>
            <div class="sel_body box bg" style="display: none;" id="s_b_61128939423240">
                <ul>
                    <li>
                        <a href="javascript:;" onclick="SelectMaker.clickEvent(61128939423240,&#39;all&#39;,&#39;전체기간&#39;)">전체기간</a>
                    </li>
                    <li>
                        <a href="javascript:;" onclick="SelectMaker.clickEvent(61128939423240,&#39;aWeek&#39;,&#39;최근 1주&#39;)">최근 1주</a>
                    </li>
                    <li>
                        <a href="javascript:;" onclick="SelectMaker.clickEvent(61128939423240,&#39;aMonth&#39;,&#39;최근 1달&#39;)">최근 1달</a>
                    </li>
                    <li>직접 입력
                        <br>
                        <p>
                            <input type="text" id="s_t_1_61128939423240" value="2012.10.17" class="inp">-
                            <input type="text" id="s_t_2_61128939423240" value="2013.01.17" class="inp">
                        </p>
                        <p class="button_set" onclick="SelectMaker.clickEvent(&#39;61128939423240&#39;, $(&#39;s_t_1_61128939423240&#39;).value + &#39;&#39; + $(&#39;s_t_2_61128939423240&#39;).value, null, &#39;#DURATION&#39;)"><span class="btn_bg bg08"></span><span class="btn_txt bt08 w03">확인</span>
                        </p>
                    </li>
                </ul>
            </div>
            <select id="item" name="item" class="inp" onchange="checkHeadCont(this); return false;">
                <option value="preview">게시글+댓글</option>
                <option disabled="">----------</option>
                <option value="subject">제목+내용</option>
                <option value="onlytitle">글제목</option>
                <option value="writer">글쓴이</option>
                <option value="no">글번호</option>
                <option value="filename">첨부파일명</option>
                <option disabled="">----------</option>
                <option value="cmtContent">댓글내용</option>
                <option value="cmtNicknameNgram">댓글작성자</option>
            </select>
            <select name="head" class="head_cont inp" style="display: none;"></select>
            <div class="suggest">
                <input type="text" name="query" id="query" size="22" class="inp query"
                onkeypress="blockKeyCode(event);" onkeydown="SearchUtil.checkKeyEvent(event);"
                autocomplete="off">
                <button>서제스트 버튼</button>
            </div>
            <a href="http://cafe971.daum.net/_c21_/bbs_list?grpid=Jnt6&mgrpid=&fldid=IC6M&firstbbsdepth=0THrXzzzzzzzzzzzzzzzzzzzzzzzzz&lastbbsdepth=0THrDzzzzzzzzzzzzzzzzzzzzzzzzz&prev_page=2&page=1&listnum=20&sortType=#"
            class="btn_search" onclick="SearchUtil.searchBBS(this); return false">
                <img src="img_blank2.gif" width="37" height="21" alt="검색">
            </a>
            <a href="http://cafe971.daum.net/_c21_/member_article_cafesearch?item=userid&grpid=Jnt6&fldid=IC6M"
            class="go_my_article my_article">내가 쓴 글/댓글 보기</a>
            <img src="n.gif" alt="new" class="my_article_new">
        </div>
        <!-- end cafeSearchBox -->
    </div>
    <form id="searchForm" name="searchForm" action="http://cafe971.daum.net/_c21_/cafesearch">
        <input type="hidden" name="grpid" value="Jnt6">
        <input type="hidden" name="mgrpid" value="">
        <input type="hidden" name="fldid" value="IC6M">
        <input type="hidden" name="pagenum" value="1">
        <input type="hidden" name="item" value="">
        <!-- 검색대상 - 제목+내용:subject, 글제목:onlytitle, 첨부파일명:filename, 글번호:no, 말머리:head
        -->
        <input type="hidden" name="query" value="">
        <!-- 검색 쿼리 -->
        <input type="hidden" name="attachfile_yn" value="">
        <!-- 첨부파일:A,B 여부 -->
        <input type="hidden" name="media_info" value="">
        <!-- 이미지:i, 동영상:m 첨부 -->
        <input type="hidden" name="viewtype" value="">
        <!-- 리스트 - 목록형:tit, 요약형:all -->
        <input type="hidden" name="searchPeriod" value="">
        <!-- 기간 format 2010.01.01-2010.12.31 -->
        <input type="hidden" name="sorttype" value="">
        <!-- 정렬방식 0:최신, 1:정확도, 2:댓글수 -->
        <input type="hidden" name="nickname" value="">
        <!-- 상세검색 - 글쓴이 -->
        <input type="hidden" name="listnum" value="20">
        <input type="hidden" name="head" value="">
        <input type="hidden" name="headsort" value="">
    </form>
    <!-- form for search area end -->
    <script type="text/javascript" src="suggest.min.js"></script>
    <script type="text/javascript">
        //<![CDATA[
        Suggest.init();
        daum.$$("select.[name=head]", document.body)[0].style.display = (daum.$("item").value == "head") ? "" : "none";
        var select_1 = new SelectMaker($('searchPeriod1'), 'sel', '2012.10.17', '2013.01.17');
        //]]>
    </script>
    <!-- content end -->
    </td>
    <td class="rb" nowrap="">&nbsp;</td>
    </tr>
    <tr>
        <td class="blb" nowrap="">&nbsp;</td>
        <td class="bcb" nowrap=""></td>
        <td class="brb" nowrap="">&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <!-- end roundTable -->
</div>
<!-- end primaryContent -->
</div>
<!-- end content -->
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
            <a href="<%=request.getContextPath()%>/bbs/bbs.html" target="_blank">즐거운 人터넷</a>
            <!-- <a href="" target="_blank">검색비공개요청</a> -->
            <p>Copyright (c) <a href="http://info.daum.net/">Daum Communications.</a> All rights reserved.</p>
        </div>
    </div>

    
</div>


<iframe name="proxyIframe" src="<%=request.getContextPath()%>/common/daum/cafe/suggestProxy.htm" style="display: none;" title="Suggest Proxy Frame"></iframe>

<div id="layerBreakingNewsSearch"></div>

</body>
</html>
