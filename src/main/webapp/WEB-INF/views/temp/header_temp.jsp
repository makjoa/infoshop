<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR"> 
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="ko-KR"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="ko-KR"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="ko-KR"> <![endif]-->
<!--[if gt IE 8]>     <html lang="ko-KR">  <!--<![endif]-->
  <head>
		<meta charset="UTF-8" />
		<title>INFOSHOP</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Bootstrap -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-responsive-min.css">
		<!-- DAUM UI -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/common/daum/css/common.css" type="text/css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/common/daum/css/default.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/common/daum/css/20130115090146.7.css">
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/jigu.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/common.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/suggest.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/util_gzip.js"></script>
		<script type="text/javascript" id="imideo-extension-info">var imideo_extension=true;</script>
		<script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/tiara.min.js"></script>
		<script id="PersonalScript" type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/allcount_hdn"></script>
		<script type="text/javascript" charset="utf-8" defer="" id="breakingNewsSearchCallBack" src="<%=request.getContextPath()%>/common/daum/js/breakingnews.js"></script>
  </head>

	<body data-spy="scroll" data-target=".bs-docs-sidebar">
    <!-- Navbar
    ================================================== -->	
    <div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
			        <div class="container">
			          <div class="nav-collapse collapse">
			            <ul class="nav">
			              <li class="">
			                <a href="./index.html">Home</a>
			              </li>
			              <li class="active">
			                <a href="./getting-started.html">Get started</a>
			              </li>
			              <li class="">
			                <a href="./scaffolding.html">Scaffolding</a>
			              </li>
			              <li class="">
			                <a href="./base-css.html">Base CSS</a>
			              </li>
			              <li class="">
			                <a href="./components.html">Components</a>
			              </li>
			              <li class="">
			                <a href="./javascript.html">JavaScript</a>
			              </li>
			              <li class="">
			                <a href="./customize.html">Customize</a>
			              </li>
			            </ul>
			          </div>
			        </div>
			</div>
	    <div id="minidaum" style="display: none">
	        <div class="minidaum_gnb" style="display: none;">
	            <div id="minidaumUser" class="minidaum_login">
	                <a href="" target="_top" id="minidaumNick">The Ma..님</a>
	                <div id="minidaumUserLayer" class="minidaum_layer">
	                    <p class="minidaum_logout">
	                        <a href="" target="_top" id="btnMinidaumLogout">로그아웃</a>
	                    </p>
	                    <ul class="minidaum_mylayer minidaum_myservice">
	                        <li><a href="" target="_top">내블로그</a></li>
	                        <li><a href="" target="_top">내캘린더</a></li>
	                        <li><a href="" target="_top">내클라우드</a></li>
	                    </ul>
	                    <ul class="minidaum_mylayer minidaum_myinfo">
	                        <li><a href="" target="_top">프로필</a></li>
	                        <li><a href="">회원정보</a></li>
	                    </ul>
	                    <img src="<%=request.getContextPath()%>/common/daum/cafe/auth.gif" style="display:none">
	                </div>
	            </div>
	            <h2 class="screen_out">서비스 바로가기</h2>
	            <div id="minidaumService">
	                <ul class="minidaum_service_list">
	                    <li class="minidaum_top"><a href="" target="_top" class="minidaum_top_link">Daum</a></li>
	                    <li id="minidaumMail" class="minidaum_mail"><a href="" target="_top">메일</a><a href="" target="_top" class="minidaum_count" id="minidaumMailCnt"> 99</a></li>
	                    <li id="minidaumCafe" class="minidaum_cafe"><a href="" target="_top">카페</a><a href="" target="_top" class="minidaum_count" id="minidaumCafeCnt"> 99</a></li>
	                    <li class="minidaum_news"><a href="" target="_top">뉴스</a></li>
	                    <li class="minidaum_shopping"><a href="">쇼핑</a></li>
	                </ul>                
	            </div>
	            <div id="minidaumExtra">
	                <a href="http://mobile.daum.net/" id="minidaumApps" target="_top">다음앱<span></span></a>
	            </div>
	            <span style="clear: left;"></span>
	            <div id="minidaumAppsLayer" class="minidaum_layer">
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 서브 헤더
	================================================== -->
	<header class="jumbotron subhead" id="overview">
	  <div class="container">    
	    <p class="lead">Bootstrap is built on responsive 12-column grids, layouts, and components.</p>
		<div id="cHeader" class="cafeHeader">
		    <h1>
		    <a class="daumLogo" href="" title="Daum">
		        <img src="<%=request.getContextPath()%>/common/daum/cafe/img_daum.gif" width="62" height="26" alt="Daum">
		        </a>
		          <a class="serviceLogo" href="" title="카페">카페</a>
		    </h1>
		    <h2>관련 서비스</h2>
		    <ul class="relatedsvcs">
		        <li class="blog"><a href="" title="블로그">블로그</a></li>
		        <li class="tistory"><a href="" target="_blank" title="티스토리">티스토리</a></li>
		        <li class="view"><a href="" title="뷰">뷰</a></li>
		        <li class="yozm"><a href="" title="yozm">yozm</a></li>
		        <li class="widgetbank"><a href="" title="위젯뱅크">위젯뱅크</a></li>
		    </ul>
		    <h2>검색</h2>
		    <form id="daumSearch" name="daumSearch" action="emailCheck" onsubmit="return checkSubmit(this)">
		        <div class="searchbar">
		            <p id="daumSearchOptionLayer">
		                <a href="" onclick="return false;">카페검색</a>
		                <a href="" onclick="return false;">카페이름</a>
		                <a href="" onclick="return false;">카페글</a>
		            </p>
		            <div class="option" id="daumSearchOption">
		                카페검색
		            </div>
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
		        <a href="" class="logodeco" style="width: 220px; height: 52px;" target="_new">
		            <img src="<%=request.getContextPath()%>/common/daum/cafe/121220_cafetopbar.GIF" width="220" height="52" alt="">
		        </a>
		        <!-- 로고데코 영역 -->
		        <ul id="cafe-gnb" class="mycafe ">
		            <li class="cafehome"><a title="카페 홈" href="">카페 홈</a></li>
		            <li class="mycafe"><a title="내 카페" href=" 카페.htm">내 카페</a></li>
		            <li class="cafecategory"><a title="카테고리" href="">카테고리</a></li>
		            <li class="vipcafe"><a title="우수카페" href="">우수카페</a></li>
		            <li class="fancafe"><a title="팬카페" href="">팬카페</a><em class="new">new</em></li>
		            <li class="qnacafe"><a title="지식카페" href="">지식카페</a></li>
		            <li class="cafeskin"><a title="카페스킨" href="">카페스킨</a></li>
		            <li class="cafegame"><a title="카페게임" href="">카페게임</a></li>
		        </ul>
		    </div>
		</div>  
	  </div>
</header>