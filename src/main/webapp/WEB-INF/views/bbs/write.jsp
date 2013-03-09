<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>


<!-- end loading layer -->
<script type="text/javascript">window.jstTemplates = new Object();</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/mycafe-all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/cafe/jst-all.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/editor/css/editor.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/editor/js/editor_loader.js"></script>
<script type="text/javascript">
// <![CDATA[
    /*-------- 글 등록할 때 필요한 함수들 시작 ----------*/
    
    /* 예제용 함수 */
    function saveContent() {
        Editor.save(); /* 이 함수를 호출하여 글을 등록하면 된다. */
    }
    
    /**
     * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로 
     * 상황에 맞게 수정하여 사용한다.
     * 모든 데이터가 유효할 경우에 true를 리턴한다. 
     * @function
     * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
     * @returns {Boolean} 모든 데이터가 유효할 경우에 true
     */
    function validForm(editor) { 
        /* 제목 필드가 따로 존재할 경우 'tx_article_title'를 해당 아이디로 교체하여 사용. */
        if($tx('subject').value == ""){
            alert('제목을 입력하세요');
            return false;
        }

        /* 본문 내용이 입력되었는지 검사하는 부분 */
        var _validator = new Trex.Validator();
        var _content = editor.getContent();
        if(!_validator.exists(_content)) {
            alert('내용을 입력하세요');
            return false;
        }
        
        return true;
    }
    
    /**
     * Editor.save()를 호출한 경우 데이터가 유효하면
     * Form Summit을 위해 필드를 생성, 변경하기 위해 부르는 콜백함수로 
     * 상황에 맞게 수정하여 사용한다.
     * 정상적인 경우에 true를 리턴한다. 
     * @function
     * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
     * @returns {Boolean} 정상적인 경우에 true
     */
    function setForm(editor) {
        var _formGen = editor.getForm();
        
        var _content = editor.getContent();
        
        _formGen.createField(
            tx.textarea({ 
                /* 본문 내용을 필드를 생성하여 값을 할당하는 부분 */
                'name': "content", 
                'style': { 'display': "none" } 
            }, 
            _content)
        );

        /* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
         첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */  
        var _attachments = editor.getAttachments('image');
        for(var i=0,len=_attachments.length;i<len;i++) {
            /* existStage는 현재 본문에 존재하는지 여부 */ 
            if (_attachments[i].existStage) {
                /* data는 팝업에서 execAttach 등을 통해 넘긴 데이터 */
                alert(_attachments[i].data);
                _formGen.createField(
                    tx.input({ 
                        'type': "hidden", 
                        'name': 'tx_attach_image', 
                        'value': _attachments[i].data.imageurl /* 예에서는 이미지경로만 받아서 사용 */
                    })
                );
            }
        }
        
        return true;
    }
    /*-------- 글 등록할 때 필요한 함수들 끝 ----------*/
    // ]]>    
</script>
      <div id="page-outer" class="main_container">                 
        <div id="page-container" class="wrapper wrapper-profile white">
