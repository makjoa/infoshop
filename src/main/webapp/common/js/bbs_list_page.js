function clearText(thefield){
	if (thefield.defaultValue==thefield.value)
		thefield.value = "";
		thefield.style.backgroundImage = '';
}

function dispmesg(actionType, targetFldid){
	if(!document.listForm.dataid) {
		return;
	}

	var flag=0;
	var count=0;

	for(i=0;i<document.listForm.dataid.length;i++){
		if(document.listForm.dataid[i].checked){
			count++;
		}
	}
	
	if (count > 20) {
		if(actionType == "del" || actionType == 'del_qa')
			alert("게시글 삭제는\n한 번에 최대 20개까지만 가능합니다.");
		else if (actionType == "mv")
			alert("게시글 이동은\n한 번에 최대 20개까지만 가능합니다.");
		else if (actionType == "del_spam" || actionType == 'del_qa_spam')
			alert("게시글 스팸처리는\n한 번에 최대 20개까지만 가능합니다.");
		else if (actionType == "edit_title")
			alert("게시글 편집은\n한 번에 최대 20개까지만 가능합니다.");
		return;
	}

	//공지글 체크 와 스팸 게시물 체크
	if(document.listForm.dataid.length > 0){
		for(i=0;i<document.listForm.dataid.length;i++){
			if(document.listForm.dataid[i].checked){
				if(actionType == "mv" && ":"+CAFEAPP.ui.NOTIDATAIDS+":".indexOf( ":" + document.listForm.dataid[i].value + ":" ) > -1  ) {
					if (count == 1) {
						alert("공지로 지정된 게시물은 이동할 수 없습니다.");
					} else {
						alert("공지로 지정된 게시물은 이동할 수 없습니다.\n공지글 지정을 해제하신 후 이동해 주세요.");
					}
					return;
				}
				flag=1;
			}
		}
	} else{
		if(document.listForm.dataid.checked) {
			if(actionType == "mv" &&
				document.listForm.dataid.value == CAFEAPP.ui.NOTIDATAID) {
				alert("공지로 지정된 게시물은 이동할 수 없습니다.");
				return;
			}
			flag=1;
		}
	}

	if(!flag){
		if(actionType == "del" || actionType == 'del_qa')
			alert("삭제할 게시물을 선택해 주세요.");
		else if (actionType == "mv")
			alert("이동할 게시물을 선택해 주세요");
		else if (actionType == "del_spam" || actionType == 'del_qa_spam')
			alert("스팸처리할 게시물을 선택해 주세요.");
		else if (actionType == "edit_title")
			alert("편집할 게시물을 선택해 주세요.");
		return;
	}

	if(actionType == "del"){
		if(confirm("정말로 삭제하시겠습니까?")){
			document.listForm.action="/_c21_/bbs_delete_action?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID;
		} else {
			return;
		}

	} else if(actionType == "del_qa"){
		if(confirm("정말로 삭제하시겠습니까?\n만일, 지식에서 답변받기를 한 글인 경우 해당 서비스에도 삭제 반영됩니다.")){
			document.listForm.action="/_c21_/bbs_delete_action?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID;
		} else {
			return;
		}

	} else if(actionType == "mv"){

		if (targetFldid == CAFEAPP.FLDID) {
			alert("동일한 게시판으로의 이동은 불가능합니다.\n다른 게시판을 선택해 주세요.");
			return;
		}

		if(confirm("정말로 이동하시겠습니까?\n말머리는 동일한 말머리가 있을 경우에만 유지됩니다.")){
			document.listForm.moveto.value = targetFldid;
			document.listForm.firstbbsdepth.value=CAFEAPP.ui.FIRSTBBSDEPTH;
			document.listForm.action="/_c21_/"+CAFEAPP.ui.BBS_MOVE+"?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID;
		} else {
			return;
		}
	} else if (actionType == "del_spam") {
		if (confirm("스팸처리를 하시겠습니까?\n해당 글 삭제와 동시에 회원은 활동중지되며, Daum클린센터에 바로 신고 접수됩니다.")) {
			document.listForm.action="/_c21_/"+CAFEAPP.ui.BBS_DELETE_SPAM+"?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID;
		} else {
			return;
		}
	} else if (actionType == "del_qa_spam") {
		if (confirm("스팸처리를 하시겠습니까?\n해당 글 삭제와 동시에 회원은 활동중지되며, Daum클린센터에 바로 신고 접수됩니다.\n질문 삭제 시 답변도 삭제되며, 답변자는 신고 및 강제탈퇴 되지 않습니다.")) {
			document.listForm.action="/_c21_/"+CAFEAPP.ui.BBS_DELETE_SPAM+"?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID;
		} else {
			return;
		}
	} else if (actionType == "edit_title") {
		var titleEditWindow = window.open("","titleEditWindow","width=420,height=270,toolbar=no,resizable=yes,scrollbars=yes,statusbar=yes");		
		document.listForm.action="/_c21_/"+CAFEAPP.ui.BBS_TITEL_EDIT_URI+"?grpid=" + CAFEAPP.GRPID;
		document.listForm.target="titleEditWindow";
	} else {
		return;
	}

	document.listForm.submit();
	return;

}

