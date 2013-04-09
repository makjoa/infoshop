<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/signup.js"></script>
		<div id="page-outer" class="main_container">
		    <!-- 컨텐츠 시작 -->
		    <div id="page-container" class="wrapper wrapper-profile white">
		        <div class="sign-in">
		            <div class="signin-box">
		                <h2>로그인 <strong></strong></h2>
		                <form:form commandName="login" id="gaia_loginform" action="/user/login" method="post">
		                    <input type="hidden" name="continue" id="continue" value="https://www.google.co.kr/">
		                    <input type="hidden" name="hl" id="hl" value="ko">
		                    <input type="hidden" name="GALX" value="9mofRQhmAnw">
		                    <input type="hidden" name="timeStmp" id="timeStmp" value="1359702042">
		                    <input type="hidden" name="secTok" id="secTok" value=".AG5fkS_c1tanjwnMZKn6ymU2o8XKxvoX4Q==">
		                    <input type="hidden" id="_utf8" name="_utf8" value="☃">
		                    <input type="hidden" name="bgresponse" id="bgresponse" value="js_disabled">
		                    <div class="email-div">
		                        <label for="Email"><strong class="email-label">이메일</strong></label>
		                        <input type="email" spellcheck="false" name="username" id="username" value="${loginInfo.username}">
		                    </div>
		                    <div class="passwd-div">
		                        <label for="Passwd"><strong class="passwd-label">비밀번호</strong></label>
		                        <input type="password" name="password" id="Passwd" value="${loginInfo.password}">
		                    </div>
		                    <input type="submit" class="g-button g-button-submit" name="signIn" id="signIn" value="로그인">
		                </form:form>
		                <ul>
		                    <li>
		                    <a id="link-forgot-passwd" href="https://accounts.google.com/RecoverAccount?continue=https%3A%2F%2Fwww.google.co.kr%2F" target="_top">
		                    계정에 액세스할 수 없습니까? </a>
		                    </li>
		                </ul>
		            </div>
		        </div>
		    </div>
		</div>
</div>  
</body>
</html>