var localUrl = "/infoshop"; 




function doLogin() {
	alert("login");
    $.ajax({
        type: 'POST',
        data		: $("#loginForm").serialize(),
        dataType: 'text',
        url: localUrl + '/login',
        success: function (returnData, textStatus, xhr) {
            console.log(returnData);
            var chk = returnData;
            //alert(chk);
            if (chk == "0") {
               // alert("등록 가능 합니다.");
            } else {
               // alert("중복 되어 있습니다.");
                
            	$('#your').hide();
            	$('#my').show();
            	
            	$('#userInfo').text(returnData.nickname);
            }            
        },
        error: function (xhr, status, e) {

            alert(e);
        }

    })
}

function getPassword() {
	$.ajax({
		type: 'POST',
		data: "",
		dataType: 'text',
		url: '/news',
		success: function (returnData, textStatus, xhr) {
			console.log(returnData);
		},
		error: function (xhr, status, e) {
			alert(e);
		}		
	})
}
    
function goSearch() {
	alert("login");
    $.ajax({
        type: 'GET',
        data		: $("#daumSearch").serialize(),
        dataType: 'text',
        url: localUrl + '/json',
        success: function (returnData, textStatus, xhr) {
            console.log(returnData);
            var chk = returnData;
            //alert(chk);
            if (chk == "0") {
               // alert("등록 가능 합니다.");
            } else {
               // alert("중복 되어 있습니다.");
                
            	$('#your').hide();
            	$('#my').show();
            	
            	$('#userInfo').text(returnData.nickname);
            }            
        },
        error: function (xhr, status, e) {

            alert(e);
        }

    });   
}
