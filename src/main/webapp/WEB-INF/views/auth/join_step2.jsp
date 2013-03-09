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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/daum/css/joinuser.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/jigu.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/join.js"></script>

</head>

<body>


<h2>미니다음 영역</h2>
<div id="wrapMinidaum"><iframe id="__magic_frame" width="0px" height="0px" border="0" frameborder="0" scrolling="no" style="overflow:hidden; border:0; width:0px; height:0px;" src="<%=request.getContextPath()%>/common/daum/cafe/index.htm"></iframe><div id="minidaum"><div class="minidaum_gnb"><div id="minidaumUser" class="minidaum_login"><a href="http://profile.daum.net/" target="_top" id="minidaumNick">The Ma..님</a><div id="minidaumUserLayer" class="minidaum_layer"><p class="minidaum_logout"><a href="https://logins.daum.net/accounts/logout.do?url=http://www.daum.net/?nil_profile=logout" target="_top" id="btnMinidaumLogout">로그아웃</a></p><ul class="minidaum_mylayer minidaum_myservice"><li><a href="http://blog.daum.net/_blog/myBlog.do?nil_profile=mini&nil_src=myblog" target="_top">내블로그</a></li><li><a href="http://calendar.daum.net/?nil_profile=mini&nil_src=mycalendar" target="_top">내캘린더</a></li><li><a href="http://cloud.daum.net/?nil_profile=mini&nil_src=mycloud" target="_top">내클라우드</a></li></ul><ul class="minidaum_mylayer minidaum_myinfo"><li><a href="http://profile.daum.net/?nil_profile=mini&nil_src=profile" target="_top">프로필</a></li><li><a href="https://user.daum.net/modifyuser/modifyuser.daum?nil_profile=mini&nil_src=user">회원정보</a></li></ul><img src="<%=request.getContextPath()%>/common/daum/cafe/auth.gif" style="display:none"></div></div><h2 class="screen_out">서비스 바로가기</h2><div id="minidaumService"><ul class="minidaum_service_list"><li class="minidaum_top"><a href="http://www.daum.net/?nil_profile=mini&nil_src=daum" target="_top" class="minidaum_top_link">Daum</a></li><li id="minidaumMail" class="minidaum_mail"><a href="http://mail.daum.net/?nil_profile=mini&nil_src=mail" target="_top">메일</a><a href="http://mail.daum.net/?nil_profile=mini&nil_src=mail_alarm" target="_top" class="minidaum_count" id="minidaumMailCnt"> 99</a></li><li id="minidaumCafe" class="minidaum_cafe"><a href="http://cafe.daum.net/?nil_profile=mini&nil_src=cafe" target="_top">카페</a><a href="http://cafe.daum.net/_c21_/myalimi_main?nil_profile=mini&nil_src=cafe_alarm" target="_top" class="minidaum_count" id="minidaumCafeCnt"> 99</a></li><li class="minidaum_news"><a href="http://media.daum.net/?nil_profile=mini&nil_src=news" target="_top">뉴스</a></li><li class="minidaum_shopping"><a href="http://shopping.daum.net/main.daum?nil_profile=mini&nil_src=shophow">쇼핑</a></li></ul><a href="http://www.daum.net/doc/sitemap/" id="minidaumMore" target="_top">더보기</a></div><div id="minidaumMoreLayer" class="minidaum_layer"><span class="minidaum_idx minidaum_idx1"></span><ul class="minidaum_list_group minidaum_list_group1"><li><a href="http://game.daum.net/?nil_profile=mini&nil_src=game" target="_top">게임</a></li><li><a href="http://gamepack.game.daum.net/?nil_profile=mini&nil_src=gamepack" target="_top">게임팩</a></li><li><a href="http://finance.daum.net/?nil_profile=mini&nil_src=finance" target="_top">금융</a></li><li><a href="http://weather.media.daum.net/?nil_profile=mini&nil_src=weather" target="_top">날씨</a></li><li><a href="http://tvnews.media.daum.net/?nil_profile=mini&nil_src=news" target="_top">뉴스</a></li><li><a href="http://media.daum.net/life?nil_profile=mini&nil_src=life" target="_top">라이프</a></li><li><a href="http://local.daum.net/map/index.jsp?cx=494917&cy=1128521&level=6&panoid=107438&pan=348.6&tilt=-8.6&map_type=TYPE_SKYVIEW&map_hybrid=true&map_attribute=ROADVIEW&screenMode=normal&nil_profile=mini&nil_src=roadview" target="_top">로드뷰</a></li><li><a href="http://ruliweb.daum.net/?nil_profile=mini&nil_src=ruriweb" target="_top">루리웹</a></li></ul> <span class="minidaum_idx minidaum_idx2"></span><ul class="minidaum_list_group minidaum_list_group2"><li><a href="http://mypeople.daum.net/?nil_profile=mini&nil_src=mypeople" target="_top">마이피플</a></li><li><a href="http://cartoon.media.daum.net/?nil_profile=mini&nil_src=cartoon" target="_top">만화속세상</a></li><li><a href="http://mobile.daum.net/?nil_profile=mini&nil_src=mobile" target="_top">모바일</a></li><li><a href="http://mail.daum.net/hanmail/mobile/MsgComposeExpress.daum?nil_profile=mini&nil_src=sms" target="_top">문자</a></li><li><a href="http://music.daum.net/?nil_profile=mini&nil_src=music" target="_top">뮤직</a></li><li><a href="http://miznet.daum.net/?nil_profile=mini&nil_src=miznet" target="_top">미즈넷</a></li><li><a href="http://v.daum.net/?nil_profile=mini&nil_src=view" target="_top">view</a></li><li><a href="http://blog.daum.net/?nil_profile=mini&nil_src=blog" target="_top">블로그</a></li></ul> <span class="minidaum_idx minidaum_idx3"></span><ul class="minidaum_list_group minidaum_list_group3"><li><a href="http://social.shopping.daum.net/main.daum?nil_profile=mini&nil_src=socialshopping" target="_top">소셜쇼핑</a></li><li><a href="http://sports.media.daum.net/?nil_profile=mini&nil_src=sports" target="_top">스포츠</a></li><li><a href="http://agora.media.daum.net/?nil_profile=mini&nil_src=agora" target="_top">아고라</a></li><li><a href="http://alldic.daum.net/?nil_profile=mini&nil_src=dictionary" target="_top">어학사전</a></li><li><a href="http://travel.daum.net/main.daum?nil_profile=mini&nil_src=travel" target="_top">여행</a></li><li><a href="http://movie.daum.net/?nil_profile=mini&nil_src=movie" target="_top">영화</a></li><li><a href="http://yozm.daum.net/?nil_profile=mini&nil_src=yozm" target="_top">요즘</a></li><li><a href="http://fortune.daum.net/?nil_profile=mini&nil_src=fortune" target="_top">운세</a></li></ul> <span class="minidaum_idx minidaum_idx4"></span><ul class="minidaum_list_group minidaum_list_group4"><li><a href="http://auto.daum.net/?nil_profile=mini&nil_src=auto" target="_top">자동차</a></li><li><a href="http://stock.daum.net/?nil_profile=mini&nil_src=stock" target="_top">증권</a></li><li><a href="http://local.daum.net/map/?nil_profile=mini&nil_src=map" target="_top">지도</a></li><li><a href="http://k.daum.net/qna/index.html?nil_profile=mini&nil_src=knowledge" target="_top">지식</a></li><li><a href="http://ebs.daum.net/?nil_profile=mini&nil_src=ebs" target="_top">EBS지식</a></li><li><a href="http://book.daum.net/?nil_profile=mini&nil_src=book" target="_top">책</a></li><li><a href="http://k.daum.net/qna/item/fstudy/?nil_profile=mini&nil_src=study" target="_top">체험학습</a></li><li><a href="http://job.daum.net/?nil_profile=mini&nil_src=job" target="_top">취업</a></li></ul> <span class="minidaum_idx minidaum_idx5"></span><ul class="minidaum_list_group minidaum_list_group5"> <li><a href="http://cafe.daum.net/?nil_profile=mini&nil_src=cafe" target="_top">카페</a></li><li><a href="http://cloud.daum.net/?nil_profile=mini&nil_src=cloud" target="_top">클라우드</a></li><li><a href="http://kids.daum.net/?nil_profile=mini&nil_src=kids" target="_top">키즈짱</a></li><li><a href="http://telzone.daum.net/?nil_profile=mini&nil_src=telzone" target="_top">텔존</a></li><li><a href="http://tvpot.daum.net/Top.do?nil_profile=mini&nil_src=tvpot" target="_top">tv팟</a></li><li><a href="http://www.tistory.com/?nil_profile=mini&nil_src=tistory" target="_top">티스토리</a></li><li><a href="http://hope.agora.media.daum.net/?nil_profile=mini&nil_src=hope" target="_top">희망해</a></li><li class="last minidaum_all"><a href="http://www.daum.net/doc/sitemap/?nil_profile=mini&nil_src=all" target="_top">전체보기</a></li></ul></div><div id="minidaumExtra"><a href="http://mobile.daum.net/" id="minidaumApps" target="_top">다음앱<span></span></a></div><span style="clear: left;"></span><div id="minidaumAppsLayer" class="minidaum_layer"></div></div><div id="minidaumRank"><span class="minidaum_rank_tit">실시간 이슈검색어</span><ol id="minidaumRankList" class="minidaum_rank_list"><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EA%B9%80%EC%9E%AC%EB%B2%94+%EA%B2%B0%ED%98%BC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword1" class="minidaum_word">김재범 결혼</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">96</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%8B%AC%EC%98%81%EC%84%AD&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword2" class="minidaum_word">심영섭</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">78</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%82%BC%EC%84%B1%ED%99%94%EC%9E%AC+%EB%8C%80%ED%95%9C%ED%95%AD%EA%B3%B5&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword3" class="minidaum_word">삼성화재 대한항공</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">13</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%BF%A8%EA%B9%8C%EB%8B%B9&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword4" class="minidaum_word">쿨까당</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">78</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%84%B1%EC%9E%AC%EA%B8%B0&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword5" class="minidaum_word">성재기</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">117</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EA%B9%80%EC%9B%90%EC%A4%80+%EA%B3%B5%EA%B0%9C%EA%B5%AC%ED%98%BC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword6" class="minidaum_word">김원준 공개구혼</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">34</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%84%9C%EC%9D%B8%EA%B5%AD+%EA%B2%BD%EC%B0%B0%EA%B0%80%EC%A1%B1&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword7" class="minidaum_word">서인국 경찰가족</a><span class="minidaum_status minidaum_new">new</span><span class="minidaum_num"></span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%B0%A8%EA%B5%AC%EC%B0%A8%EA%B5%AC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword8" class="minidaum_word">차구차구</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">234</span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EB%B0%B1%EC%95%84%EC%97%B0+1%EC%9D%BC%EA%B8%B0%EC%9E%90&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword9" class="minidaum_word">백아연 1일기자</a><span class="minidaum_status minidaum_new">new</span><span class="minidaum_num"></span></li><li><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EC%88%AD%EC%8B%A4%EB%8C%80&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword10" class="minidaum_word">숭실대</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">396</span></li><li class="minidaum_dummy"><a href="http://search.daum.net/search?w=tot&rtupcate=issue&q=%EA%B9%80%EC%9E%AC%EB%B2%94+%EA%B2%B0%ED%98%BC&guide=rissue&rtupcoll=DQP,NNS&DA=MMRR&nil_profile=mini&nil_src=searchword1" class="minidaum_word">김재범 결혼</a><span class="minidaum_status minidaum_up">상승</span><span class="minidaum_num">96</span></li></ol></div></div></div>
<script src="<%=request.getContextPath()%>/common/daum/cafe/minidaum.jsa" charset="utf-8" type="text/javascript"></script>
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
    <form id="daumSearch" name="daumSearch" method="post" action="emailCheck" onsubmit="return false;">
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
    <div class="Lwrap" id="loginBox">
        <div class="login_id">
            <p><a class="my_profile" href="http://profile.daum.net/?t__nil_loginbox=profile" target="_top">The M...</a> 님 환영합니다.</p>
            <a href="https://user.daum.net/modifyuser/modifyuser.daum?t__nil_loginbox=user">설정</a>
        </div>
        <div id="cMailMsg">
            <ul>
                <li class="mailCnt">
                    <a href="http://mail.daum.net/hanmail/Goto.daum?error=login&t__nil_loginbox=mail">메일 <span id="mail_cnt" class="fcPoint"><span class="fcPoint">334</span>통</span></a>
                </li>
                <li class="msgCnt">
                    <a href="http://mail.daum.net/msg/index.daum?t__nil_loginbox=msg">쪽지 <span id="memo_cnt" class="fcPoint"><span class="fcPoint">32</span>통</span></a>
                </li>
                <li class="msgCnt goYozm">
                    <a href="http://yozm.daum.net/home?t_nil_login_yozm" target="_top">내 요즘</a>
                </li>
            </ul>
        </div>
        <a href="http://cafe.daum.net/make/cafe_make.html?t__nil_loginbox=cafemake" target="_top" title="카페 만들기" class="makeCafebtn_w">카페 만들기</a>
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
<!-- end loading layer -->

