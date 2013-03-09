<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<jsp:directive.include file="../includes.jsp"/>
<jsp:directive.include file="../header.jsp"/>
<div id="wrap_sub_content" class="mycafeList" ">
    <div id="daumContent">
    <div id="">

        <div id="" class="type_email">
            <form id="joinForm" name="joinForm" action="/joinuser/join_step2.do" method="post">
                <fieldset>
                    <legend class="screen_hide">이메일 주소 입력 및 약관동의 폼</legend>
                    <div class="box_join">
                        <div class="box_body join_email">
                            <label for="email" class="tit_join lab_email">이메일 입력</label>
                            <input type="text" id="email" name="email" class="tf_bg tf_email" tabindex="1" autocomplete="off">
                            <button id="btnAuthEmail" type="button" class="btn_join btn_overlap">중복확인</button>
                            <p id="wrapWarn">
                            </p>
                        </div>
                        <div class="box_bottom">
                        </div>
                    </div>
                    <ul class="list_notice">
                        <li>자주 이용하시는 이메일 (네이버, 네이트, 구글 등)을 입력해주세요.</li>
                        <li class="desc_emailid">입력하신 이메일은 <em class="emph_txt">이메일아이디</em><a id="joinEmailHelpDescShow" href="#none" class="ico_join ico_question" title="도움말">도움말</a>로 사용되며, 해당 이메일로 가입 승인 메일이 발송됩니다. 12시간 안에 가입 승인 메일을 확인해 주세요.
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
                        </li>                        
                    </ul>
                    <div class="wrap_agree">
                        <div class="agree_rule">
                            <div class="agreement_new">
                                <strong class="tit_rule">Daum 서비스약관 (2009. 9. 6 부터 유효)</strong>
                            </div>
                        </div>
                        <div class="agree_inp1">
                            <input type="checkbox" id="agreeRule" name="agreeRule" class="inp_check" tabindex="2">
                            <label for="agreeRule" class="lab_agree">이용약관 동의</label>
                        </div>
                        <div>
                        </div>
                        <div class="tab_rule">
                            <a href="#policy1" class="link_rule txt_on" id="tabPolicy1">수집항목</a><span class="txt_bar"> | </span><a href="#policy2" class="link_rule" id="tabPolicy2">이용목적</a><span class="txt_bar"> | </span><a href="#policy3" class="link_rule" id="tabPolicy3">보유 및 이용기간</a>
                        </div>
                        <div class="agree_rule txt_personal">
                            <div id="agreementNoti" class="agreement_noti">
                                <div id="policy1" class="wrap_rule">
                                    <h6>수집항목</h6>
                                </div>
                                <div id="policy2" class="wrap_rule">
                                    <h6 class="type2">개인정보의 수집 이용목적</h6>
                                </div>
                                <div id="policy3" class="wrap_rule">
                                    <h6 class="type3">개인정보의 보유 및 이용기간</h6>
                                </div>
                            </div>
                        </div>
                        <div class="agree_inp2">
                            <input type="checkbox" id="agreePersonal" name="agreePersonal" class="inp_check" tabindex="3">
                            <label for="agreePersonal" class="lab_agree">개인정보 수집 및 이용 동의</label>
                        </div>
                    </div>
                    <input type="button" id="btnNext" class="btn_join btn_next" value="다음단계">
                </fieldset>
            </form>
            <!-- <a href="/joinuser/corp.do?step=01" class="btn_join link_corp">법인회원가입</a> -->
        </div>
    </div>
    <div id="">
    </div>
</div>
<!-- end primaryContent -->
</div>
<!-- end content -->
</div>
</body>
</html>