function goPage( page ) {
	console.log(page);
		//document.location.href="/_c21_/"+ CAFEAPP.ui.BBS_LIST_URI +"?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID+"&firstbbsdepth="+CAFEAPP.ui.FIRSTBBSDEPTH+"&lastbbsdepth="+CAFEAPP.ui.LASTBBSDEPTH +"&prev_page="+ CAFEAPP.ui.PAGER_page+"&page=" + page + "&listnum=" + CAFEAPP.ui.LISTNUM + "&sortType=" + CAFEAPP.ui.SORT_TYPE;
		document.location.href="/infoshop/bbs/?page="+page+"";
	
}

function goBbsSearch() {

	if (document.searchForm.item.value == ""){
		alert("검색하고자 하는 항목을 선택해 주세요.");
		document.searchForm.item.focus();
		return;
	}

	if (document.searchForm.item.value == "writer" && document.searchForm.query.value.length < 2) {
		alert("검색하실 닉네임을 다시 입력해 주세요.\n닉네임은 4byte(한글2자,영문4자)이상을 입력해 주셔야 검색이 가능합니다.");
		return;
	}
	else if (document.searchForm.item.value == "filename" && document.searchForm.query.value.length < 2) {
		alert("검색하실 파일명을 다시 입력해 주세요.\n파일명은 4byte(한글2자,영문4자)이상을 입력해 주셔야 검색이 가능합니다.");
		return;
	}
	else if((document.searchForm.item.value == "no") && (isNaN(document.searchForm.query.value) == true)){
		alert("검색하실 글번호를 다시 입력해 주세요.\n글 번호는 숫자 입력만이 가능합니다.");
		return;
	}

	var strQuery = document.searchForm.query.value;
	var resultQuery = strQuery.split(" ");

	if (document.searchForm.item.value == "headcont") {
		if (document.searchForm.head.value == "말머리선택") {
			alert("말머리를 선택해 주세요.");
			document.searchForm.head.focus();
			return;
		}
	} else {
		if (strQuery.length + 1 == resultQuery.length) {
			alert("검색하실 단어를 입력해 주세요.\n단어 입력이 되지 않으면 검색되지 않습니다.");
			document.searchForm.query.focus();
			return;
		}
	}

	document.searchForm.jobcode.value="1";
	document.searchForm.grpid.value=CAFEAPP.GRPID;
	document.searchForm.mgrpid.value=CAFEAPP.MGRPID;
	document.searchForm.fldid.value=CAFEAPP.FLDID;
	document.searchForm.action="/_c21_/cafesearch?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID;	
	document.searchForm.submit();
}