<div id="wrap_sub_content" class="vipCafe">
    <div id="primaryContent">
        <table class="roundTable">
        <tbody class="pos_rel">
        <tr>
            <td class="tlb" nowrap>
                 &nbsp;
            </td>
            <td class="tcb" nowrap>
                 &nbsp;
            </td>
            <td class="trb" nowrap>
                 &nbsp;
            </td>
        </tr>
        <tr class="pos_rel">
            <td class="lb" nowrap>
                 &nbsp;
            </td>
            <td class="cb">
                <div class="content_wrap">
                    <h3 class="sub_title line_title_sub">
                    <span id="sub-title" class="list_title_sub">글쓰기<%=request.getContextPath()%></span>
                    </h3>
                    <ul class="write_tip p11">
                        <li id="bbs_album" style="display: none;">앨범 게시판은 <span class="txt_point">사진 첨부</span>한 글만 등록 가능합니다.</li>
                        <li id="noSelectStyle" class="txt_sub" style="display: none;">운영진이 글 속성(크기·색깔·굵기)을 지정하지 않은 게시판입니다.</li>
                        <li id="msg_searchOpen" class="txt_sub" style="display: none;">검색/Daum서비스 공개 설정된 게시판으로, 읽기 권한과 무관하게 검색 및 연동된 서비스를 통해 내용이 공개됩니다.</li>
                        <li id="msg_qa" style="display: none;">Q&amp;A게시판은 답변이 등록되면 수정/삭제가 불가능 합니다.</li>
                    </ul>
				    <form name="articleForm" id="articleForm" action="/infoshop/${m_id}" method="post" accept-charset="utf-8">
						<input type="hidden" name="m_id" id="m_id" value="${m_id}"> <!-- 카테고리 아이디 -->
                        <input type="hidden" name="mb_id" id="mb_id" <c:choose><c:when test="${empty userInfo}">value="makjoa"</c:when><c:otherwise> value="${userInfo.id}"</c:otherwise></c:choose>>                         
                        <input type="hidden" name="name" id="name" value="Rivaldo"> <!-- 작성자 -->
                        <input type="hidden" name="password" id="password" value="4842"> <!-- 작성자 -->
                        <input type="hidden" name="email" id=""email"" value="jpbabo@nate.com"> <!-- 작성자 -->
					<div id="write_head">
					    <h4>게시판</h4>
					    <span>
					    <select id="folder" name="folder" class="inp" onchange="changeBBS(this.value);">
					        <option value="">게시판 선택　</option>
					            <option selected="selected" value="IC6M">★ …… 프 리 토 크☆</option>     
					            <option value="JxQ1">◎ …… 나의 베스트</option>       
					            <option value="I41M">◎ …… 매니아 칼럼</option>       
					            <option value="Ukqb">◈ …… 관 람 후 기☆</option>     
					            <option value="OUB">◎ …… 대표팀 정보</option>        
					            <option value="Ha6">★ …… 대표팀 토크</option>        
					            <option value="QPN">◎ …… 풀경기 영상</option>          
					        </select>
					    </span>    <p class="head_set" id="spanHeadArea" style="display: inline;">
					        <select id="sort" name="sort" class="inp" style="display: none;"><option value="">말머리 없음</option></select>                               
					            </p>
					    <p class="head_opt">    
		                      <span id="allowProductInfoWrap" style="display: none;">
		                      <input type="checkbox" id="allowProductInfo" name="allowProductInfo" onclick="Escrow.setVisibleForms(this.checked);" checked="checked"><label for="allowProductInfo">상품정보 포함</label></span>
					    </p>
					</div>
					<!--                                                        -->
					<div id="write_title" class="line_sub" style="background-color: rgb(255, 255, 255);"> 
					<h4>제목</h4>
					    <p class="title_inp" style="float: left;margin: 0px;line-height: 27px;"><input type="text" maxlength="150" class="inp" id="subject" name="subject" onkeyup="updateCharter(this,'textlimit',75)" style="font-size: 9pt; font-weight: normal; background-color: rgb(255, 255, 255);"></p>
					    <input type="hidden" name="subj1" id="subj1" value=""> <!-- 굵기 -->
					    <input type="hidden" name="subj2" id="subj2" value=""> <!-- 색상 -->
					    <input type="hidden" name="subj3" id="subj3" value=""> <!-- 크기 -->
					    <div class="title_editor line_sub" id="span_title" style="display: block;">   
					    <ul class="title_editor_menu">
					            <li class="tx-list">
					            <div unselectable="on" class="tx-slt-42bg" id="tx_titleFontSize">
					                <a href="javascript:;" id="tx_fontsize_text" title="글자크기"><span>9pt</span></a>
					            </div>
					            <div id="tx_titleFontSize_menu" class="tx-titleFontSize-menu tx-menu" unselectable="on" style="left:-210px;width:250px;"></div>
					        </li>
					                <li class="tx-list">
					            <div unselectable="on" class="       tx-btn-lbg     tx-titleFontBold" id="tx_titleFontBold">
					                <a href="javascript:;" class="tx-icon" title="굵기">굵기</a>
					            </div>
					        </li>
					                <li class="tx-list">
					            <div unselectable="on" class="tx-slt-trbg" id="tx_titleFontColor" style="background-color: rgb(92, 127, 176);">
					                <a href="javascript:;" class="tx-icon" title="글자색상">글자색상</a>
					                <a href="javascript:;" class="tx-arrow" title="글자색 선택">글자색 선택</a>
					            </div>
					            <div id="tx_titleFontColor_menu" class="tx-menu tx-titleFontColor-menu tx-colorpallete" unselectable="on" style="left:-145px">
					                <div class="tx-menu-inner">
					                    <ul class="tx-menu-pallete-list">
					                        <li class="tx-more-color">
					                            <a onfocus="this.blur();" class="tx-more-down" href="javascript:;">더보기</a>
					                        </li>
					                    </ul>
					                    <div class="tx-color-picker">
					                        <p><span style="background-color: rgb(7, 3, 3);"></span><input type="text"><a>입력</a></p>
					                        <div class="tx-color-picker-bar">
					                            <div class="tx-chromabar" style="background-color: rgb(255, 0, 0);"></div><div class="tx-huebar"></div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </li>
					                       <li class="tx-list">
					                <div unselectable="on" class="       tx-btn-lrbg    tx-undo" id="tx_titleFontReset">
					                    <a href="javascript:;" class="tx-icon" title="원래대로">원래대로</a>
					                </div>
					            </li>
					        </ul>       
					    </div>
					    <span class="title_cnt" style="display:none;"><span id="textlimit" class="point">0</span> / 75자</span>
					</div>									    
				        <!-- 에디터 컨테이너 시작 -->
				        <div id="tx_trex_container" class="tx-editor-container">
				            <!-- 사이드바 -->
				            <div id="tx_sidebar" class="tx-sidebar">
				                <div class="tx-sidebar-boundary">
				                    <!-- 사이드바 / 첨부 -->
				                    <ul class="tx-bar tx-bar-left tx-nav-attach">
				                        <!-- 이미지 첨부 버튼 시작 -->
				                        <!--
				                            @decsription
				                            <li></li> 단위로 위치를 이동할 수 있다.
				                        -->
				                        <li class="tx-list">
				                            <div unselectable="on" id="tx_image" class="tx-image tx-btn-trans">
				                                <a href="javascript:;" title="사진" class="tx-text">사진</a>
				                            </div>
				                        </li>
				                        <!-- 이미지 첨부 버튼 끝 -->
				                        <li class="tx-list">
				                            <div unselectable="on" id="tx_file" class="tx-file tx-btn-trans">
				                                <a href="javascript:;" title="파일" class="tx-text">파일</a>
				                            </div>
				                        </li>
				                        <li class="tx-list">
				                            <div unselectable="on" id="tx_media" class="tx-media tx-btn-trans">
				                                <a href="javascript:;" title="외부컨텐츠" class="tx-text">외부컨텐츠</a>
				                            </div>
				                        </li>
				                        <li class="tx-list tx-list-extra">
				                            <div unselectable="on" class="tx-btn-nlrbg tx-extra">
				                                <a href="javascript:;" class="tx-icon" title="버튼 더보기">버튼 더보기</a>
				                            </div>
				                            <ul class="tx-extra-menu tx-menu" style="left:-48px;" unselectable="on">
				                                <!--
				                                    @decsription
				                                    일부 버튼들을 빼서 레이어로 숨기는 기능을 원할 경우 이 곳으로 이동시킬 수 있다.
				                                -->
				                            </ul>
				                        </li>
				                    </ul>
				                    <!-- 사이드바 / 우측영역 -->
				                    <ul class="tx-bar tx-bar-right">
				                        <li class="tx-list">
				                            <div unselectable="on" class="tx-btn-lrbg tx-fullscreen" id="tx_fullscreen">
				                                <a href="javascript:;" class="tx-icon" title="넓게쓰기 (Ctrl+M)">넓게쓰기</a>
				                            </div>
				                        </li>
				                    </ul>
				                    <ul class="tx-bar tx-bar-right tx-nav-opt">
				                        <li class="tx-list">
				                            <div unselectable="on" class="tx-switchtoggle" id="tx_switchertoggle">
				                                <a href="javascript:;" title="에디터 타입">에디터</a>
				                            </div>
				                        </li>
				                    </ul>
				                </div>
				            </div>
				
				            <!-- 툴바 - 기본 시작 -->
				            <!--
				                @decsription
				                툴바 버튼의 그룹핑의 변경이 필요할 때는 위치(왼쪽, 가운데, 오른쪽) 에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				                tx-btn-lbg: 왼쪽, tx-btn-bg: 가운데, tx-btn-rbg: 오른쪽, tx-btn-lrbg: 독립적인 그룹
				
				                드롭다운 버튼의 크기를 변경하고자 할 경우에는 넓이에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				                tx-slt-70bg, tx-slt-59bg, tx-slt-42bg, tx-btn-43lrbg, tx-btn-52lrbg, tx-btn-57lrbg, tx-btn-71lrbg
				                tx-btn-48lbg, tx-btn-48rbg, tx-btn-30lrbg, tx-btn-46lrbg, tx-btn-67lrbg, tx-btn-49lbg, tx-btn-58bg, tx-btn-46bg, tx-btn-49rbg
				            -->
				            <div id="tx_toolbar_basic" class="tx-toolbar tx-toolbar-basic"><div class="tx-toolbar-boundary">
				                <ul class="tx-bar tx-bar-left">
				                    <li class="tx-list">
				                        <div id="tx_fontfamily" unselectable="on" class="tx-slt-70bg tx-fontfamily">
				                            <a href="javascript:;" title="글꼴">굴림</a>
				                        </div>
				                        <div id="tx_fontfamily_menu" class="tx-fontfamily-menu tx-menu" unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left">
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-slt-42bg tx-fontsize" id="tx_fontsize">
				                            <a href="javascript:;" title="글자크기">9pt</a>
				                        </div>
				                        <div id="tx_fontsize_menu" class="tx-fontsize-menu tx-menu" unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left tx-group-font">
				
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-lbg     tx-bold" id="tx_bold">
				                            <a href="javascript:;" class="tx-icon" title="굵게 (Ctrl+B)">굵게</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-underline" id="tx_underline">
				                            <a href="javascript:;" class="tx-icon" title="밑줄 (Ctrl+U)">밑줄</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-italic" id="tx_italic">
				                            <a href="javascript:;" class="tx-icon" title="기울임 (Ctrl+I)">기울임</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-strike" id="tx_strike">
				                            <a href="javascript:;" class="tx-icon" title="취소선 (Ctrl+D)">취소선</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-slt-tbg     tx-forecolor" id="tx_forecolor">
				                            <a href="javascript:;" class="tx-icon" title="글자색">글자색</a>
				                            <a href="javascript:;" class="tx-arrow" title="글자색 선택">글자색 선택</a>
				                        </div>
				                        <div id="tx_forecolor_menu" class="tx-menu tx-forecolor-menu tx-colorpallete"
				                             unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-slt-brbg    tx-backcolor" id="tx_backcolor">
				                            <a href="javascript:;" class="tx-icon" title="글자 배경색">글자 배경색</a>
				                            <a href="javascript:;" class="tx-arrow" title="글자 배경색 선택">글자 배경색 선택</a>
				                        </div>
				                        <div id="tx_backcolor_menu" class="tx-menu tx-backcolor-menu tx-colorpallete"
				                             unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left tx-group-align">
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-lbg     tx-alignleft" id="tx_alignleft">
				                            <a href="javascript:;" class="tx-icon" title="왼쪽정렬 (Ctrl+,)">왼쪽정렬</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-aligncenter" id="tx_aligncenter">
				                            <a href="javascript:;" class="tx-icon" title="가운데정렬 (Ctrl+.)">가운데정렬</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-alignright" id="tx_alignright">
				                            <a href="javascript:;" class="tx-icon" title="오른쪽정렬 (Ctrl+/)">오른쪽정렬</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-rbg     tx-alignfull" id="tx_alignfull">
				                            <a href="javascript:;" class="tx-icon" title="양쪽정렬">양쪽정렬</a>
				                        </div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left tx-group-tab">
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-lbg     tx-indent" id="tx_indent">
				                            <a href="javascript:;" title="들여쓰기 (Tab)" class="tx-icon">들여쓰기</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-rbg     tx-outdent" id="tx_outdent">
				                            <a href="javascript:;" title="내어쓰기 (Shift+Tab)" class="tx-icon">내어쓰기</a>
				                        </div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left tx-group-list">
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-slt-31lbg tx-lineheight" id="tx_lineheight">
				                            <a href="javascript:;" class="tx-icon" title="줄간격">줄간격</a>
				                            <a href="javascript:;" class="tx-arrow" title="줄간격">줄간격 선택</a>
				                        </div>
				                        <div id="tx_lineheight_menu" class="tx-lineheight-menu tx-menu" unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-slt-31rbg tx-styledlist" id="tx_styledlist">
				                            <a href="javascript:;" class="tx-icon" title="리스트">리스트</a>
				                            <a href="javascript:;" class="tx-arrow" title="리스트">리스트 선택</a>
				                        </div>
				                        <div id="tx_styledlist_menu" class="tx-styledlist-menu tx-menu" unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left tx-group-etc">
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-lbg     tx-emoticon" id="tx_emoticon">
				                            <a href="javascript:;" class="tx-icon" title="이모티콘">이모티콘</a>
				                        </div>
				                        <div id="tx_emoticon_menu" class="tx-emoticon-menu tx-menu" unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-link" id="tx_link">
				                            <a href="javascript:;" class="tx-icon" title="링크 (Ctrl+K)">링크</a>
				                        </div>
				                        <div id="tx_link_menu" class="tx-link-menu tx-menu"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-specialchar" id="tx_specialchar">
				                            <a href="javascript:;" class="tx-icon" title="특수문자">특수문자</a>
				                        </div>
				                        <div id="tx_specialchar_menu" class="tx-specialchar-menu tx-menu"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-table" id="tx_table">
				                            <a href="javascript:;" class="tx-icon" title="표만들기">표만들기</a>
				                        </div>
				                        <div id="tx_table_menu" class="tx-table-menu tx-menu" unselectable="on">
				                            <div class="tx-menu-inner">
				                                <div class="tx-menu-preview"></div>
				                                <div class="tx-menu-rowcol"></div>
				                                <div class="tx-menu-deco"></div>
				                                <div class="tx-menu-enter"></div>
				                            </div>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-rbg     tx-horizontalrule" id="tx_horizontalrule">
				                            <a href="javascript:;" class="tx-icon" title="구분선">구분선</a>
				                        </div>
				                        <div id="tx_horizontalrule_menu" class="tx-horizontalrule-menu tx-menu" unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left">
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-lbg     tx-richtextbox" id="tx_richtextbox">
				                            <a href="javascript:;" class="tx-icon" title="글상자">글상자</a>
				                        </div>
				                        <div id="tx_richtextbox_menu" class="tx-richtextbox-menu tx-menu">
				                            <div class="tx-menu-header">
				                                <div class="tx-menu-preview-area">
				                                    <div class="tx-menu-preview"></div>
				                                </div>
				                                <div class="tx-menu-switch">
				                                    <div class="tx-menu-simple tx-selected"><a><span>간단 선택</span></a></div>
				                                    <div class="tx-menu-advanced"><a><span>직접 선택</span></a></div>
				                                </div>
				                            </div>
				                            <div class="tx-menu-inner">
				                            </div>
				                            <div class="tx-menu-footer">
				                                <img class="tx-menu-confirm"
				                                     src="./images/icon/editor/btn_confirm.gif?rv=1.0.1" alt=""/>
				                                <img class="tx-menu-cancel" hspace="3"
				                                     src="./images/icon/editor/btn_cancel.gif?rv=1.0.1" alt=""/>
				                            </div>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-quote" id="tx_quote">
				                            <a href="javascript:;" class="tx-icon" title="인용구 (Ctrl+Q)">인용구</a>
				                        </div>
				                        <div id="tx_quote_menu" class="tx-quote-menu tx-menu" unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-bg  tx-background" id="tx_background">
				                            <a href="javascript:;" class="tx-icon" title="배경색">배경색</a>
				                        </div>
				                        <div id="tx_background_menu" class="tx-menu tx-background-menu tx-colorpallete"
				                             unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-rbg     tx-dictionary" id="tx_dictionary">
				                            <a href="javascript:;" class="tx-icon" title="사전">사전</a>
				                        </div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left tx-group-undo">
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-lbg     tx-undo" id="tx_undo">
				                            <a href="javascript:;" class="tx-icon" title="실행취소 (Ctrl+Z)">실행취소</a>
				                        </div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="       tx-btn-rbg     tx-redo" id="tx_redo">
				                            <a href="javascript:;" class="tx-icon" title="다시실행 (Ctrl+Y)">다시실행</a>
				                        </div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-right">
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-btn-nlrbg tx-advanced" id="tx_advanced">
				                            <a href="javascript:;" class="tx-icon" title="툴바 더보기">툴바 더보기</a>
				                        </div>
				                    </li>
				                </ul>
				            </div></div>
				            <!-- 툴바 - 기본 끝 -->
				            <!-- 툴바 - 더보기 시작 -->
				            <div id="tx_toolbar_advanced" class="tx-toolbar tx-toolbar-advanced"><div class="tx-toolbar-boundary">
				                <ul class="tx-bar tx-bar-left">
				                    <li class="tx-list">
				                        <div class="tx-tableedit-title"></div>
				                    </li>
				                </ul>
				
				                <ul class="tx-bar tx-bar-left tx-group-align">
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-btn-lbg tx-mergecells" id="tx_mergecells">
				                            <a href="javascript:;" class="tx-icon2" title="병합">병합</a>
				                        </div>
				                        <div id="tx_mergecells_menu" class="tx-mergecells-menu tx-menu" unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-btn-bg tx-insertcells" id="tx_insertcells">
				                            <a href="javascript:;" class="tx-icon2" title="삽입">삽입</a>
				                        </div>
				                        <div id="tx_insertcells_menu" class="tx-insertcells-menu tx-menu" unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div unselectable="on" class="tx-btn-rbg tx-deletecells" id="tx_deletecells">
				                            <a href="javascript:;" class="tx-icon2" title="삭제">삭제</a>
				                        </div>
				                        <div id="tx_deletecells_menu" class="tx-deletecells-menu tx-menu" unselectable="on"></div>
				                    </li>
				                </ul>
				
				                <ul class="tx-bar tx-bar-left tx-group-align">
				                    <li class="tx-list">
				                        <div id="tx_cellslinepreview" unselectable="on" class="tx-slt-70lbg tx-cellslinepreview">
				                            <a href="javascript:;" title="선 미리보기"></a>
				                        </div>
				                        <div id="tx_cellslinepreview_menu" class="tx-cellslinepreview-menu tx-menu"
				                             unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div id="tx_cellslinecolor" unselectable="on" class="tx-slt-tbg tx-cellslinecolor">
				                            <a href="javascript:;" class="tx-icon2" title="선색">선색</a>
				
				                            <div class="tx-colorpallete" unselectable="on"></div>
				                        </div>
				                        <div id="tx_cellslinecolor_menu" class="tx-cellslinecolor-menu tx-menu tx-colorpallete"
				                             unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div id="tx_cellslineheight" unselectable="on" class="tx-btn-bg tx-cellslineheight">
				                            <a href="javascript:;" class="tx-icon2" title="두께">두께</a>
				
				                        </div>
				                        <div id="tx_cellslineheight_menu" class="tx-cellslineheight-menu tx-menu"
				                             unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div id="tx_cellslinestyle" unselectable="on" class="tx-btn-bg tx-cellslinestyle">
				                            <a href="javascript:;" class="tx-icon2" title="스타일">스타일</a>
				                        </div>
				                        <div id="tx_cellslinestyle_menu" class="tx-cellslinestyle-menu tx-menu" unselectable="on"></div>
				                    </li>
				                    <li class="tx-list">
				                        <div id="tx_cellsoutline" unselectable="on" class="tx-btn-rbg tx-cellsoutline">
				                            <a href="javascript:;" class="tx-icon2" title="테두리">테두리</a>
				
				                        </div>
				                        <div id="tx_cellsoutline_menu" class="tx-cellsoutline-menu tx-menu" unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left">
				                    <li class="tx-list">
				                        <div id="tx_tablebackcolor" unselectable="on" class="tx-btn-lrbg tx-tablebackcolor"
				                             style="background-color:#9aa5ea;">
				                            <a href="javascript:;" class="tx-icon2" title="테이블 배경색">테이블 배경색</a>
				                        </div>
				                        <div id="tx_tablebackcolor_menu" class="tx-tablebackcolor-menu tx-menu tx-colorpallete"
				                             unselectable="on"></div>
				                    </li>
				                </ul>
				                <ul class="tx-bar tx-bar-left">
				                    <li class="tx-list">
				                        <div id="tx_tabletemplate" unselectable="on" class="tx-btn-lrbg tx-tabletemplate">
				                            <a href="javascript:;" class="tx-icon2" title="테이블 서식">테이블 서식</a>
				                        </div>
				                        <div id="tx_tabletemplate_menu" class="tx-tabletemplate-menu tx-menu tx-colorpallete"
				                             unselectable="on"></div>
				                    </li>
				                </ul>
				
				            </div></div>
				            <!-- 툴바 - 더보기 끝 -->
				            <!-- 편집영역 시작 -->
				                <!-- 에디터 Start -->
				    <div id="tx_canvas" class="tx-canvas">
				        <div id="tx_loading" class="tx-loading"><div><img src="<%=request.getContextPath()%>/resources/editor/images/icon/editor/loading2.png" width="113" height="21" align="absmiddle"/></div></div>
				        <div id="tx_canvas_wysiwyg_holder" class="tx-holder" style="display:block;">
				            <iframe id="tx_canvas_wysiwyg" name="tx_canvas_wysiwyg" allowtransparency="true" frameborder="0"></iframe>
				        </div>
				        <div class="tx-source-deco">
				            <div id="tx_canvas_source_holder" class="tx-holder">
				                <textarea id="tx_canvas_source" name="" rows="30" cols="30"></textarea>
				            </div>
				        </div>
				        <div id="tx_canvas_text_holder" class="tx-holder">
				            <textarea id="tx_canvas_text" name="content" rows="30" cols="30"></textarea>
				        </div>
				    </div>
				                    <!-- 높이조절 Start -->
				    <div id="tx_resizer" class="tx-resize-bar">
				        <div class="tx-resize-bar-bg"></div>
				        <img id="tx_resize_holder" src="<%=request.getContextPath()%>/resources/editor/images/icon/editor/skin/01/btn_drag01.gif" width="58" height="12" unselectable="on" alt="" />
				    </div>
				                    <div class="tx-side-bi" id="tx_side_bi">
				        <div style="text-align: right;">
				            <img hspace="4" height="14" width="78" align="absmiddle" src="<%=request.getContextPath()%>/resources/editor/images/icon/editor/editor_bi.png" />
				        </div>
				    </div>
				                <!-- 편집영역 끝 -->
				            <!-- 첨부박스 시작 -->
				                <!-- 파일첨부박스 Start -->
				    <div id="tx_attach_div" class="tx-attach-div">
				        <div id="tx_attach_txt" class="tx-attach-txt">파일 첨부</div>
				        <div id="tx_attach_box" class="tx-attach-box">
				            <div class="tx-attach-box-inner">
				                <div id="tx_attach_preview" class="tx-attach-preview"><p></p><img src="<%=request.getContextPath()%>/resources/editor/images/icon/editor/pn_preview.gif" width="147" height="108" unselectable="on"/></div>
				                <div class="tx-attach-main">
				                    <div id="tx_upload_progress" class="tx-upload-progress"><div>0%</div><p>파일을 업로드하는 중입니다.</p></div>
				                    <ul class="tx-attach-top">
				                        <li id="tx_attach_delete" class="tx-attach-delete"><a>전체삭제</a></li>
				                        <li id="tx_attach_size" class="tx-attach-size">
				                            파일: <span id="tx_attach_up_size" class="tx-attach-size-up"></span>/<span id="tx_attach_max_size"></span>
				                        </li>
				                        <li id="tx_attach_tools" class="tx-attach-tools">
				                        </li>
				                    </ul>
				                    <ul id="tx_attach_list" class="tx-attach-list"></ul>
				                </div>
				            </div>
				        </div>
				    </div>
				                <!-- 첨부박스 끝 -->
                </div>
                <!-- 에디터 컨테이너 끝 -->
				    </form>
                    <!-- 에디터 컨테이너 끝 -->
