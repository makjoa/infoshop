<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- Bootstrap 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-responsive.min.css">
    <link href="<%=request.getContextPath()%>/resources/bootstrap/css/docs.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/bootstrap/js/google-code-prettify/prettify.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/bbs_list_page.js"></script>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap-button.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap-modal.js"></script>
<script src="<%=request.getContextPath()%>/resources/vojs/vo.js"></script>
-->
<script type="text/javascript">
 
 function getRootPos()
 {
   var path = getCurrentPath();

   var depth = path.split("/").length - 1;
   var str = path.split("/");
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
   <div id="content-main">
    <!--
    jsp:directive.include file="../cLeft.jsp"/>================================================== -->    
    <div id="left">
    <div class="sect">
    <!--Body content-->
      <p class="text-info">
      </p>
      <div class="well well-small">
				<dl class="dl-horizontal">
				  <dt>★ …… 프 리 토 크☆</dt>
				  <dd>|축구 매니아들의 실시간 프리 토크^^</dd>
				</dl>
        <table class="table table-hover">
					<thead>
					<tr>
					  <th></th>
					  <th nowrap="nowrap" class="header"></th>
					  <th>제목</th>
					  <th>글쓴이</th>
					  <th nowrap="nowrap">작성일</th>
					  <th nowrap="nowrap">조회</th>
					  <th nowrap="nowrap">추천</th>
					</tr>
					</thead>        
					<tbody>
					<tr class="success">
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
					<c:forEach var="info" items="${getBoardList}">
					<tr>
					  <td class="num" nowrap="nowrap">
					     ${info.datanum}
					  </td>
					  <td class="headcate txt_sub" nowrap="nowrap">
					  </td>
					  <td class="subject">
              <a href="#${info.datanum}" data-toggle="modal">
					    <!-- <a href="/infoshop/v=${info.datanum}"> -->
					    <img src="ico_mobile.gif" width="8" height="12" alt="모바일 작성글" class="icon_mobile">${info.subject}</a>
					    <img src="img_blank2.gif" width="8" height="12" alt="새글" class="icon_new">
					  </td>
					  <td class="nick">
					    <a href="javascript:;" onclick="">${info.name}</a>
					  </td>
					  <td class="date" nowrap="nowrap">
					   ${info.datetime}
					  </td>
					  <td class="count" nowrap="nowrap">
					   ${info.hit}
					  </td>					   
					  <td class="recommend_cnt" nowrap="nowrap">
					     0
					  </td>
					  <td style="display:inherit;">
              <div id="${info.datanum}" class="modal hide">
			            <div class="modal-header">
			              <button type="button" class="close" onClick="javascript:modalHide('${info.datanum}')" aria-hidden="true">&times;</button>
			              <h3 id="myModalLabel">${info.subject}</h3>
			            </div>
			            <div class="modal-body" style="display: none;">			
                    ${info.content}
			            </div>
			            <div class="modal-footer">			            
			              <button class="btn" data-dismiss="modal">Close</button>
			              <button class="btn btn-primary" onclick="getRootPos();">Save changes</button>
			            </div>			        
              </div>
              </td>
					</tr>
					</c:forEach>
					</tbody>                       
        </table>
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
				<div class="pagination pagination-centered">
				  <ul>
          <c:if test="${nTotalRecordSize > 0}">
            <c:set var="pageCount" value="${nTotalRecordSize / nRecordSize + ( nTotalRecordSize % nRecordSize == 0 ? 0 : 1)}"/>               
            <c:set var="startPage" value="${nBlockSize*(nCurrentGrp-1)+1}"/>              
            <c:set var="endPage" value="${startPage + nBlockSize-1}"/>            
            <c:if test="${endPage > pageCount}" >
              <c:set var="endPage" value="${pageCount}" />
            </c:if>
            <c:choose>
	            <c:when test="${nCurrentGrp > 1}">				  				    
					      <li><a href="#">이전</a></li>
					    </c:when>
					    <c:otherwise>
					      <li class="disabled"><a href="#">이전</a></li>
					    </c:otherwise>
				    </c:choose>
				      <c:forEach var="i" begin="${startPage}" end="${endPage}">
				        <c:choose>
                  <c:when test="${nCurrentPage == i}">
                    <li class="disabled"><a href="javascript:;" class="num_box txt_point u b" style="font-weight: bold;">${i}</a></li>
                  </c:when>                                    
                  <c:otherwise>
                    <li><a href="javascript:goPage(${i});" class="num_box" style="font-weight: bold;">${i}</a></li>
                  </c:otherwise>				      				       
				        </c:choose>
				      </c:forEach>
              <c:if test="${numPageGroup < pageGroupCount}">
                 <a href="./list.do?pageNum=${numPageGroup*pageGroupSize+1}">[다음]</a>
              </c:if>
            </c:if>				    
				  </ul>				  
        </div>                 
      </div>
  </div>
</div>
</div>            
<br style="clear: both;">
<jsp:directive.include file="../cBottom.jsp"/>
 </div>
 </div>
</body>
</html>
