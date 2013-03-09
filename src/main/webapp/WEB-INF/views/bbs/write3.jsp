<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
    <c:when test="${query == 'modify'}">
        <c:set var="submit" value="수정" />
    </c:when>
    <c:otherwise>
        <c:set var="submit" value="등록" />
    </c:otherwise>
</c:choose>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- style -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/ui-lightness/jquery-ui-1.8.14.custom.css" rel="stylesheet" type="text/css" />
<link href="css/form.css" rel="stylesheet" type="text/css" />
<!-- js -->
<script type="text/javascript" src="js/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/lib/json2.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui-1.8.14.custom.min.js"></script>
<!-- TinyMCE -->
<script type="text/javascript" src="js/jquery/jquery.tinymce.js"></script>
<!-- swfupload -->
<script type="text/javascript" src="js/jquery/jquery.swfupload.js"></script>
<script type="text/javascript" src="js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload/swfupload.queue.js"></script>
<!-- form.js -->
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-1.9.0.min.js"></script>
<script language="javascript">
$(document).ready(function() {
    $("#btnNext").click(function() {
        if ($("#userId").val() == null || $("#userId").val() == "") {
            alert("아이디부분이 비어있습니다.");
            return;
        }
         var msgCd = jQuery('#userId').val();
         console.log(msgCd);
         $.ajax({
           type : 'POST',  
           data: "userId="+msgCd,
           dataType : 'json',
           url : localUrl + '/idCheck',  
           success : function(returnData, textStatus, xhr) {
               console.log(returnData);
            var chk = returnData;
            //alert(chk);
            if(chk == "0"){
             alert("등록 가능 합니다.");
            }else{
             alert("중복 되어 있습니다.");
             return;
            }
            $('#joinForm').submit();            
           },
           error : function(xhr, status, e) {  
            
            alert(e);
           }
           
          }); 
         });
});
</script>
</head>
<body>

<form id="form" action="/infoshop/bbs/free/write" method="post">
    <input type="hidden" id="query" name="query" value="${query}" />
    <input type="hidden" id="bid" name="bid" value="${board.boardId}" />

<div id="wrap">
    <div class="line">
        <label class="label" for="author">작성자</label>
        <input type="text" id="author" name="name" title="작성자" maxlength="15" value="${board.author}" <c:if test="${query == 'modify'}">readonly="readonly"</c:if> />
    </div>
    <div class="line">
        <label class="label" for="pwd"><c:if test="${query == 'modify'}">현재 </c:if>비밀번호</label>
        <input type="password" id="pwd" name="password"  title="비밀번호" maxlength="15" />
        <span style="color: #ff0000">※ 15자 이내</span>
    </div>  
    <c:if test="${query == 'modify'}">
    <div class="line">
        <label class="label" for="newPwd">새 비밀번호</label>
        <input type="password" id="newPwd" name="newPwd"  title="새 비밀번호" maxlength="15" />
        <span style="color: #ff0000">※ 15자 이내</span>
    </div>
    </c:if>
    <div class="line">
        <div>
            <label class="label" for="subject">제목</label>
            <input type="text" id="subject" name="subject" size="80" title="제목" value="${board.subject}" />
        </div>
        <div>
            <label class="label"></label>
            <input type="checkbox" id="security" name="security" value="1" <c:if test="${board.security == true}" >checked</c:if> />
            <label for="security">비밀글로 작성합니다.</label>
        </div>
    </div>

    <div class="tinymce">
        <textarea name="content" id="content">${board.content}</textarea>
    </div>  

    <div id="swfupload">
        <div class="swfupload-buttons">
            <table border="0">
                <tr>
                    <td><button id="folder-button" type="button"></button></td>
                    <td><button id="cancel-button" type="button">취소</button></td>
                    <td><button id="remove-button" type="button">삭제</button></td>
                    <td><button id="paste-button" type="button">본문에 삽입</button></td>
                    <td>|</td>
                    <td><span id="swfupload-msg">업로드 제한: </span></td>
                </tr>
            </table>
        </div>
        <div class="swfupload-queue">
            <ol id="swfupload-queue" class="selectable">
            <c:forEach var="attach" items="${board.attachs}" varStatus="i">
                <li id="SWFUpload_0_-${i.index}" class="ui-widget-content">
                    <span id="name">${attach.fileName}</span>
                    <span id="size">${attach.fileSize}</span>
                    <div id="seq">${attach.seq}</div>
                    <div id="session">${attach.session}</div>
                </li>
            </c:forEach>
            </ol>
        </div>
    </div>

    <div class="kaptcha">
        <img id="kaptcha-img" src="kaptcha.do" title="자동입력방지" alt="클릭시 갱신됩니다." align="left" />
        <span style="color: #ff0000">※ 글씨를 제대로 확인할 수 없을 경우 이미지를 클릭해 주세요.</span>
        <div>
            <input type="text" id="kaptcha" name="kaptcha" size="7" maxlength="5" title="자동입력방지" /><br/>
        </div>
    </div>
    
    <div class="buttons">
        <button id="write-button" type="submit">${submit}</button>
        <a id="list-button" href="list.do?page=${page}&search=${search}">목록</a>
    </div>
</div>

</form>

</body>
</html>