<script type="text/javascript">
    var config = {
        txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
        txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
        txService: 'sample', /* 수정필요없음. */
        txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
        initializedId: "", /* 대부분의 경우에 빈문자열 */
        wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
        form: 'articleForm'+"", /* 등록하기 위한 Form 이름 */
        txIconPath: "<%=request.getContextPath()%>/editor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
        txDecoPath: "<%=request.getContextPath()%>/editor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
        canvas: {
            styles: {
                color: "#123456", /* 기본 글자색 */
                fontFamily: "굴림", /* 기본 글자체 */
                fontSize: "10pt", /* 기본 글자크기 */
                backgroundColor: "#fff", /*기본 배경색 */
                lineHeight: "1.5", /*기본 줄간격 */
                padding: "8px" /* 위지윅 영역의 여백 */
            },
            showGuideArea: false
        },
        events: {
            preventUnload: false
        },
        sidebar: {
            attachbox: {
                show: true
            }
        },
        size: {
            contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
        }
    };

    EditorJSLoader.ready(function(Editor) {
        var editor = new Editor(config);
    });
    
</script>                    
			<div id="bgcolor_tmp" style="display:none">
			</div>
			<div class="list_btn_area lineT pos_rel">
			    <span class="center_btn_area3">
			    <a href="#" onclick="submit_article(true); return false;" class="btn"><span class="btn_bg bg02"></span><span class="btn_txt bt02 w06">미리보기</span></a>
			    <a href="#" onclick="saveContent(); return false;" class="btn"><span class="btn_bg bg02"></span><span class="btn_txt bt02 b">확인</span></a>
			    </span>
			    <span class="btn_cancel_area"><a href="#" onclick="history.back(); return false;" class="btn"><span class="btn_bg bg02"></span><span class="btn_txt bt02">취소</span></a></span>
			</div>
			<!-- end list_btn_area -->
			<form name="msg_submitform" method="post" action="/_c21_/EchoServlet">
			    <input type="hidden" name="" value="">
			</form>
			<!-- centents table end -->
			<!-- content end -->
			</div>
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
</div>
</div>

</body>
</html>
