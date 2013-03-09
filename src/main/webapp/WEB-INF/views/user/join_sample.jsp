<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="https://user.daum.net/contents/css/common2009.css" />
<link rel="stylesheet" type="text/css" href="https://user.daum.net/contents/css/join.css" />
					<div id="wrap" class="general">
					  <div id="topWrap">
					    <div class="logo">
					      <h1 class="daum"><a href="http://www.daum.net/" title="Daum 메인페이지로 가기" target="_top">Daum</a></h1>
					      <h2 class="regist"><a href="https://user.daum.net/joinuser/welcome.do" title="회원가입 메인페이지로 가기" target="_top">회원가입</a></h2>
					    </div>
					    <div id="DaumUI__minidaum">
					      <script type="text/javascript" src="https://go.daum.net/bin/minidaum_https.cgi?body_id=transparent" charset="euc-kr"></script>
					    </div>
					
					      </div> <!-- // topWrap -->
					  <hr />
					  <div id="bodyWrap" class="input_info">
					    <div class="page_navi">
					      <h4>기본정보 입력</h4>
					      <ul class="navi">
					      <li class="n1"><span>01 약관동의</span></li>
					      <li class="n2"><span>02 본인확인</span></li>
					      <li class="n31"><span>03 ID확인/가입인증</span></li>
					      <li class="n4"><strong>04 기본정보 입력</strong></li>
					      <li class="n5"><span>05 가입완료</span></li>
					      </ul>
					    </div>
					
					    <div class="description">
					      Daum은 회원님의 개인정보를 소중하게 생각하며, 회원님의 동의 없이는 공개 또는 제3자에게 제공되지 않습니다.<br />
					      자세한 내용은 <a target="_blank" href="http://www.daum.net/doc/info_protection.html"><strong class="fontstyle01">개인정보취급방침</strong></a>을 확인해 주시기 바랍니다.
					    </div>
					
					    <form id="nextStep" name="nextStep" action="/joinuser/general.do?step=05" method="post">
					    <input type="hidden" name="_finish" value="true" />
					    <input type="hidden" id="prevdaumid" name="prevdaumid" value="" />
					    
					    <div class="table01">
					    <p class="table_coment"><span class="mark">(필수)</span>표시는 필수 입력 사항입니다.</p>
					    <table width="100%" summary="일반회원 기본정보 입력필드">
					    <tr class="first">
					      <th class="require"><span class="mark">(필수)</span>이름</th>
					      <td>최중섭</td>
					    </tr>
					    <tr class="daumid">
					      <th class="require"><span class="mark">(필수)</span>아이디(ID)</th>
					      <td>
					        <input type="text" id="daumid" name="daumid" maxlength="15" value="" class="input_text daumid"  />
					        <button type="button" id="daumid_dupl" class="btn id_double_chk"><span>중복확인</span></button>
					        <span id="IdCheckMsg"></span>
					        <span id="daumidMsg"></span>
					        <div id="daumidLayerDesc" class="layer_comment hidden_phrase">
					          3~15자의 영문소문자, 숫자, '-', '_', '.'만 가능합니다.<br />(단, '.'은 아이디 맨 처음과 끝에 사용하실 수 없습니다.)
					          <div class="tail"></div>
					        </div>
					      </td>
					    </tr>
					    <tr class="nickname">
					      <th class="require"><span class="mark">(필수)</span>Daum이름(닉네임)</th>
					      <td>
					        <input type="text" id="daumname" name="daumname" maxlength="30" value="" class="input_text name" />
					        <span id="daumnameMsg"></span>
					        <div id="nicknameLayerDesc" class="layer_comment hidden_phrase">
					          한글 1~15자, 영문 대·소문자 2~30자, 숫자, '-', '_'를<br />혼합해서 사용하실 수 있습니다.(2~30byte)
					          <div class="tail"></div>
					        </div>
					      </td>
					    </tr>
					    <tr>
					      <th class="require"><span  class="mark">*</span>성별</th>
					      <td><input type="radio" id="dmall_y" name="dmall" value="Y" class="input_check"> <label for="dmall_y">전체수신</label>
					          <input type="radio" id="dmall_n" name="dmall" value="N" class="input_check"> <label for="dmall_n">전체 수신거부</label></td>
					    </tr>
					    <tr>
					      <th class="require"><span  class="mark">*</span>생년월일</th>
					      <td><input type="text" id="CITYOFBIRTH" name="CITYOFBIRTH" size="32" maxlength="32" class="input_text daumid" /><span id="password2Msg"></span></td>
					    </tr>
					    <tr>
					      <th class="require"><span  class="mark">*</span>비밀번호 확인</th>
					      <td><input type="text" id="DISPLAYEDNAME" name="DISPLAYEDNAME" size="32" maxlength="32" class="input_text daumid" /><span id="password2Msg"></span></td>
					    </tr>
					    <tr class="password">
					      <th class="require"><span class="mark">(필수)</span>비밀번호</th>
					      <td>
					        <input type="text" id="password1" name="password1" size="32" maxlength="32" class="input_text daumid" />
					        <span id="pwLevel" ></span>
					        <span id="password1Msg"></span>
					        <div id="passwordLayerDesc" class="layer_comment hidden_phrase">
					          비밀번호는 6~32자의 영문 대·소문자, 숫자, 특수문자를<br /> 혼합해서 사용 하실 수 있습니다.
					          <div class="tail"></div>
					        </div>
					      </td>
					    </tr>
					    <tr>
					      <th class="require"><span  class="mark">*</span>비밀번호 확인</th>
					      <td><input type="password" id="password2" name="password2" size="32" maxlength="32" class="input_text daumid" /><span id="password2Msg"></span></td>
					    </tr>
					    <tr class="email">
					      <th>이메일</th>
					      <td>
					        <input type="text" id="email1" name="email1" maxlength="32" size="15" value="" class="input_text email" /> @
					        <input type="text" id="email2" name="email2" maxlength="32" size="15" value="" class="input_text email" />
					        <select id="email_list" name="email_list"  class="input_select">
					            <option value="">선택하세요</option>
					            <option value="daum.net">daum.net</option>
					            <option value="chol.com">chol.com</option>
					            <option value="dreamwiz.com">dreamwiz.com</option>
					            <option value="empal.com">empal.com</option>
					            <option value="freechal.com">freechal.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="hanafos.com">hanafos.com</option>
					            <option value="hanmir.com">hanmir.com</option>
					            <option value="hitel.net">hitel.net</option>
					            <option value="hotmail.com">hotmail.com</option>
					            <option value="korea.com">korea.com</option>
					            <option value="lycos.co.kr">lycos.co.kr</option>
					            <option value="nate.com">nate.com</option>
					            <option value="naver.com">naver.com</option>
					            <option value="netian.com">netian.com</option>
					            <option value="paran.com">paran.com</option>
					            <option value="yahoo.com">yahoo.com</option>
					            <option value="yahoo.co.kr">yahoo.co.kr</option>
					          <option value="self">직접입력</option>
					            </select>
					        <span id="emailMsg"></span>
					        <p class="field_comment comment1">아이디, 비밀번호 분실 시 <span class="fontstyle01">본인확인용</span>으로 사용되오니 정확한 정보로 입력하시기 바랍니다.</p>
					        
					        <input type="checkbox" id="othermailDM" name="othermailDM" value="Y" class="input_check"  /> <label for="othermailDM" class="fontstrong">소식메일 수신 주소로 등록</label>
					        <p class="field_comment comment2">Daum에서 발송되는 각종 서비스 관련 소식 메일을 해당 메일로 받으실 수 있습니다.</p>       
					      </td>
					    </tr>
					
					    <tr>
					          <th class="require"><span class="mark">(필수)</span>주소</th>
					          <td>
					            <p class="addr1">
					              <button type="button" id="btn_internal" class="btn addr_local"><span>국내</span></button> 
					              <button type="button" id="btn_external" class="btn addr_abroad"><span>국외</span></button>
					              <input type="hidden" id="zipcode" name="zipcode" value="" />
					              <input type="hidden" id="address1" name="address1" value="경기도 수원시 장안구 정자2동" />
					              <input type="text" id="address_readonly" name="address_readonly" value="경기도 수원시 장안구 정자2동" class="input_text addr1" readonly="readonly" />
					            <span id="addressMsg"></span>
					            </p>
					                    <p class="field_comment">접속하신 지역정보가 자동 입력되며, 정보가 다를 경우 <span class="fontstyle01">[국내], [국외]를 선택하여 직접 수정</span>하실 수 있습니다.</p>
					                    </td>
					      </tr>
					      
					
					    <tr>
					      <th>실명확인 잠금</th>
					      <td>
					        <input type="checkbox" id="nameCheckLock" name="locknamecheck" value="true" class="input_check"  /> <label for="nameCheckLock">동일 주민등록번호(아이핀)로 Daum에서 더 이상 실명확인을 원하지 않습니다.</label>
					      </td>
					    </tr>
					    <tr>
					      <th>메일수신 설정</th>
					      <td>
					        <dl class="mail_list">
					        <dt>Daum 소식메일</dt>
					        <dd>
					          <input type="checkbox" id="recv_email01" name="dmList" value="1" class="input_check" /> <label for="recv_email01">메일을 수신합니다.</label>
					        </dd>
					        <dt>쇼핑메일</dt>
					        <dd>
					          <input type="checkbox" id="recv_email03" name="dmList" value="G" class="input_check" /> <label for="recv_email03">메일을 수신합니다.</label>
					        </dd>
					        <dt>광고메일</dt>
					        <dd>
					          <input type="checkbox" id="recv_email02" name="dmList" value="5" class="input_check" /> <label for="recv_email02">메일을 수신합니다.</label>
					        </dd>
					        </dl>
					      </td>
					    </tr>
					    </table>
					    </div>
					
					    <div class="btn_area">
					      <button type="submit" name="_finish" class="btn ok01"><span>확인</span></button> 
					      <button type="button" id="reg_cancel" name="reg_cancel" class="btn cancel01"><span>취소</span></button> 
					    </div>
					    </form>
					
					    <form id="finalStep" name="finalStep" action="/joinuser/general.do?step=05" method="post">
					      <input type="hidden" name="_finish" value="true" />
					      <input type="hidden" name="acceptWeakPassword" value="false" />
					    </form>
					  </div> <!-- // bodyWrap -->
					
					<hr />
					<!-- footer_wrap -->
					<div id="footerWrap"> 
					  <p><a href="http://www.daum.net/doc/info.html">서비스 약관/정책</a> I
					  <a href="http://www.daum.net/doc/info_protection.html">개인정보취급방침</a> I
					  <a href="http://cs.daum.net/redbell/right.html">권리침해신고</a> I
					  <a href="http://cs.daum.net/top.html">고객센터</a></p>
					  Copyright (c) <a href="http://info.daum.net" target="new" class="dauminfo">Daum Communications.</a>  All rights reserved.
					</div><!--// footer_wrap -->
					</div> <!-- // wrap -->   
					
					<script type="text/javascript" src="/contents/js/jigu.js"></script>
					<script type="text/javascript" src="/contents/js/common.js"></script>
					<script type="text/javascript" src="/contents/js/formchecker.js"></script>
					<script type="text/javascript" src="/contents/js/formcheck_realtime.js"></script>
					<script type="text/javascript">
					//<![CDATA[
					// 포커스 이동
					setFocus($("daumid"), true);
					
					// 이메일 셀렉트 박스 설정
					var select = new SelectEmail($("email2"));
					select.setEmailList($("email_list"));
					
					// 풍선 도움말 설정
					setHelpDesc($("daumid"),$("daumidLayerDesc"), function(){return $("IdCheckMsg").innerHTML.isEmpty() && $("daumidMsg").innerHTML.isEmpty()});
					setHelpDesc($("daumname"),$("nicknameLayerDesc"), function(){return $("daumnameMsg").innerHTML.isEmpty()});
					setHelpDesc($("password1"),$("passwordLayerDesc"), function(){return $("password1Msg").innerHTML.isEmpty()});
					
					// 아이디 중복 체크
					var idChecker = new IdCheckMng($("daumid"), $("prevdaumid"), $("daumname"));
					var chkID = function(){
					  if( $("daumid").value.isEmpty() ){
					    $('IdCheckMsg').innerHTML = "";
					    FormCheckerOnRealTime.msg($("daumidMsg"), "다음아이디를 입력해 주세요.");
					  }
					  else if( !FormChecker.util.isID.bind($("daumid"))() ){
					    FormCheckerOnRealTime.msg($("daumidMsg"), "다음아이디를 정확하게 입력해주세요. 아이디는 영문자, 숫자, -, _, . 으로만 조합 가능합니다.");
					    $('IdCheckMsg').innerHTML = "";
					  }
					  else{
					    $("daumidMsg").innerHTML = "";
					    var param = "daumid="+$("daumid").value;
					    idChecker.send(param);
					  }
					  daum.Element.addClassName($("daumidLayerDesc"),"hidden_phrase");
					}
					
					daum.addEvent($("daumid"),"blur",function(e){
					  var evt = e || window.event;
					  daum.Event.stopEvent(evt);
					  idChecker.setAutoFocus(false);
					  chkID();
					});
					daum.addEvent($("daumid"),"keydown",function(e){
					  var evt = e || window.event;
					  var code = evt.charCode || evt.keyCode;
					  if(code == 9){
					    daum.Event.stopEvent(evt);
					    daum.Event.preventDefault(evt);
					    idChecker.setAutoFocus(true);
					    chkID();
					  }
					});
					daum.addEvent($("daumid_dupl"),"click",function(){
					  idChecker.setAutoFocus(true);
					  chkID()
					});
					
					// 비밀번호 레벨 체크
					var pwLevel = new PasswdLevelMng();
					daum.addEvent($("password1"),"keypress",function(event){
					  var e = event || window.event;
					  var code = e.charCode || e.keyCode;
					
					  if(code == 13){
					    daum.Element.addClassName($("passwordLayerDesc"),"hidden_phrase");
					    if( !$("daumid").value.isEmpty() ){
					      pwLevel.send("svcType=01&daumid=" + $("daumid").value + "&password1="+$("password1").value);  
					    }
					    else{
					      FormCheckerOnRealTime.msg($("IdCheckMsg"), "비밀번호를 입력해 주세요.");
					    }
					  }
					});
					daum.addEvent($("password1"),"blur",function(event){
					  if( !$("daumid").value.isEmpty() ){
					    pwLevel.send("svcType=01&daumid=" + $("daumid").value + "&password1="+$("password1").value);  
					  }
					})
					
					//폼체크
					var form1 = (new FormCheckerOnRealTime())
					.setFormSubmit("nextStep")
					.setBeforeSubmit(function(){
					  daum.Element.addClassName($("daumidLayerDesc"),"hidden_phrase");
					  daum.Element.addClassName($("nicknameLayerDesc"),"hidden_phrase");
					  daum.Element.addClassName($("passwordLayerDesc"),"hidden_phrase");
					  
					  return true;
					})
					.add($("daumid"), $("daumidMsg"), function(){
					  if( this.value.isEmpty() ){
					    $('IdCheckMsg').innerHTML = "";
					    return "다음아이디를 입력해 주세요.";
					  }
					  else if( !FormChecker.util.isID.bind($FOBJ(this))() ){
					    $('IdCheckMsg').innerHTML = "";
					    return "다음아이디를 정확하게 입력해주세요. 아이디는 영문자, 숫자, -, _, . 으로만 조합 가능합니다.";
					  }
					  else if(idChecker.isChanged()){
					    $('IdCheckMsg').innerHTML = "";
					    return "아이디 중복확인을 해주세요.";
					  }
					  else if(!idChecker.isPass()){
					    return " ";
					  }
					
					  return "";
					}, false)
					.add($("daumname"), $("daumnameMsg"), function(){
					  if( this.value.isEmpty() ){
					    return "Daum이름(닉네임)을 입력해 주세요.";
					  }
					  else if(this.value.byteLength() < 2 || this.value.byteLength() > 30){
					    return "Daum이름(닉네임)은 한글 1~15자, 영문 대·소문자 2~30자 까지 가능합니다.";
					  }
					  else if( !FormChecker.util.isDaumname.bind(this)() ){
					    return "사용할 수 없는 Daum이름(닉네임) 입니다.";
					  }
					
					  return "";
					})
					.add($("password1"), $("password1Msg"), function(){
					  if( this.value.isEmpty() ){
					    $("pwLevel").innerHTML = "";
					    $("pwLevel").className = "";
					    return "비밀번호를 입력해 주세요.";
					  }
					  else if( !pwLevel.isPass() ){
					    return " "
					  }
					
					  return "";
					})
					.add($("password2"), $("password2Msg"), function(){
					  if( this.value.isEmpty() ){
					    return "비밀번호 확인을 입력해 주세요.";
					  }
					  else if( this.value != $("password1").value ){
					    return "비밀번호와 비밀번호 확인이 일치하지 않습니다."
					  }
					  return "";
					})
					.add([$("cnum1"),$("cnum2"),$("cnum3")], $("cpMsg"), function(){
					  if( $("cnum1").value.isEmpty() || $("cnum2").value.isEmpty() || $("cnum3").value.isEmpty() ){
					    return "연락처를 입력해 주세요.";
					  }
					  else if( /[^0-9]/.test($("cnum1").value) || /[^0-9]/.test($("cnum2").value) || /[^0-9]/.test($("cnum3").value) ){
					    return "연락처를 정확하게 입력해 주세요."
					  }
					  return "";
					})
					.add($("address1"), $("addressMsg"), function(){
					  if( this.value.isEmpty() ){
					    return "주소를 입력해 주세요.";
					  }
					  return "";
					})
					.add([$("email1"),$("email2"),$("email_list")], $("emailMsg"), function(){
					  if ($("email1").value == $("daumid").value && (($("email2").value == "hanmail.net") || ($("email2").value == "daum.net"))) {
					    return "아이디와 동일한 이메일 주소는 등록이 불가능합니다.";
					  }
					  return "";
					})
					// 기타 기본 설정
					var form2 = (new FormChecker())
					.add($FCE("cp2").setEvent("keyup", FormChecker.util.autoFocus(4, $("cp3"))))
					.add($FCE("btn_internal").setEvent("click",function(){ 
					      daum.Browser.popup("/support/internal.do", "350", "250", { name:"address_pop", resize: "1", status : "0", scroll : "1"});
					}))
					.add($FCE("btn_external").setEvent("click",function(){ 
					      daum.Browser.popup("/support/external.do", "350", "250", { name:"address_pop", resize: "1", status : "0", scroll : "1"});
					}))
					
					daum.addEvent($("reg_cancel"), "click", regCancel);
					function setAddr(zipcode, addr1) {
					  $("zipcode").value = zipcode;
					  $("address1").value = addr1;
					  $("address_readonly").value = addr1;
					  FormCheckerOnRealTime.msg($("addressMsg"), '');
					}
					
					//이름 바이트로 제한
					daum.addEvent($('daumname'), "keyup", checkByteLength);
					
					//]]>
					</script>






</div>
</div>
</div>

</div>
</body>
</html>