<div id="wrap_sub_content" class="mycafeList" ">
<div id="daumContent">
 <div id="mArticle2" class="recomid emailtype">
    <h2 id="daumBody" class="screen_out">이메일 아이디가입 정보입력 본문</h2>
    <div class="wrap_info">
        <p class="img_level img_level2">
            현재 2단계/총 3단계
        </p>
        <h3 class="tit_join tit_person">기본정보를 입력해 주세요.</h3>
    </div>
    <form id="joinForm" name="joinForm" method="post" action="/infoshop/joinuser/join_step3" >
        <fieldset>
            <legend class="screen_hide">개인정보 입력 폼</legend>
            <div class="box_id">
                <!--도움말 박스 나올때 on_tip 추가 -->
                <dl class="list_info list_emailid">
                    <dt class="info_tit"><strong class="tit_join tit_email">이메일 아이디</strong></dt>
                    <dd class="info_cont">kjkjk@gmail.com</dd>
                </dl>
                <dl class="list_info">
                    <dt class="info_tit"><strong class="tit_join tit_id">Daum 아이디</strong></dt>
                    <dd class="info_cont recom_id"><span class="txt_id">kjkjk.gmail</span><input type="button" id="btnChangeId" class="btn_join btn_change" value="변경하기"></dd>
                    <dd class="info_cont cont_change regit_id">
                    <input type="text" id="userId" name="id" class="tf_txt" value="makjoa" autocomplete="off" maxlength="15">
                    <input type="button" id="btnDupl" class="btn_join btn_check" value="중복확인">
                    <em id="daumidMsg"></em>
                    </dd>
                </dl>
                <div class="join_layer hide" id="daumidLayerDesc">
                    <div class="inner_join_layer">
                        <div class="layer_body">
                             3 ~ 15자까지, 영소문자, 숫자, 마침표(.), 빼기표(-), 밑줄(_)을 혼합해서 사용할 수 있습니다.
                        </div>
                        <div class="layer_foot">
                            <span class="img_arr"></span>
                        </div>
                    </div>
                </div>
                <div class="box_bottom">
                </div>
            </div>
            <div id="joinEmailHelp" class="desc_help">
                <span class="ico_join ico_notice">알림:</span>로그인시 <em class="txt_emailid">이메일아이디</em><a id="joinEmailHelpDescShow" href="#none" class="ico_join ico_question" title="도움말">도움말</a>와 Daum아이디 모두 로그인이 가능합니다.
                <div id="joinEmailHelpDesc" class="join_layer2 hide">
                    <strong class="tit_help">이메일 아이디란?</strong>
                    <ul class="list_help">
                        <li>로그인, 비밀번호찾기 등에서 <em class="emph_txt">Daum 아이디</em>와<br>
                        동일하게 사용할 수 있는 아이디입니다.</li>
                        <li><em class="emph_txt">외부 메일</em>(네이버, 네이트, 구글 등)로만 이메일<br>
                        아이디 가입이 가능하며, Daum 메일(@daum.net , @hanmail.net)은 사용할 수 없습니다.</li>
                        <li><em class="emph_txt">1개의 이메일</em>로, 총 1회만 이메일 아이디를 가입<br>
                        할 수 있습니다.</li>
                    </ul>
                    <a id="joinEmailHelpDescClose" href="#none" class="ico_join btn_close">닫기</a>
                </div>
            </div>
            <ul class="list_user">
                <li>
                <label for="password1" class="tit_join lab_pw">비밀번호</label><input type="password" id="password1" name="password" class="tf_txt" value="" size="32" maxlength="32">
                <em id="password1Msg"></em>
                <div class="join_layer hide" id="passwordLayerDesc">
                    <div class="inner_join_layer">
                        <div class="layer_body">
                             8자 이상이어야 하며, 영문 대/소문자, 숫자, 특수문자를 혼합해서 사용하실 수 있습니다.
                        </div>
                        <div class="layer_foot">
                            <span class="img_arr"></span>
                        </div>
                    </div>
                </div>
                </li>
                <li>
                <label for="password2" class="tit_join lab_check">비밀번호 확인</label>
                <input type="password" id="password2" name="password2" class="tf_txt" value="" size="32" maxlength="32">
                <em id="password2Msg"></em>
                </li>
                <li>
                <label for="name" class="tit_join lab_name">이름</label>                
                <input type="text" id="name" name="name" class="tf_txt" value="" maxlength="30">
                <em id="nameMsg"></em>
                <div class="join_layer hide" id="nameLayerDesc">
                    <div class="inner_join_layer">
                        <div class="layer_body">
                             한글 15자, 영문 30자까지 가능합니다.
                        </div>
                        <div class="layer_foot">
                            <span class="img_arr"></span>
                        </div>
                    </div>
                </div>
                </li>
                <li>
                <span class="tit_join tit_gender">성별</span>
                <input type="radio" id="sex_m" name="gender" class="inp_radio" value="M"><label for="sex_m" class="lab_gender">남</label>
                <input type="radio" id="sex_f" name="gender" class="inp_radio" value="F"><label for="sex_f" class="lab_gender">여</label>
                <em id="sexMsg"></em>
                </li>
            </ul>
            <div class="wrap_btn btn_email">
                <span class="inner_btn">
                <input type="button" id="btnNext" class="btn_join btn_done" value="회원가입">
                <a id="btnCancel" href="/joinuser/join_step1.do" class="btn_join btn_cancel">취소</a>
                </span>
            </div>
        </fieldset>
        <input type="hidden" id="nickName" name="nickname" value="A">
        <input type="hidden" id="mobile" name="mobile" value="A">
        <input type="hidden" id="telephone" name="telephone" value="A">
        <input type="hidden" id="homepage" name="homepage" value="A">
        <input type="hidden" id="email" name="email" value="makjoa208@gmail.com">
    </form>    
</div>
    <div id="">
    </div>
</div>
<!-- end primaryContent -->
</div>
<!-- end content -->
            
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


<iframe name="proxyIframe" src="" style="display: none;" title="Suggest Proxy Frame"></iframe>

<div id="layerBreakingNewsSearch"></div>

</body>
</html>
