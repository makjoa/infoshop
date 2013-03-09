<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      <!--Sidebar content-->

<div class="span2">  
  <p class="text-info">
  </p>
	<div id="cLeftSmall" class="well well-small">
	    <div class="Lwrap" id="loginBox">
	        <div class="well well-small">
	            <p class="text-info">
	                <a class="my_profile" href="http://profile.daum.net/?t__nil_loginbox=profile" target="_top">The M...</a> 님 환영합니다.
	            </p>
	            <a href="https://user.daum.net/modifyuser/modifyuser.daum?t__nil_loginbox=user">설정</a>
	        </div>
	        <div id="cMailMsg" class="well well-small">
	            <ul class="unstyled">
	                <li>
	                <a href="http://mail.daum.net/hanmail/Goto.daum?error=login&t__nil_loginbox=mail">메일 <span id="mail_cnt" class="fcPoint"><span class="fcPoint">334</span>통</span></a>
	                </li>
	                <li>
	                <a href="http://mail.daum.net/msg/index.daum?t__nil_loginbox=msg">쪽지 <span id="memo_cnt" class="fcPoint"><span class="fcPoint">32</span>통</span></a>
	                </li>
	            </ul>
	        </div>        
	    </div>	   
	</div>
  <div id="cLeftSmall" class="well well-small">
    
		<div class="well well-small">
			<form>
			  <div class="control-group">
			    <label class="control-label" for="inputEmail">Email</label>
			    <div class="controls">
			      <input type="text" id="inputEmail" placeholder="Email">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="inputPassword">Password</label>
			    <div class="controls">
			      <input type="password" id="inputPassword" placeholder="Password">
			    </div>
			  </div>
			  <div class="control-group">
			    <div class="controls">
			      <label class="checkbox">
			        <input type="checkbox"> Remember me
			      </label>
			      <button type="submit" class="btn">Sign in</button>
			    </div>
			  </div>
      </form>		
		</div>   
  
  </div>	
</div>
<!-- end cLeftSmall -->