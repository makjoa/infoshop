<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<link href="css/ui-lightness/jquery-ui-1.8.14.custom.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/view.css" rel="stylesheet" type="text/css" />
<!-- jquery -->
<script type="text/javascript" src="js/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui-1.8.14.custom.min.js"></script>
<!-- lightbox -->
<link href="js/lightbox/css/lightbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/lightbox/lightbox.js"></script>
<!-- this -->
<script type="text/javascript" src="js/view.js"></script>
</head>
<body>

<div id="wrap">
	<div>
		<span class="label">작성자</span><span><c:out value="${board.author}" escapeXml="true" /></span>
	</div>
	<div class="line">
		<span class="label">조회수</span><span><c:out value="${board.hit}" escapeXml="true" /></span>
	</div>
	<div class="line">
		<span class="label">작성일</span><span><fmt:formatDate value="${board.created}" pattern="yyyy년 M월 d일 a h시 m분" /></span>
	</div>
	<c:if test="${board.modified != null}">
	<div class="line">
		<span class="label">수정일</span><span><fmt:formatDate value="${board.modified}" pattern="yyyy년 M월 d일 a h시 m분" /></span>
	</div>		
	</c:if>

	<div class="line">
		<span class="label">제목</span><span><c:out value="${board.subject}" escapeXml="true" /></span>
	</div>
	
	<!-- 내용 -->
	<div class="line content">
		<span class="label">내용</span>
		<span class="tinymce">${board.content}</span>
	</div>
	<!-- 첨부 -->
	<c:if test="${fn:length(board.attachs) > 0}">
	<div class="line attach">
		<span class="label">첨부파일</span>
		<span>
			<c:forEach var="attach" items="${board.attachs}">
			<div>
				<a href="file/download.do?seq=${attach.seq}" >${attach.fileName}</a>
			</div>
			</c:forEach>
		</span>
	</div>
	</c:if>
	<!-- 버튼 -->
	<div class="buttons">
		<a id="reply-button" href="form.do?query=reply&bid=${board.boardId}&page=${page}&search=${search}">답변</a>
		<a id="modify-button" href="form.do?query=modify&bid=${board.boardId}&page=${page}&search=${search}">수정</a>
		<a id="delete-button" href="delete.do?bid=${board.boardId}&page=${page}&search=${search}">삭제</a>
		<a id="list-button" href="list.do?page=${page}&search=${search}" class='button'>목록</a>
	</div>
</div>

</body>
</html>