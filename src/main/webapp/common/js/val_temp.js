
//<![CDATA[
var email1 = ("email"=="email")? "dirto@gmail.com".split("@")[0] : "";

//풍선 도움말 설정
setHelpDesc($("daumid"),$("daumidLayerDesc"), function(){return true;});
setHelpDesc($("password1"),$("passwordLayerDesc"), function(){return true;});
setHelpDesc($("name"),$("nameLayerDesc"), function(){return true;});

//아이디 중복 체크
var idChecker = new IdCheckMng($("daumid"), '', $("password1"));

var chkID = function(){
  if( $("daumid").value.isEmpty() ){
      FormCheckerOnRealTime.msg($("daumidMsg"), "아이디를 입력해주세요.");
  }
  else if( !FormChecker.util.isIDLength.bind($("daumid"))() ){
      FormCheckerOnRealTime.msg($("daumidMsg"), "3자 이상 15자까지 사용하실 수 있습니다.");
  }
  else if( !FormChecker.util.isID.bind($("daumid"))() ){
      FormCheckerOnRealTime.msg($("daumidMsg"), "영문소문자, 숫자, - , _ , . 만 가능합니다.");
  }
  else{
      idChecker.send("daumid="+$("daumid").value);
  }
}

var pwLevel = new PasswdLevelMng();
daum.addEvent($("password1"),"keydown",function(event){
  var e = event || window.event;
  var code = e.charCode || e.keyCode;

  if(code == 13){
      if( !$("password1").value.isEmpty() ){
          pwLevel.send("svcType=01&daumid=" + $("daumid").value + "&email1=" + email1 + "&password1="+$("password1").value);  
      }
      else{
          FormCheckerOnRealTime.msg($("password1Msg"), "비밀번호를 입력해주세요.");
      }
  } else {
      daum.User.undisplay($("password1"));
  }
});

daum.addEvent($("password1"),"blur",function(event){
  if( !$("password1").value.isEmpty() ){
      pwLevel.send("svcType=01&daumid=" + $("daumid").value + "&email1=" + email1 + "&password1="+$("password1").value);
  } else {
      FormCheckerOnRealTime.msg($("password1Msg"), "비밀번호를 입력해주세요.");
  }
})

daum.addEvent($("password2"),"keydown",function(event){
  var e = event || window.event;
  var code = e.charCode || e.keyCode;

  if(code == 9 || code == 13){
      if( $("password2").value.isEmpty() ){
          FormCheckerOnRealTime.msg($("password2Msg"), "비밀번호 확인을 입력해 주세요.");
          return;
      }
      else if( $("password2").value != $("password1").value ){
          FormCheckerOnRealTime.msg($("password2Msg"), "비밀번호와 일치하지 않습니다.");
          return;
      }
      if(code == 13){setTimeout(function(){$('name').focus();},10);}
  } else {
      daum.User.undisplay($("password2"));
  }
});
daum.addEvent($("name"),"keydown",function(event){
  var e = event || window.event;
  var code = e.charCode || e.keyCode;

  if(code == 9 || code == 13){
      if( this.value.isEmpty() ){
          FormCheckerOnRealTime.msg($("nameMsg"), "이름을 입력해 주세요.");
          return;
      }
      else if(this.value.byteLength() < 2 || this.value.byteLength() > 30){
          FormCheckerOnRealTime.msg($("nameMsg"), "한글 15자, 영문 30자까지 가능");
          return;
      }
      else if( !FormChecker.util.isName.bind(this)() ){
          FormCheckerOnRealTime.msg($("nameMsg"), "사용하실 수 없는 이름입니다.");
          return;
      }
      if(code == 13){setTimeout(function(){$('sex_m').focus();},10);}
  } else {
      daum.User.undisplay($("name"));
  }
});


