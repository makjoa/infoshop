<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:directive.include file="../content.jsp"/>
<script type="text/javascript">
function getRootPos()
{
  var path = getCurrentPath();
  
  var result = "";
  result = path.substring(path.lastIndexOf("/") + 1, path.length);
  
  console.log(result);
  return result;
}

// 현재 경로 Path를 구한다.
function getCurrentPath()
{
  var cPath = location.href;

  var path = cPath.substring(cPath.lastIndexOf("www") + 4, cPath.length);

  return path;
}
</script>
<div id="wrap_sub_content" class="mycafeList">
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
                <input type="submit" id="btnNext" class="btn_join btn_done" value="회원가입">
                <a id="btnCancel" href="javascript:getRootPos();" class="btn_join btn_cancel">취소</a>
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
</div>
</div>
</div>
</div>
</body>
</html>
