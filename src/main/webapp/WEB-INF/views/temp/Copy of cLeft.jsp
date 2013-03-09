<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <div class="span2">
      <!--Sidebar content-->
   
<div id="cLeftSmall">
    <div class="Lwrap" id="loginBox">
        <div class="login_id">
            <p>
                <a class="my_profile" href="http://profile.daum.net/?t__nil_loginbox=profile" target="_top">The M...</a> 님 환영합니다.
            </p>
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
        <h3><a href="/infoshop/bbs/free">내가 쓴 글</a></h3>
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
            기본 그룹 </a> &nbsp;<span class="count">(<span id="joinGroup1">51</span>)</span>
            </li>
        </ul>
        <h3 class="mybackup">
        <a href="http://cafe.daum.net/_c21_/cafebackup_result?cmd=result&t__nil_menu=backup"><img src="<%=request.getContextPath()%>/common/daum/cafe/img_blank2.gif" width="13" height="13" alt="" class="ico_backup vMid"> 내글 백업</a>
        </h3>
        <div class="cafe_banner">
            <a href="http://intro.mobile.daum.net/sub.daum?cmd=cafeapp" target="_blank"><img src="<%=request.getContextPath()%>/common/daum/cafe/img_banner1.jpg" width="160" height="100" alt="다음카페어플"></a>
        </div>
        <p class="bottom_space">
        </p>
    </div>
</div>
<
!-- end cLeftSmall -->
</div>