/**
 * 소모임용 말머리 정렬
 * @param headcont
 */
function goHeadcontSearch(headcont){
	document.searchForm.grpid.value=CAFEAPP.GRPID;
	document.searchForm.mgrpid.value=CAFEAPP.MGRPID;
	document.searchForm.fldid.value=CAFEAPP.FLDID;
	document.searchForm.item.value="headcont";
	document.searchForm.headsort.value="Y";
	document.searchForm.head.value= headcont;
	document.searchForm.query.value= headcont;
	document.searchForm.searchtype.value ="S";
	document.searchForm.jobcode.value= "1";

	if(headcont == ""){
		document.location.href ="/_c21_/bbs_list?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID+"&listnum="+CAFEAPP.ui.LISTNUM;
	}else{
		document.searchForm.action="/_c21_/bbs_search?grpid="+CAFEAPP.GRPID;
		document.searchForm.submit();
	}
}

/**
 * 소모임 내글검색
 * @param nickname
 */
function goMyList(nickname){
	var obj = document.searchForm.item;

	document.searchForm.jobcode.value="1";
	document.searchForm.grpid.value=CAFEAPP.GRPID;
	document.searchForm.mgrpid.value=CAFEAPP.MGRPID;
	document.searchForm.fldid.value=CAFEAPP.FLDID;
	
	document.searchForm.query.value = nickname;
	obj[obj.selectedIndex].value = "writer";
	document.searchForm.action="/_c21_/bbs_search?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID;
		
	document.searchForm.submit();
}

function ch() {
	if(document.searchForm.item.value == "headcont") {
		document.getElementById('sear2').style.display="";
		document.getElementById('sear1').style.display="none";
	} else {
		document.getElementById('sear1').style.display="";
		document.getElementById('sear2').style.display="none";
	}
}

function viewShortComment(dataid, enc_icontype) {
	shrtmcmtWindow = window.open("/_c21_/shortcomment_read?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID+"&dataid=" + dataid + "&icontype="+enc_icontype,
		"shortcomment","width=815,height=500,toolbar=no,resizable=yes,scrollbars=yes,statusbar=yes");
	shrtmcmtWindow.focus();
}

function viewShortCommentForUnifiedNotice(fldid, dataid, enc_icontype) {
	shrtmcmtWindow = window.open("/_c21_/shortcomment_read?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+ fldid +"&dataid=" + dataid + "&icontype="+enc_icontype,
			"shortcomment","width=815,height=500,toolbar=no,resizable=yes,scrollbars=yes,statusbar=yes");
	shrtmcmtWindow.focus();
}

function selectAll() {
	selectCheckboxes(document.listForm.dataid);
}

function deselectAll() {
	cancelCheckboxes(document.listForm.dataid);
}

function toggleAll() {
	toggleCheckboxes(document.listForm.dataid);
}

function blockKeyCode(e){
	if(window.event) {
		// for IE, e.keyCode or window.event.keyCode can be used
		key = e.keyCode;
	}
	else if(e.which) {
		// netscape,firefox
		key = e.which;
	}
	else {
		// no event, so pass through
		key=0;
	}
}


function poplogin(){
	var param = CAFEAPP.ui.BBS_WRITE_URI+"?grpid="+CAFEAPP.GRPID+"&mgrpid="+CAFEAPP.MGRPID+"&fldid="+CAFEAPP.FLDID+"&page="+CAFEAPP.ui.PAGER_page+"&prev_page="+CAFEAPP.ui.PREV_PAGE+"&firstbbsdepth="+CAFEAPP.ui.P_FIRSTBBSDEPTH+"&lastbbsdepth="+CAFEAPP.ui.P_LASTBBSDEPTH;
	var encodeParam = encodeBase64(param);
	window.open("/_c21_/poplogin?grpid="+CAFEAPP.GRPID+"&param="+encodeParam,"poplogin", 'width=450,height=300,resizable=no,scrollbars=no');
}