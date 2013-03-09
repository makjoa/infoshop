/**
 * @author mudchobo
 */
var localUrl = '/infoshop';
//var localUrl = '';

//document.observe('dom:loaded', init);

var poiSearch;
var map;
/**
 * 媛앹껜 el�먯꽌 src�쇰뒗 className�� tgt�쇰뒗 className�쇰줈 蹂寃쏀븳��.
 * @name daum.Element.replaceClassName
 * @function
 * @param Element el
 * @param String src(className)
 * @param String tgt(className)
 * @return Element el
 */
function replaceClassName(el, src, tgt){
//	alert(el);
	var e = daum.$(el), temp = [],
		cnames = daum.String.trim(daum.$(el).className).replace(/\s+/g,' ').split(' ');
	daum.Array.each(cnames,function(cname){
		cname===src ? tgt && temp.push(tgt) : temp.push(cname);
	});
	e.className = temp.join(' ');
	alert(e);
	return e;
}
//

//	poiSearch = new POISearch($("divSearch"), $("jsonData"), $("divResult"), "parseResponse");
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
			$("#btnDupl").click(function() {
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
				   },
				   error : function(xhr, status, e) {  
				    
				    alert(e);
				   }
				   
				  });
			}); 	
		// 닉네임 중복체크
//		new Ajax.Request(localUrl + '/idCheck', {
//			method: 'post',
//			parameters: {
//				userId: $("#userId").val()
//			},
//			onSuccess: function(transport) {
//				var result = transport.responseText.evalJSON().result;
//				alert(result);
//				if (result == "0") {
//					alert("이미 닉네임이 있습니다.");
//					return;
//				}
//				/*
//				if ($("jsonData").value == null || $("jsonData").value == "") {
//					alert("주소를 검색 후 입력하세요.");
//					return;
//				}
//				*/
//				if (!$("#gender").checked) {
//					alert("성별을 선택해주시기 바랍니다.");
//					return;
//				}
//				$("joinForm").submit();
//			}
//		});


	/*
	// 닉네임에서 엔터시 무시
	$("nickName").observe("keydown", function () {
		if (event.keyCode == 13) {
			window.event.returnValue = false;
		}
	});
	*/
	// 지도 생성
	//map = new YMap($("divMap"));
	//map.setMapType(YAHOO_MAP_HYB);
	//map.addZoomShort();
	//map.drawZoomAndCenter(encodeURIComponent("서울"), 5);
	$("#btnChangeId").click(function() {
		 replaceClassName('mArticle2', 'recomid', 'regitid');
		 
		// $("선택자").addClass("클래스명");
	});
});
function parseResponse(data) {
	poiSearch.parseResponse(data);
}

/*
jQuery('#btnDupl').click(function() {
	 
	 var msgCd = jQuery('#userId').val();
	 alert("12123123");
	 $.ajax({
	   type : 'POST',  
	   data: msgCd,
	   dataType : 'json',
	   url : localUrl + '/idCheck',  
	   success : function(returnData, textStatus, xhr) {
	    
	    var chk = returnData.msgCnt;
	    if(chk == 0){
	     alert("등록 가능 합니다.");
	    }else{
	     alert("중복 되어 있습니다.");
	    }
	           
	      
	   },
	   error : function(xhr, status, e) {  
	    
	    alert(e);
	   }
	  });  
});
*/