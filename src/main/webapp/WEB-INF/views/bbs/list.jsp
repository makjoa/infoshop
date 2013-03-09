<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/daum/css/default.css">
 <div id="content-outer" class="main_container">   
   

<div id="shortLoading" style="display: none;"><img src="<%=request.getContextPath()%>/common/daum/cafe/loading.gif" width="12" height="13" alt="로딩중"></div>
<!-- end loading layer -->
<script type="text/javascript">window.jstTemplates = new Object();</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/daum/js/mycafe-all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/bbs_list_page.js"></script>
<script type="text/javascript">
    //<![CDATA[
    new ClientErrorHandler().install();
    new ServerErrorHandler().install();
    //]]>
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
                <a name="bbs_list_title"></a>
                <h3 class="title">
                <a href="" class="list_title_sub">★ …… 프 리 토 크☆</a><span class="bar2">|</span><span>축구 매니아들의 실시간 프리 토크^^</span>
                <span><a href="" target="_blank"><img src="ic_msn2.gif" width="128" height="19" alt="windows live 메신저 알림" class="vam imgL"></a></span>
                <span><a id="btnShowRssMenu" class="rss p11" href="" target="_blank" onclick="">구독하기</a></span>
                <div id="RssLayer" class="commLayer">
                    <ul>
                        <li class="first"><a href="javascript:copyRssChannel('', false)">주소 복사하기</a></li>
                        <li class="layer_dotline"></li>
                        <li><a href="javascript:copyRssChannelToCafe('')">카페 RSS게시판</a></li>
                        <li><a href="javascript:copyRssChannelToBlog('')" onclick="">블로그 알리미</a></li>
                    </ul>
                </div>
                </h3>
                <div class="list_btn_areaT">
                    <a href="/infoshop/bbs/form/bbs" class="btn"><span class="btn_bg bg03"></span><span class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span>
                    </a><span class="newdata_cnt"> &nbsp;새글 <strong class="txt_point">1877</strong> / 4437035</span>
                    <div class="list_tr_area">
                        <span class="hide_noti">
                        <input id="hideNotiCheck" type="checkbox" onclick="">
                        <label for="hideNotiCheck">공지감추기</label>
                        </span>
                        <span class="bar2">|</span>
                        <a href="" id="viewListBtn" onclick="">목록 20개</a><span class="arrow">▼</span>
                        <div id="viewListLayer" class="cafeLayer scroll">
                            <ul>
                                <li>
                                <a href="" onclick="setListNum(10); return false;">10개</a>
                                </li>
                                <li>
                                <a href="" onclick=" return false;">20개</a>
                                </li>
                                <li>
                                <a href="" onclick="setListNum(30); return false;">30개</a>
                                </li>
                                <li>
                                <a href="" onclick="setListNum(40); return false;">40개</a>
                                </li>
                                <li>
                                <a href="" onclick="setListNum(50); return false;">50개</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <form name="listForm" method="post">
                    <input type="hidden" name="moveto" value="">
                    <input type="hidden" name="changerolecode" value="">
                    <table class="bbsList" summary="★ …… 프 리 토 크☆ - 축구 매니아들의 실시간 프리 토크^^">
                    <caption>★ …… 프 리 토 크☆</caption>
                    <thead>
                    <tr>
                        <th>
                        </th>
                        <th nowrap="nowrap" class="header">
                        </th>
                        <th>
                            제목
                        </th>
                        <th>
                            글쓴이
                        </th>
                        <th nowrap="nowrap">
                            작성일
                        </th>
                        <th nowrap="nowrap">
                            조회
                        </th>
                        <th nowrap="nowrap">
                            추천
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="num" nowrap="nowrap">
                            공지 <br>
                        </td>
                        <td class="headcate txt_sub" nowrap="nowrap">
                        </td>
                        <td class="subject">
                            <a href="" class="b"><b><font color="#FF5E00">지금만나러 갑니다 : 런던올림픽 축구대표팀&amp;대한민국 축구국가대표팀 수비수 윤석영선수</font></b>
                            </a>
                            <a href="javascript:;" onclick="" class="txt_point num b">[119]</a>
                        </td>
                        <td class="nick">
                            <a href="javascript:;" onclick="">만치니어딜만치니</a>
                        </td>
                        <td class="date" nowrap="nowrap">
                            13.01.11
                        </td>
                        <td class="count" nowrap="nowrap">
                            14700
                        </td>
                        <td class="recommend_cnt" nowrap="nowrap">
                            28
                        </td>
                    </tr>
                    <!-- 공지기능 적용끝 -->                    
                    <c:forEach var="info" items="${getBoardList}" begin="0" end="10">
                    <tr>
                        <td class="num" nowrap="nowrap">
                            ${info.datanum}
                        </td>
                        <td class="headcate txt_sub" nowrap="nowrap">
                        </td>
                        <td class="subject">
                            <a href="/infoshop/v=${info.datanum}">
                            <img src="ico_mobile.gif" width="8" height="12" alt="모바일 작성글" class="icon_mobile">${info.subject}</a>
                            <img src="img_blank2.gif" width="8" height="12" alt="새글" class="icon_new">
                        </td>
                        <td class="nick">
                            <a href="javascript:;" onclick="">${info.name}</a>
                        </td>
                        <td class="date" nowrap="nowrap">
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${info.datetime}"/>    
                        </td>
                        <td class="count" nowrap="nowrap">
                           
                        </td>
                        <td class="recommend_cnt" nowrap="nowrap">
                            0
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                    <!-- end bbsList -->
                    <input type="hidden" name="grpid" value="Jnt6">
                    <input type="hidden" name="fldid" value="IC6M">
                    <input type="hidden" name="firstbbsdepth">
                    <input type="hidden" name="lastbbsdepth">
                    <input type="hidden" name="page">
                    <input type="hidden" name="prev_page">
                </form>
                <div class="list_btn_area">
                    <a href="" onclick="" class="btn"><span class="btn_bg bg03"></span><span class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span>
                    </a>
                    <div class="paging">
                    <c:set var="pagingList" value="${pagingList}"/>
                    <c:set var="nTotalRecordSize" value="${pagingList.nTotalRecordSize}"/>      <!-- 전체 record size -->
                    <c:set var="nRecordSize" value="${pagingList.nRecordSize}"/>                    <!-- 한 페이지당 보여줄 record size -->
                    <c:set var="nBlockSize" value="${pagingList.nBlockSize}"/>                         <!--한블록당 보여줄 블록 size -->
                    <c:set var="nBlockGrpSize" value="${pagingList.nBlockGrpSize}"/>                <!--블록 그룹 size -->
                    <c:set var="nTotalPageSize" value="${pagingList.nTotalPageSize}"/>             <!--전체 페이지수 -->
                    <c:set var="nCurrentPage" value="${pagingList.nCurrentPage}"/>                 <!--현재 페이지 -->
                    <c:set var="nCurrentGrp" value="${pagingList.nCurrentGrp}"/>                     <!--현재 페이지의 블록 그룹번호 -->
                    <c:set var="nStartPage" value="${pagingList.nStartPage}"/>                        <!--페이징의 시작 페이지 번호 -->
                    <c:set var="nEndPage" value="${pagingList.nEndPage}"/>                            <!--페이징의 끝 페이지 번호 -->
                    <span style="display: none;">
                    ${pagingList.nTotalRecordSize}
                    ${pagingList.nRecordSize}
                    ${pagingList.nBlockGrpSize}                    
                    ${pagingList.nBlockSize}
                    ${pagingList.nTotalPageSize}
                    ${pagingList.nCurrentPage}
                    ${pagingList.nCurrentGrp}
                    ${pagingList.nStartPage}
                    ${pagingList.nEndPage}
                    </span>                    
						<c:if test="${nTotalRecordSize > 0}">
						   <c:set var="pageCount" value="${nTotalRecordSize / nRecordSize + ( nTotalRecordSize % nRecordSize == 0 ? 0 : 1)}"/>						   
						   <c:set var="startPage" value="${nBlockSize*(nCurrentGrp-1)+1}"/>						   
						   <c:set var="endPage" value="${startPage + nBlockSize-1}"/>						 
						   <c:if test="${endPage > pageCount}" >
						     <c:set var="endPage" value="${pageCount}" />
						   </c:if>
						   <c:choose>
                                <c:when test="${nCurrentGrp > 1}">
                                    <span class="num_prev">
                                    <span class="arrow">◀</span><a href="javascript:goPage(${(nCurrentGrp-2)*nBlockSize+1 });" class="num_box">이전</a>
                                    </span>                                    
                                </c:when>
                                <c:otherwise>
										<span class="num_prev">
										<span class="arrow txt_sub">◀</span><span class="txt_sub">이전</span>
										</span>                                                                       
                                </c:otherwise>						   						   
						   </c:choose>						 						  
						   <c:forEach var="i" begin="${startPage}" end="${endPage}">						       
						        <c:choose>
                                    <c:when test="${nCurrentPage == i}">
                                        <a href="javascript:;" class="num_box txt_point u b" style="font-weight: bold;">${i}</a>
                                    </c:when>                                    
                                    <c:otherwise>
                                        <a href="javascript:goPage(${i});" class="num_box" style="font-weight: bold;">${i}</a>
                                    </c:otherwise>
                                </c:choose>
						   </c:forEach>
						   <c:if test="${numPageGroup < pageGroupCount}">
						        <a href="./list.do?pageNum=${numPageGroup*pageGroupSize+1}">[다음]</a>
						   </c:if>
						</c:if>                                              
                    </div>
                    <!-- end paging -->
                </div>
                <!-- end list_btn_area -->
                <form name="pageForm" method="get">
                    <input type="hidden" name="grpid" value="Jnt6">
                    <input type="hidden" name="mgrpid" value="">
                    <input type="hidden" name="fldid" value="IC6M">
                    <input type="hidden" name="firstbbsdepth" value="0THrszzzzzzzzzzzzzzzzzzzzzzzzz">
                    <input type="hidden" name="lastbbsdepth" value="0THrZzzzzzzzzzzzzzzzzzzzzzzzzz">
                    <input type="hidden" name="page" value="">
                    <input type="hidden" name="prev_page" value="1">
                    <input type="hidden" name="listnum" value="20">
                </form>
                <div class="search_box_wrap search_box_bottom">
                    <div class="search_box_floated_elem searchBox_bbsList_bottom">
                        <select name="searchPeriod" class="inp" id="searchPeriod1" onchange="alert(1);">
                            <option value="all">전체기간</option>
                            <option value="aWeek">최근 1주</option>
                            <option value="aMonth">최근 1달</option>
                            <option value="#DURATION">직접 입력</option>
                        </select>
                        <div class="sel_body box bg" style="display: none;" id="s_b_61128939423240">
                            <ul>
                                <li>
                                <a href="" onclick="">전체기간</a>
                                </li>
                                <li>
                                <a href="" onclick="">최근 1주</a>
                                </li>
                                <li>
                                <a href="" onclick="">최근 1달</a>
                                </li>
                                <li>직접 입력 <br>
                                <p>
                                    <input type="text" id="s_t_1_61128939423240" value="2012.10.17" class="inp">- <input type="text" id="s_t_2_61128939423240" value="2013.01.17" class="inp">
                                </p>
                                <p class="button_set" onclick="">
                                    <span class="btn_bg bg08"></span><span class="btn_txt bt08 w03">확인</span>
                                </p>
                                </li>
                            </ul>
                        </div>
                        <select id="item" name="item" class="inp" onchange="checkHeadCont(this); return false;">
                            <option value="preview">게시글+댓글</option>
                            <option disabled="">----------</option>
                            <option value="subject">제목+내용</option>
                            <option value="onlytitle">글제목</option>
                            <option value="writer">글쓴이</option>
                            <option value="no">글번호</option>
                            <option value="filename">첨부파일명</option>
                            <option disabled="">----------</option>
                            <option value="cmtContent">댓글내용</option>
                            <option value="cmtNicknameNgram">댓글작성자</option>
                        </select>
                        <select name="head" class="head_cont inp" style="display: none;">
                        </select>
                        <div class="suggest">
                            <input type="text" name="query" id="query" size="22" class="inp query" onkeypress="blockKeyCode(event);" onkeydown="SearchUtil.checkKeyEvent(event);" autocomplete="off">
                            <button>서제스트 버튼</button>
                        </div>
                        <a href="" class="btn_search" onclick="SearchUtil.searchBBS(this); return false">
                        <img src="img_blank2.gif" width="37" height="21" alt="검색">
                        </a>
                        <a href="" class="go_my_article my_article">내가 쓴 글/댓글 보기</a>
                        <img src="n.gif" alt="new" class="my_article_new">
                    </div>
                    <!-- end cafeSearchBox -->
                </div>
                <form id="searchForm" name="searchForm" action="http://cafe971.daum.net/_c21_/cafesearch">
                    <input type="hidden" name="grpid" value="Jnt6">
                    <input type="hidden" name="mgrpid" value="">
                    <input type="hidden" name="fldid" value="IC6M">
                    <input type="hidden" name="pagenum" value="1">
                    <input type="hidden" name="item" value="">
                    <!-- 검색대상 - 제목+내용:subject, 글제목:onlytitle, 첨부파일명:filename, 글번호:no, 말머리:head
        -->
                    <input type="hidden" name="query" value="">
                    <!-- 검색 쿼리 -->
                    <input type="hidden" name="attachfile_yn" value="">
                    <!-- 첨부파일:A,B 여부 -->
                    <input type="hidden" name="media_info" value="">
                    <!-- 이미지:i, 동영상:m 첨부 -->
                    <input type="hidden" name="viewtype" value="">
                    <!-- 리스트 - 목록형:tit, 요약형:all -->
                    <input type="hidden" name="searchPeriod" value="">
                    <!-- 기간 format 2010.01.01-2010.12.31 -->
                    <input type="hidden" name="sorttype" value="">
                    <!-- 정렬방식 0:최신, 1:정확도, 2:댓글수 -->
                    <input type="hidden" name="nickname" value="">
                    <!-- 상세검색 - 글쓴이 -->
                    <input type="hidden" name="listnum" value="20">
                    <input type="hidden" name="head" value="">
                    <input type="hidden" name="headsort" value="">
                </form>
                <!-- form for search area end -->
                <script type="text/javascript" src="suggest.min.js"></script>
                <script type="text/javascript">
        //<![CDATA[
        Suggest.init();
        daum.$$("select.[name=head]", document.body)[0].style.display = (daum.$("item").value == "head") ? "" : "none";
        var select_1 = new SelectMaker($('searchPeriod1'), 'sel', '2012.10.17', '2013.01.17');
        //]]>
    </script>
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
</div>
<jsp:directive.include file="../include/footer.jspf"/>
</div>

</body>
</html>
