<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
<script type="text/javascript">
//console.log(PEOPLE);
var result = "";
$.ajax({
	url: "<%=request.getContextPath()%>/resources/Ronaldinho.pxml",
	dataType:"xml"
	}).done(function(xmlData){
   	            
		var name = $(this).attr('Player');
	
		var jsonData = $.xmlToJSON(xmlData);
		result = jsonData.xml.Player;
	    //console.dir(jsonData);
	    //console.log(JSON.stringify(jsonData));
	    console.log(result);
	    console.log(jsonData.xml.Player);
	}); 
</Script>
      <div id="page-outer" class="main_container">
              <!-- 컨텐츠 시작 -->   
        <div id="page-container" class="wrapper wrapper-profile white">
          <div class="dashboard">

          </div>          
          <div class="content-top">
            <div class="content-header">
              <div class="header-inner">
                <h2 class="js-timeline-title">프로필 편집</h2>
                <p class="subheader">Change your basic account, language, Tweet privacy, and location settings.</p>
              </div>
            </div>
            <div class="content-inner no-stream-end">            
              <form:form id="people-form" class="form-horizontal requires-password" method="POST" action="/infoshop/people/update">
						    <div id="settings-alert-box" class="alert" style="display: none;">
                  <i id="settings-alert-close" class="close"></i>
                  <div id="settings-alert-message">						            
                  </div>
						    </div>              
					      <fieldset id="username_fieldset" class="control-group problem">
					        <label for="user_screen_name" class="control-label">Username</label>
					        <div class="controls">
					          <p id="username_notification" class="notification"></p>
					          <input id="user_screen_name" maxlength="15" name="user[screen_name]" type="text" value="">
					          <p class="notification">https://twitter.com/<span id="username_path"></span></p>
					        </div>
					      </fieldset>
						<fieldset id="email_fieldset" class="control-group">
							    <label for="user_email" class="control-label">Email</label>
							    <div class="controls">
							      <p id="email_notification" class="notification"></p>
							      <input id="user_email" class="email-input" name="user[email]" type="text" value="jpbabo@nate.com">
							      <p>Email will not be publicly displayed. <a href="https://support.twitter.com/articles/15356" target="_blank">Learn more</a>.</p>
							      <label class="checkbox">
							        <input id="user_discoverable_by_email" name="user[discoverable_by_email]" type="checkbox" value="1" checked="">
							        Let others find me by my email address
							      </label>
							      <input type="hidden" value="0" name="user[discoverable_by_email]">
							    </div>
						    </fieldset>
						    <hr>
						    <fieldset id="resTable" class="control-group">
							    <label for="user_email" class="control-label">Email</label>
							    <div class="controls">
							      <p id="email_notification" class="notification"></p>
							      <input id="user_email" class="email-input" name="user[email]" type="text" value="jpbabo@nate.com">
							      <p>Email will not be publicly displayed. <a href="https://support.twitter.com/articles/15356" target="_blank">Learn more</a>.</p>
							      <label class="checkbox">
							        <input id="user_discoverable_by_email" name="user[discoverable_by_email]" type="checkbox" value="1" checked="">
							        Let others find me by my email address
							      </label>
							      <input type="hidden" value="0" name="user[discoverable_by_email]">
							    </div>
						    </fieldset>
						    <hr>						    
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
