<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/signup.js"></script>
        <div id="page-outer" class="main_container">
              <!-- 컨텐츠 시작 -->   
            <div id="page-container" class="wrapper wrapper-profile white">
            <div class="dashboard">
				
				</div>          
                <div class="content-top">
                    <div class="content-header">
				       <div class="header-inner">
				           <h2 class="js-timeline-title">가입하기</h2>
				           <p class="subheader">
				               Change your basic account, language, Tweet privacy, and location settings.
				           </p>
				       </div>
                    </div>
					<div class="content-inner no-stream-end">
					    <form:form commandName="user" id="account-form" cssClass="form-horizontal requires-password" method="POST">
					    <div id="settings-alert-box" class="alert" style="display: none;">
					        <i id="settings-alert-close" class="close"></i>
					        <div id="settings-alert-message">
					        </div>
					    </div>
					    <fieldset id="username_fieldset" class="control-group problem">
					        <label for="name" class="control-label">name</label>
					        <div class="controls">
					            <p id="name_notification" class="notification">
					            </p>
					            <form:input path="name" id="name" name="name" autocomplete="off" maxlength="15" type="text" value="" data-validate="true" aria-required="true" />
					            <form:errors path="name"/>					            
					            <p class="notification">
					                https://twitter.com/<span id="username_path"></span>
					            </p>
					        </div>
					    </fieldset>				    
					    <fieldset id="email_fieldset" class="control-group">
					        <label for="user_email" class="control-label">Email</label>
					        <div class="controls">
					            <p id="email_notification" class="notification">
					            </p>
					            <form:input path="email" id="user_email" class="email-input" name="email" type="text" value="" />
					             <form:errors path="email"/>
					            <p>
					                Email will not be publicly displayed. <a href="https://support.twitter.com/articles/15356" target="_blank">Learn more</a>.
					            </p>
					            <label class="checkbox">
					            <input id="user_discoverable_by_email" name="user[discoverable_by_email]" type="checkbox" value="1" checked>
					            Let others find me by my email address </label>
					            <input type="hidden" value="0" name="user[discoverable_by_email]">
					        </div>
					    </fieldset>
                        <fieldset id="username_fieldset" class="control-group problem">
                            <label for="username" class="control-label">ID</label>
                            <div class="controls">
                                <p id="username_notification" class="notification">                               
                                </p>
                                <form:input path="username" id="username" maxlength="15" name="username" type="text" value="" />
                                <form:errors path="username"/>                                
                                <p class="notification">
                                     https://twitter.com/<span id="username_path"></span>
                                </p>
                            </div>
                        </fieldset> 					    
						<fieldset class="control-group">
						    <label for="user_password" class="control-label">비밀번호</label>
						    <div id="password_strength" class="controls">
                                <form:password path="password" id="user_password" name="password" />
                                <form:errors path="password"/>
						        <small id="password_strength_feedback" class="help-inline help-error" style="display: none;"></small>
						    </div>
						</fieldset>						
						<fieldset class="control-group">
                            <label for="user_password" class="control-label">비밀번호 확인하기</label>
						    <div id="password_strength" class="controls">
						        <form:password path="passwordConfirm" id="user_password" name="passwordConfirm" />
						        <form:errors path="passwordConfirm"/>
						        <small id="password_strength_feedback" class="help-inline help-error" style="display: none;"></small>
						    </div>
						</fieldset>
						<fieldset class="control-group">
						    <label for="user_country" class="control-label">국적</label>
						    <div class="controls">
						        <select id="user_country" name="user[country]">
						            <option value="xx">전세계</option>
						            <option value="kr" selected="">대한민국</option>
						        </select>
						        <p>
						            국가를 선택하세요. 이 설정은 현재 사용중인 브라우저에 저장됩니다.
						        </p>
						    </div>
						</fieldset>
					    <hr>
						<div class="form-actions">
						    <button id="settings_save" class="btn signup-btn" type="submit">가입하기</button>
						</div>				    
					    </form:form>
					 </div>
				</div>
	        <!--
	        
	        <jsp:directive.include file="../include/footer.jspf"/>
	        -->
        </div>
        </div>
    </div>
</body>
</html>