//폼체크
var form1 = (new FormCheckerOnRealTime())
.setFormSubmit("joinForm")
.setBeforeSubmit(function(){
  daum.Element.addClassName($("daumidLayerDesc"),"hide");
  daum.Element.addClassName($("passwordLayerDesc"),"hide");
  daum.User.setStatus('submit');
  return true;
})
.add($("daumid"), $("daumidMsg"), function(){
  if (daum.Element.hasClassName('mArticle', 'regitid')) { 
      if( this.value.isEmpty() ){
          return "아이디를 입력해주세요.";
      }
      else if( !FormChecker.util.isIDLength.bind($FOBJ(this))() ){
          return "3자 이상 15자까지 사용하실 수 있습니다.";
      }
      else if( !FormChecker.util.isID.bind($FOBJ(this))() ){
          return "영문소문자, 숫자, - , _ , . 만 가능합니다.";
      }
      else if(!idChecker.isPass()){
          return " ";
      }
      idChecker.send("daumid="+$("daumid").value);
  }
  return "pass";
},false)
.add($("password1"), $("password1Msg"), function(){
  if( this.value.isEmpty() ){
      return "비밀번호를 입력해주세요.";
  }
  else if(!FormChecker.util.isAvailablePw($("daumid"),$("password1"))){
      return " ";
  }
  else if( !pwLevel.isPass() ){
      return " ";
  }
  pwLevel.send("svcType=01&daumid=" + $("daumid").value + "&email1=" + email1 + "&password1="+$("password1").value);
  return "pass";
},false)
.add($("password2"), $("password2Msg"), function(){
  if( this.value.isEmpty() ){
      return "비밀번호 확인을 입력해 주세요.";
  }
  else if( this.value != $("password1").value ){
      return "비밀번호와 일치하지 않습니다."
  }
  return "pass";
},false)
.add($("name"), $("nameMsg"), function(){
  if( this.value.isEmpty() ){
      return "이름을 입력해 주세요.";
  }
  else if(this.value.byteLength() < 2 || this.value.byteLength() > 30){
      return "한글 15자, 영문 30자까지 가능";
  }
  else if( !FormChecker.util.isName.bind(this)() ){
      return "사용하실 수 없는 이름입니다.";
  }
  return "";
},false)
.add([$("sex_m"), $("sex_f")], $("sexMsg"), function(){
  if($("sex_m").checked || $("sex_f").checked){
      return "";  
  }else{
      return "성별을 선택해주세요.";
  }   
},false);

daum.addEvent($("daumid"),"blur",function(e){
  var evt = e || window.event;
  daum.Event.stopEvent(evt);
  chkID();
});
daum.addEvent($("daumid"),"keydown",function(e){
  var evt = e || window.event;
  var code = evt.charCode || evt.keyCode;
  if(code == 9 || code == 13){
      daum.Event.stopEvent(evt);
      daum.Event.preventDefault(evt);
      chkID();
  }
});

daum.addEvent($("btnDupl"),"click",function(){
  chkID();
});

daum.addEvent($('btnChangeId'),"click",function(){
  daum.Element.replaceClassName('mArticle', 'recomid', 'regitid');
});

daum.addEvent($("sex_m"),"click",function(){$('sexMsg').innerHTML = '';});
daum.addEvent($("sex_f"),"click",function(){$('sexMsg').innerHTML = '';});
daum.addEvent($("btnNext"),"click",function(){
  form1.actionProc();
});

var goJoin = function (tab) {
  var cur = 'email';
  if( confirm('처음부터 다시 가입 인증을 받으셔야 합니다.\n이동하시겠습니까?') ){
      var param = (tab == 'phone')? '?regAuthType=02' : '';
      location.href = '/joinuser/join_step1.do' + param;
  } 
}
daum.addEvent($("btnCancel"), "click", function(e){goJoin('email');daum.Event.stopEvent(e);});

//설명글
(function(el, wrap) {
  if(!el || !wrap) {
      return;
  }

  function show(isShow) {
      wrap.removeClassName('on_tip');
      if(isShow) wrap.addClassName('on_tip');
      el.removeClassName(!isShow? 'show': 'hide');
      el.addClassName(isShow? 'show': 'hide');
  }
  
  daum.Event.addEvent($('joinEmailHelpDescShow'), "click", function(e){
      show(true);
      daum.Event.stopEvent(e);
  });
  
  daum.Event.addEvent($('joinEmailHelpDescClose'), "click", function(e){
      show(false);
      daum.Event.stopEvent(e);
  });
  
})($E('joinEmailHelpDesc'), $E('joinEmailHelp'));

daum.User.ready([$('daumid'),$('password1'),$('password2'),$('name')]);
//]]>
