<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>

<div id="cSubWrap" class="smallWidthBack">


<div id="loadingLayer" style="display: none;">
    <div id="loadingIcon"><div id="loadingFlash"></div></div>
</div>
<div id="shortLoading" style="display: none;"><img src="<%=request.getContextPath()%>/common/daum/cafe/loading.gif" width="12" height="13" alt="로딩중"></div>
<!-- end loading layer -->
<script type="text/javascript">window.jstTemplates = new Object();</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/mycafe-all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/jst-all.js"></script>
<script type="text/javascript">
    //<![CDATA[
    new ClientErrorHandler().install();
    new ServerErrorHandler().install();
    //]]>
    function fnCmdDelete(idx) {
    	alert(idx);
        document.bbsForm.grpid.value = idx;
        document.bbsForm.action = '/infoshop/delete';
        document.bbsForm.submit(); 
    }
</script> 


<div id="wrap_sub_content" class="mycafeList" ">
    <div id="primaryContent">
		<table class="roundTable">
		<tbody class="pos_rel">
		<tr>
		    <td class="tlb" nowrap="">
		         &nbsp;
		    </td>
		    <td class="tcb" nowrap="">
		         &nbsp;
		    </td>
		    <td class="trb" nowrap="">
		         &nbsp;
		    </td>
		</tr>
		<tr class="pos_rel">
		    <td class="lb" nowrap="">
		         &nbsp;
		    </td>
		    <td class="cb pos_rel">
		        <!-- content start -->
		        <form id="bbsForm" name="bbsForm" method="POST">
		            <input type="hidden" name="grpid">
		            <input type="hidden" name="emoticon">
		            <input type="hidden" name="mgrpid">
		            <input type="hidden" name="fldid">
		            <input type="hidden" name="dataid">
		            <input type="hidden" name="page">
		            <input type="hidden" name="prev_page">
		            <input type="hidden" name="firstbbsdepth">
		            <input type="hidden" name="lastbbsdepth">
		            <input type="hidden" name="content">
		            <input type="hidden" name="contentval">
		            <input type="hidden" name="espam7005533">
		            <input type="hidden" name="viewcount7005533">
		            <input type="hidden" name="regdt7005533">
		            <input type="hidden" name="mode">
		            <input type="hidden" name="num">
		            <input type="hidden" name="pardataname">
		            <input type="hidden" name="parbbsdepth">
		            <input type="hidden" name="e_paruserid">
		            <input type="hidden" name="pardatatype">
		            <input type="hidden" name="parregdt">
		            <input type="hidden" name="move">
		            <input type="hidden" name="userlist">
		            <input type="hidden" name="issueregyn" value="">
		            <input type="hidden" name="changerolecode" value="">
		            <div class="list_btn_area list_btn_top">
		                <a href="/infoshop/bbs/${getArticle.subject}/write" class="btn" title="글쓰기"><span class="btn_bg bg03"></span><span class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span></a>
		                <a href="javascript:;" class="btn" onclick="javascript:check_reply('0TOSTzzzzzzzzzzzzzzzzzzzzzzzzz'); return false;" title="답글"><span class="btn_bg bt03"></span><span class="btn_txt bt03 w03">답글</span></a>		                
		                <a href="" class="btn" title="수정"><span class="btn_bg bt03"></span><span class="btn_txt bt03 w03">수정</span></a>
		                <a href="javascript:fnCmdDelete(${getArticleIDX});" class="btn" title="삭제"><span class="btn_bg bt03"></span><span class="btn_txt bt03 w03">삭제</span></a>
		                <span class="list_paging">
		                <a href="">최신목록</a>
		                <span class="bar2">|</span>
		                <a href="">목록</a>
		                <span class="bar2">|</span>
		                <span class="arrow">▲</span><a href="">윗글</a>
		                <span class="bar2">|</span>
		                <span class="arrow">▼</span><a href="">아랫글</a>
		                </span>
		            </div>
		            <!-- end list_btn_area -->
		            <div class="cl">
		                 &nbsp;
		            </div>
		            <div class="article_subject line_sub">
		                <div class="subject">
		                    <span class="headcate">
		                    </span>
		                    <img src="http://m1.daumcdn.net/cafeimg/120810_cafeapplink/pc/ico_mobile.gif?v=1" width="8" height="12" alt="모바일 작성글" class="icon_mobile">
		                    <span class="b">${getArticle.subject} </span><span class="bar2">|</span><a href="bbs_list?grpid=Jnt6&amp;mgrpid=&amp;fldid=IC6M" class="txt_sub">프리토크</a>
		                </div>
		            </div>
		            <!-- end article_subject -->
		            <div class="article_writer">
		                <a href="#" onclick="showSideView(this, 'oGoofvxPM_10', '', '\uADF8\uB808\uC774\uD2B8 \uBC15'); return false;" class="txt_point p11">${getArticle.name}</a>
		                <span class="bar2">|</span>
		                <span class="p11">조회 ${getArticle.hit}</span>
		                <span class="bar2">|</span><span class="p11">추천 0</span>
		                <span class="bar2">|</span><span class="p11 ls0">${getArticle.date}</span>
		                <span class="txt_sub url"><a href="http://cafe.daum.net/WorldcupLove/IC6M/7005533" class="copyurl">http://cafe.daum.net/WorldcupLove/IC6M/7005533</a>&nbsp;<embed class="op" onmouseover="this.className=''" onmouseout="this.className='op'" height="13" width="22" src="http://cafecj.daum-img.net/flash/copyClipboard.swf" flashvars="url=http://cafe.daum.net/WorldcupLove/IC6M/7005533&amp;urlName=글" wmode="transparent" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" style="vertical-align: middle;"></span>
		            </div>
		            <!-- end article_writer -->
		            <div id="bbs_contents" class="bbs_contents">
		                <div class="bbs_contents_inbox">
		                    <div id="user_contents" name="user_contents" class="user_contents tx-content-container scroll">
		                        <table class="protectTable" id="protectTable">
		                        <tbody>
		                        <tr>
		                            <td>
		                                <!-- clix_content 이 안에 본문 내용 외에 다른 내용을 절대 넣지 말 것  -->
		                                <script type="text/javascript">//<![CDATA[
		                                 document.write(removeRestrictTag());
		                                  //]]></script>
		                                 ${getArticle.content} 
		                                <!-- -->
		                                <!-- end clix_content -->
		                            </td>
		                        </tr>
		                        </tbody>
		                        </table>
		                        <table class="clearTable">
		                        <tbody>
		                        <tr>
		                            <td>
		                                 &nbsp;
		                            </td>
		                        </tr>
		                        </tbody>
		                        </table>
		                    </div>
		                    <script type="text/javascript">//<![CDATA[
		                redefineLink();
		                //]]></script>
		                </div>
		            </div>
		            <!-- end bbs_contents -->
		            <!-- 이전 첨부파일 영역 -->
		            <!-- 이전 첨부파일 영역 end -->
		            <!-- 새로운 첨부파일 영역 -->
		            <div id="AttachFileCCL" class="attachFile">
		            </div>
		            <!-- end CCL area -->
		            <!-- 모바일 작성글인 경우 카페 앱 소개 링크  -->
		            <div id="cafeAppLink" onclick="cafeAppLayer.showWrapMini2();" onmouseover="cafeAppLayer.showWrapMini2();" onmouseout="cafeAppLayer.hideWrapMini();">
		                <p id="cafeAppLinkTarget">
		                     내 글 반응을 <span class="point">카페앱</span>에서 바로 확인하세요. <span class="down_link">설치하기</span>
		                </p>
		            </div>
		            <div class="comment_scrap" id="comment_wrap">
		                <p class="comment_view fl">
		                    <span class="comment_cnt" id="comment_cnt">
		                    <a href="#" id="member_cmt" onclick="Reply.activeCommentView('7005533', 'member', this); return false;" class="comment_on txt_point">댓글 <span id="cmtCnt">0</span></a>
		                    </span>
		                </p>
		                <div class="fr">
		                    <div class="fl recommend_wrap">
		                        <a class="bbs_recommend" href="#" onclick="recommendBBS('Jnt6', 'IC6M', '7005533', '0', true, true, 'WorldcupLove', '%B9%CE%C7%CF+%BE%D6%B0%A1+%BE%D6%B0%B0%C1%F6%B0%A1%BE%CA%BE%C6...'); return false;">
		                        <span class="bg04 fl left">
		                        <img src="http://i1.daumcdn.net/cafeimg/cf_img4/img/ico_recommend.gif" width="11" height="13&quot;" alt="추천하기">
		                        </span>
		                        <span id="recommendCnt" class="txt_point bg04 fl right">0</span>
		                        </a>
		                    </div>
		                    <div id="readSnsShare" class="sns_share">
		                        <ul class="sns_items">
		                            <li class="bg04 first"><a class="mypeople icon" href="" target="_blank" title="마이피플에 보내기"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt=""><span class="sep line">마이피플</span></a></li>
		                            <li class="bg04"><a class="twitter icon" href="" target="_blank" title="트위터에 보내기"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt=""><span class="sep line">트위터</span></a></li>
		                            <li class="bg04"><a class="facebook icon" href="" target="_blank" title="페이스북에 보내기"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt=""><span class="sep line">페이스북</span></a></li>
		                            <li class="bg04"><a id="showMoreSns" class="show_more_sns arrow" href="#"><span class="c txt_sub">▼</span><span class="sep line_sub">SNS 더 보기</span></a></li>
		                            <li class="bg04 last"><span class="sns_send_count txt_point b">0</span></li>
		                        </ul>
		                        <ul id="readSnsShareMore" class="sns_more_items line bg cafeLayer" style="display: none;">
		                            <li><a class="nate icon" href="" target="_blank" title="C로그에 보내기"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt=""><span>싸이월드</span></a></li>
		                            <li><a class="me2day" href="" target="_blank" title="미투데이에 보내기"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt=""><span>미투데이</span></a></li>
		                            <li><a class="yozm" href="" target="_blank" title="요즘에 보내기"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt=""><span>요즘</span></a></li>
		                        </ul>
		                    </div>
		                    <script type="text/javascript">
		    new daum.cafe.bbs.Sns("readSnsShare");
		                                </script>
		                    <div class="fl scrap_wrap">
		                        <a href="#" id="btnScrapMenu" class="scrap_close p11" onclick="">
		                        <span class="bg04 fl first">스크랩</span>
		                        <span class="bg04 fl center"><span class="sep line fl"></span><span class="arrow txt_sub">▼</span><span class="sep line_sub fl"></span></span>
		                        <span class="bg04 fl txt_point">0</span>
		                        </a>
		                    </div>
		                    <a class="print fl p11" href="/_c21_/bbs_print?grpid=Jnt6&amp;mgrpid=&amp;fldid=IC6M&amp;dataid=7005533" target="_cafePrintWin" onclick="doPrint();return false;">인쇄</a>
		                    <span class="bar2 fl">|</span>
		                    <a class="spam fl p11" href="#" onclick="openSpam119('' == 'true', true, 'Jnt6', '', 'IC6M', '7005533', '\uBBFC\uD558 \uC560\uAC00 \uC560\uAC19\uC9C0\uAC00\uC54A\uC544...'); return false;">신고</a>
		                </div>
		            </div>
		            <script type="text/javascript" src="http://s1.daumcdn.net/cafecj/js/31/2009/_reply.js"></script>
		            <script type="text/javascript" src="http://s1.daumcdn.net/cafecj/js/48/2009/memo_reply.js"></script>
		            <script type="text/javascript" src="http://s1.daumcdn.net/cafecj/js/2/2009/dwr/engine-2.0.5.js"></script>
		            <script type="text/javascript" src="http://s1.daumcdn.net/cafecj/js/11/2009/dwr/dwrstub-compressed.js"></script>
		            <iframe src="about:blank" id="cmtinfo" width="0" height="0" frameborder="0">
		            </iframe>
		            <div id="commentArea-7005533" class="commentBox ">
		                <div class="admin_boxT linebg">
		                     &nbsp;
		                </div>
		                <div id="commentDiv-7005533" class="commentDiv bg_sub">
		                    <div id="commentPagingDiv-7005533" class="commentPagingDiv">
		                        <!-- 댓글 List -->
		                        <div id="commentData-7005533">
		                            <input type="hidden" name="PLAIN_REGDT" value="20130125001435">
		                            <input type="hidden" name="CMTTYPE" value="member">
		                            <input type="hidden" name="FOLDER_cmtTexticonyn" value="true">
		                            <input type="hidden" name="IS_POLL_BOARD" value="">
		                            <input type="hidden" name="POLL_URI" value="false">
		                            <input type="hidden" name="POLL_active" value="">
		                            <input type="hidden" name="IS_BBS_SEARCH_READ" value="false">
		                            <input type="hidden" name="CONTENTVAL" value="0TOSTzzzzzzzzzzzzzzzzzzzzzzzzz">
		                            <input type="hidden" name="DATAID" value="7005533">
		                            <input type="hidden" name="COMMENT_FLOODED" value="false">
		                            <input type="hidden" name="ESPAM" value=".M_gaj26K4ekyzQtCU88fI.iFtpYus-4Wo-8mJMg8yQ0">
		                            <input type="hidden" name="CPAGE" value="0">
		                            <input type="hidden" name="PAGE_COUNT" value="1">
		                            <input type="hidden" name="F_CDEPTH" value="">
		                            <input type="hidden" name="L_CDEPTH" value="">
		                            <input type="hidden" name="N_CDEPTH" value="">
		                            <input type="hidden" name="RECENT_MYFLDDATASEQ" value="0">
		                            <input type="hidden" name="OPENED_SEQ" value="0">
		                            <input type="hidden" name="HAS_PERMISSION" value="true">
		                            <input type="hidden" name="IS_QABOARD" value="false">
		                            <input type="hidden" name="IS_IMSI" value="false">
		                            <input type="hidden" name="IS_NO_AUTH_SIMPLEID" value="false">
		                            <input type="hidden" id="_cmt_count-7005533" value="0">
		                            <input type="hidden" id="_cmt_guest_count-7005533" value="0">
		                        </div>
		                        <script type="text/javascript">//<![CDATA[
		    var goFocusEl = function(){
		    //  if(daum.$("qna-a-c-item-7005533")){
		    //      Reply.activeCommentTemplate('12795');
		    //  }
		        var searchFocus = "${searchFocus}";
		        var focusCmt = daum.$(searchFocus);
		        if (focusCmt != null){
		            var coords = daum.Element.getCoords(focusCmt);
		            window.scrollTo(0, coords.top);
		        }
		    }
		    daum.Event.addEvent(window,"load",goFocusEl);
		//]]></script>
		                        <!-- // 댓글 List -->
		                    </div>
		                    <div id="comment_box_bg-7005533">
		                        <!-- 댓글 입력 Form -->
		                        <div id="replyWrite-7005533" class="longtail_editor longtail_reply">
		                            <div class="longtail_editor_layout">
		                                <table>
		                                <tbody>
		                                <tr>
		                                    <td class="longtail_comment inp">
		                                        <div class="longtail_comment_wrap">
		                                            <div class="preview_area">
		                                                <img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" class="upload_viewer" width="35" height="35" alt="첨부 이미지">
		                                                <a href="#" onclick="return false;" class="btn_delete">첨부 이미지 삭제</a>
		                                            </div>
		                                            <textarea class="inp scroll txt_sub" name="comment_view" rows="3" cols="56"></textarea>
		                                        </div>
		                                    </td>
		                                    <td class="longtail_editor_btn">
		                                        <a href="#" onclick="return false;" class="btn submit_content"><span class="btn_bg bg01"></span><span class="btn_txt bt01 b">등록</span></a>
		                                        <a href="#" onclick="return false;" class="btn submit_content_sub"><span class="btn_bg bg05"></span><span class="btn_txt bt05 w02">등록</span></a>
		                                        <a href="#" onclick="return false;" class="btn cancel_content"><span class="btn_bg bg05"></span><span class="btn_txt bt05 w02">취소</span></a>
		                                    </td>
		                                </tr>
		                                <tr class="longtail_menu_row">
		                                    <td>
		                                        <div class="longtail_editor_menu">
		                                            <ul class="menu_item_list" style="display: block;">
		                                                <li class="menu_photo" style="display: block;"><object type="application/x-shockwave-flash" data="http://editor.daum.net/cafe_reply/2011100701/coca.swf" width="21" height="21" id="uploader_replyWrite-7005533" style="visibility: visible;"><param name="quality" value="high"><param name="menu" value="false"><param name="swliveconnect" value="true"><param name="allowScriptAccess" value="always"><param name="wmode" value="transparent"><param name="scale" value="noscale"><param name="salign" value="LT"><param name="flashvars" value="coca_service=CafeReplyCoca&amp;coca_ctx=replyWrite-7005533&amp;service=cafe&amp;sname=cafe&amp;sid=cafe&amp;single_selection=true&amp;coca_skin=http://i1.daumcdn.net/cafeimg/cf_img4/bg/edit09_01.gif&amp;coca_over_skin=http://i1.daumcdn.net/cafeimg/cf_img4/bg/edit09_02.gif&amp;coca_down_skin=http://i1.daumcdn.net/cafeimg/cf_img4/bg/edit09_03.gif"></object></li>
		                                                <li class="menu_secret" style="display: block;"><a href="#" onclick="return false;" class="menu_item">비밀</a></li>
		                                                <li class="menu_setting" style="display: block;"><a href="#" onclick="return false;" class="menu_item" id="item_setting_replyWrite-7005533">설정</a></li>
		                                            </ul>
		                                            <span class="bar2 fl" style="display: block;">|</span>
		                                            <ul class="menu_item_list sns_share_items" style="display: block;">
		                                                <li class="first_cmt_sns sns_not_connected"><input type="checkbox" id="allowTwitterShare" class="twitter" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowTwitterShare" class="twitter_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="트위터에 함께 쓰기"></label></li>
		                                                <li class="sns_not_connected"><input type="checkbox" id="allowFaceBookShare" class="facebook" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowFaceBookShare" class="facebook_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="페이스북에 함께 쓰기"></label></li>
		                                                <li class="sns_not_connected"><input type="checkbox" id="allowNateShare" class="nate" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowNateShare" class="nate_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="네이트에 함께 쓰기"></label></li>
		                                                <li class="sns_not_connected"><input type="checkbox" id="allowMe2DayShare" class="me2day" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowMe2DayShare" class="me2day_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="미투데이에 함께 쓰기"></label></li>
		                                                <li class=""><input type="checkbox" id="allowYozmShare" class="yozm" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowYozmShare" class="yozm_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="요즘에 함께 쓰기"></label></li>
		                                                <li class="last sns_not_connected"><a class="txt_sub p11" href="http://blog.daum.net/cafe_notice/2055" target="_blank">SNS 내보내기란?<span class="arrow">▶</span></a></li>
		                                            </ul>
		                                            <span class="longtail_counter fr p11 ls0"><span class="text_counter txt_point b">50</span> / 300자</span>
		                                        </div>
		                                    </td>
		                                    <td>
		                                         &nbsp;
		                                    </td>
		                                </tr>
		                                </tbody>
		                                </table>
		                            </div>
		                            <script type="text/javascript">
		    CAFEAPP.ui.sns = {
		        snsPrefix : "%EB%AF%BC%ED%95%98+%EC%95%A0%EA%B0%80+%EC%95%A0%EA%B0%99%EC%A7%80%EA%B0%80%EC%95%8A%EC%95%84...",
		        snsLink : "http://cafe.daum.net/WorldcupLove/IC6M/7005533?docid=Jnt6IC6M700553320130125001435",
		        snsMetatype : "",
		        snsMetakey : "",
		        snsImagePath : "",
		        snsCaption : "cafe.daum.net&description=%EA%B7%80%EC%97%AC%EC%9A%B4%EB%8D%B0+%EB%AD%94%EA%B0%80+%EC%95%88%ED%83%80%EA%B9%8C%EC%9B%80..%EA%B9%80%EC%9D%91%EC%88%98%EB%94%B8%EC%9D%80+%EA%B7%B8%EB%9F%B0%EB%8A%90%EB%82%8C%EC%9D%B4+%EC%95%88%EB%93%9C%EB%8A%94%EB%8D%B0+%EB%AF%BC%ED%95%98%EB%A7%8C%EB%B3%B4%EB%A9%B4+%EC%A2%80...+%EB%84%88%EB%AC%B4%E3%85%A0%E3%85%A0%EC%95%84%EB%B9%A0%EC%96%B4%EB%94%94%EA%B0%80%EC%97%90+%EB%82%98%EC%98%A4%EB%8A%94%EC%95%A0%EB%93%A4%EC%9D%B4+%EB%94%B1+%EA%B7%B8%EB%82%98%EC%9D%B4%EB%95%8C+%EC%95%A0%EB%93%A4%EC%9D%B4%EB%9D%BC+%EC%9E%AC%EB%B0%8C%EB%8A%94%EA%B1%B4%EB%8D%B0..."   
		    }
		    CAFEAPP.ui.sns.allows = [
		                "yozm"
		                        ];
		    sendSNSUtil.applyAllows();
		                                        </script>
		                        </div>
		                        <!-- // 댓글 입력 Form -->
		                    </div>
		                    <!-- search box start -->
		                    <div class="search_box_elem cmt_search_box_sns ">
		                        <div class="cmt_center_wrap">
		                            <select name="item" class="inp fl">
		                                <option value="cmtContents">댓글내용</option>
		                                <option value="cmtNicknameNgram">댓글작성자</option>
		                            </select>
		                            <div class="suggest">
		                                <input type="text" name="query" value="" class="query inp fl" onkeydown="Reply.checkKeyEvent(event, '7005533');" autocomplete="off">
		                                <button type="button">서제스트 버튼</button>
		                            </div>
		                            <a href="#" class="btn_search" onclick="Reply.search(this, '7005533'); return false;"><img src="http://i1.daumcdn.net/cafeimg/cf_img4/img/btn_search.gif" class="fl" width="37" height="21" alt="검색"></a>
		                        </div>
		                    </div>
		                    <!-- search box end -->
		                </div>
		                <!-- end commentDiv -->
		                <div id="_cmt_reply_editor-7005533" class="longtail_editor longtail_reply" style="display:none;">
		                    <div class="longtail_editor_layout">
		                        <table>
		                        <tbody>
		                        <tr>
		                            <td class="longtail_comment inp">
		                                <div class="longtail_comment_wrap">
		                                    <div class="preview_area">
		                                        <img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" class="upload_viewer" width="35" height="35" alt="첨부 이미지">
		                                        <a href="#" onclick="return false;" class="btn_delete">첨부 이미지 삭제</a>
		                                    </div>
		                                    <textarea class="inp scroll txt_sub" name="comment_view" rows="3" cols="56"></textarea>
		                                </div>
		                            </td>
		                            <td class="longtail_editor_btn">
		                                <a href="#" onclick="return false;" class="btn submit_content"><span class="btn_bg bg01"></span><span class="btn_txt bt01 b">등록</span></a>
		                                <a href="#" onclick="return false;" class="btn submit_content_sub"><span class="btn_bg bg05"></span><span class="btn_txt bt05 w02">등록</span></a>
		                                <a href="#" onclick="return false;" class="btn cancel_content"><span class="btn_bg bg05"></span><span class="btn_txt bt05 w02">취소</span></a>
		                            </td>
		                        </tr>
		                        <tr class="longtail_menu_row">
		                            <td>
		                                <div class="longtail_editor_menu">
		                                    <ul class="menu_item_list" style="display: block;">
		                                        <li class="menu_photo" style="display: block;"><a class="menu_item coca_uploader">사진 올리기</a></li>
		                                        <li class="menu_secret" style="display: block;"><a href="#" onclick="return false;" class="menu_item">비밀</a></li>
		                                        <li class="menu_setting" style="display: block;"><a href="#" onclick="return false;" class="menu_item" id="item_setting__cmt_reply_editor-7005533">설정</a></li>
		                                    </ul>
		                                    <span class="bar2 fl" style="display: block;">|</span>
		                                    <ul class="menu_item_list sns_share_items" style="display: block;">
		                                        <li class="first_cmt_sns sns_not_connected"><input type="checkbox" id="allowTwitterShare" class="twitter" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowTwitterShare" class="twitter_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="트위터에 함께 쓰기"></label></li>
		                                        <li class="sns_not_connected"><input type="checkbox" id="allowFaceBookShare" class="facebook" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowFaceBookShare" class="facebook_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="페이스북에 함께 쓰기"></label></li>
		                                        <li class="sns_not_connected"><input type="checkbox" id="allowNateShare" class="nate" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowNateShare" class="nate_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="네이트에 함께 쓰기"></label></li>
		                                        <li class="sns_not_connected"><input type="checkbox" id="allowMe2DayShare" class="me2day" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowMe2DayShare" class="me2day_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="미투데이에 함께 쓰기"></label></li>
		                                        <li class=""><input type="checkbox" id="allowYozmShare" class="yozm" name="snsServiceNames" onclick="onclickSnsShareOnReply(event);"><label for="allowYozmShare" class="yozm_label"><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="13" height="13" alt="요즘에 함께 쓰기"></label></li>
		                                        <li class="last sns_not_connected"><a class="txt_sub p11" href="http://blog.daum.net/cafe_notice/2055" target="_blank">SNS 내보내기란?<span class="arrow">▶</span></a></li>
		                                    </ul>
		                                    <span class="longtail_counter fr p11 ls0"><span class="text_counter txt_point b">50</span> / 300자</span>
		                                </div>
		                            </td>
		                            <td>
		                                 &nbsp;
		                            </td>
		                        </tr>
		                        </tbody>
		                        </table>
		                    </div>
		                    <script type="text/javascript">
		    CAFEAPP.ui.sns = {
		        snsPrefix : "%EB%AF%BC%ED%95%98+%EC%95%A0%EA%B0%80+%EC%95%A0%EA%B0%99%EC%A7%80%EA%B0%80%EC%95%8A%EC%95%84...",
		        snsLink : "http://cafe.daum.net/WorldcupLove/IC6M/7005533?docid=Jnt6IC6M700553320130125001435",
		        snsMetatype : "",
		        snsMetakey : "",
		        snsImagePath : "",
		        snsCaption : "cafe.daum.net&description=%EA%B7%80%EC%97%AC%EC%9A%B4%EB%8D%B0+%EB%AD%94%EA%B0%80+%EC%95%88%ED%83%80%EA%B9%8C%EC%9B%80..%EA%B9%80%EC%9D%91%EC%88%98%EB%94%B8%EC%9D%80+%EA%B7%B8%EB%9F%B0%EB%8A%90%EB%82%8C%EC%9D%B4+%EC%95%88%EB%93%9C%EB%8A%94%EB%8D%B0+%EB%AF%BC%ED%95%98%EB%A7%8C%EB%B3%B4%EB%A9%B4+%EC%A2%80...+%EB%84%88%EB%AC%B4%E3%85%A0%E3%85%A0%EC%95%84%EB%B9%A0%EC%96%B4%EB%94%94%EA%B0%80%EC%97%90+%EB%82%98%EC%98%A4%EB%8A%94%EC%95%A0%EB%93%A4%EC%9D%B4+%EB%94%B1+%EA%B7%B8%EB%82%98%EC%9D%B4%EB%95%8C+%EC%95%A0%EB%93%A4%EC%9D%B4%EB%9D%BC+%EC%9E%AC%EB%B0%8C%EB%8A%94%EA%B1%B4%EB%8D%B0..."   
		    }
		    CAFEAPP.ui.sns.allows = [
		                "yozm"
		                        ];
		    sendSNSUtil.applyAllows();
		                                </script>
		                </div>
		                <div id="memoProfileLayer" class="profile_img_layer" style="display: none;">
		                    <img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="150" height="150" alt="프로필 이미지">
		                </div>
		                <script type="text/javascript">//<![CDATA[
		    if (typeof Memo != "undefined" && typeof Memo.Layer != "undefined") {
		        Memo.Layer.init();
		    }
		//]]></script>
		                <script type="text/javascript">//<![CDATA[
		        Reply.init("7005533");
		    //]]></script>
		                <script type="text/javascript" src="http://s1.daumcdn.net/cafecj/js/4/2009/suggest.min.js"></script>
		                <script type="text/javascript">
		        Suggest.init();
		    </script>
		            </div>
		            <!-- end commentBox -->
		            <!-- 하단 페이징 -->
		            <div class="list_btn_area lineT">
		                <a href="" class="btn"><span class="btn_bg bg03"></span><span class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span></a>
		                <a href="javascript:;" class="btn" onclick="check_reply('0TOSTzzzzzzzzzzzzzzzzzzzzzzzzz'); return false;"><span class="btn_bg bt03"></span><span class="btn_txt bt03 w03">답글</span></a>
		                <span class="list_paging">
		                <a href="bbs_list?grpid=Jnt6&amp;mgrpid=&amp;fldid=IC6M&amp;listnum=20#bbs_list_title">최신목록</a>
		                <span class="bar2">|</span>
		                <a href="">목록</a>
		                <span class="bar2">|</span>
		                <span class="arrow">▲</span><a href="">윗글</a>
		                <span class="bar2">|</span>
		                <span class="arrow">▼</span><a href="">아랫글</a>
		                </span>
		            </div>
		            <!-- end list_btn_area -->
		            <div class="cl">
		                 &nbsp;
		            </div>
		            <!-- 새롭게 추가된 윗글/아랫글 -->
		            <div class="prenext_paging">
		                <ul>
		                    <li>
		                    <span class="arrow">▲</span><a href="">윗글</a>&nbsp; &nbsp; <span class="bar2">|</span>&nbsp;<a href="">다들 뜨끔하십니까?ㅋㅋ</a><span class="txt_sub p11 ls0">2013.01.25</span>
		                    </li>
		                    <li>
		                    <span class="arrow">▼</span><a href="">아랫글</a>
		                    <span class="bar2">|</span>&nbsp;<a href="">님들 감기조심하세여 제발ㅠㅠ</a><span class="txt_sub p11 ls0">2013.01.25</span>
		                    </li>
		                </ul>
		            </div>
		        </form>
		        <div class="goTop">
		            <span class="arrow">▲</span><a href="#" title="탑으로 가기">top</a>
		        </div>
		        <form name="filefilterForm" action="" method="get">
		            <input type="hidden" name="grpid" value="">
		            <input type="hidden" name="kind" value="">
		            <input type="hidden" name="url" value="">
		            <input type="hidden" name="filekey" value="">
		            <input type="hidden" name="realname" value="">
		            <input type="hidden" name="v3param" value="">
		        </form>
		        <form name="pdsV3CheckForm" action="" method="post">
		        </form>
		        <!-- content end -->
		    </td>
		    <td class="rb" nowrap="">
		         &nbsp;
		    </td>
		</tr>
		<tr>
		    <td class="blb" nowrap="">
		         &nbsp;
		    </td>
		    <td class="bcb" nowrap="">
		    </td>
		    <td class="brb" nowrap="">
		         &nbsp;
		    </td>
		</tr>
		</tbody>
		</table>
        <!-- end roundTable -->
    </div>
    <!-- end primaryContent -->
</div>
<!-- end content -->
<script type="text/javascript">
//<![CDATA[
    MyCafeController.init();
    MyCafeController.showAlimi();
    MyRecentListViewController.init();

    function toggleHelpLayer(type, layerID){
        var layer = $E(layerID);
        if(layer != null){          
            if(type == 'over') layer.show();
            else if(type == 'out') layer.hide();
        }
    } 
//]]>
</script>

            
<br style="clear: both;">
<jsp:directive.include file="../include/footer.jspf"/>
    
</div>


<iframe name="proxyIframe" src="<%=request.getContextPath()%>/common/daum/cafe/suggestProxy.htm" style="display: none;" title="Suggest Proxy Frame"></iframe>

<div id="layerBreakingNewsSearch"></div>

</body>
</html>
