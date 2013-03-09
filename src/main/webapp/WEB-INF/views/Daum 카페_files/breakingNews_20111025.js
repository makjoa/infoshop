/* PC */
var breakingNewsSearch = function(apiUrl) {
	this.cookieIdx = "";
	this.dataUrl = apiUrl;
	this.strStyle = "#layerBreakingNewsSearch {overflow:hidden;position:absolute;right:0px;width:0px;height:68px;z-index:9000000;} #layerBreakingNewsSearch iframe.dummy_bg {position:absolute;left:0px;top:0px;z-index:8999998;width:220px;height:68px;background-color:#FFFFFF;} #layerBreakingNewsSearch .layer_body {z-index:8999999;position:absolute;left:0px;top:0px;overflow:hidden;width:220px;height:68px;background:url(http://i1.daumcdn.net/imgsrc.search/search_all/2011/bg/bg_breakingnews_20111025.gif) 0 0 no-repeat;} #layerBreakingNewsSearch .ir_pm {display:block;overflow:hidden;font-size:0px;line-height:0;text-indent:-9999em;} #layerBreakingNewsSearch .wrap_tit {display:inline;float:left;width:130px;height:40px;margin:16px 0 0 60px;text-align:left;} #layerBreakingNewsSearch .wrap_tit .link_tit {display:table-cell;display:inline-block;padding-top:1px;font-family:dotum;font-size:14px;font-weight:bold;color:#000;text-decoration:none;vertical-align:middle;text-align:left;letter-spacing:-1px;line-height:18px;} #layerBreakingNewsSearch .wrap_tit .link_tit:hover {text-decoration:underline;} #layerBreakingNewsSearch .wrap_tit .blank {display:table-cell;display:inline-block;width:1px;height:37px;vertical-align:middle;} #layerBreakingNewsSearch .btn_close {position:absolute;top:5px;right:6px;height:18px;width:18px;}";

	this.ua = navigator.userAgent.toLowerCase();

	this.oLayer = null;
	this.timeoutKey = null;
	this.init();
};

breakingNewsSearch.prototype = {
	init : function () {
		var tmpStyle = document.createElement("style");
		tmpStyle.setAttribute("type", "text/css");
		
        if (tmpStyle.styleSheet) { /*IE*/
            tmpStyle.styleSheet.cssText = this.strStyle;
        } else { /*W3*/
            tmpStyle.appendChild(document.createTextNode(this.strStyle));
        }
		document.getElementsByTagName("head")[0].appendChild(tmpStyle);
   	
   		if(document.getElementById("layerBreakingNewsSearch") == null ) {
			var tmpDiv = document.createElement("div");
			tmpDiv.id = "layerBreakingNewsSearch";
			document.getElementsByTagName("body")[0].appendChild(tmpDiv);
   		
   		}
	
		window.onscroll = this.moveWhellorSize;
		window.onresize = this.moveWhellorSize;

		this.cookieIdx = this.getCookie();
		this.oLayer = document.getElementById("layerBreakingNewsSearch");
		this.callBreakingNews();

	},
	makeHtml : function (data) {
		var tmpHtml = "";

		for(var i=0 ; i < data.pc.length ; i++) {
			if(data.pc[i].type == "def") {
				tmpHtml = "<iframe class='dummy_bg' frameborder='0' src='about:blank'></iframe><div id='breakingNewsSearch' class='layer_body' onmouseover='breakingNewsSearchExec.clearTimeout();' onmouseout='breakingNewsSearchExec.runTimeout();'><strong class='ir_pm'>Daum 속보</strong><div class='wrap_tit'><a href='" + data.pc[i].link + "' target='_blank' class='link_tit' onclick='breakingNewsSearchExec.display(false);'>" + data.pc[i].keyword + "</a><span class='blank'></span></div><a href='javascript:breakingNewsSearchExec.display(false);' title='닫기' class='ir_pm btn_close'>닫기</a></div>";
			}
		}
					
		this.oLayer.style.display = "none";
		this.oLayer.innerHTML = tmpHtml;
		
		this.display(true);
	},
	clearTimeout : function() {
		if(this.timeoutKey != null) {
			window.clearTimeout(this.timeoutKey);
		}
	},
	runTimeout : function() {
		this.clearTimeout();
		this.timeoutKey = window.setTimeout(function(){breakingNewsSearchExec.display(false);}, 15000);
	},
	display : function(flag) {
		if(flag) {
			this.oLayer.style.display = "block";
			this.moveWhellorSize();
			this.animateX();
		} else {
			this.oLayer.style.display = "none";
		}
	},
	moveWhellorSize : function() {
		var oLayer = document.getElementById("layerBreakingNewsSearch");
		var topPos = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
		var wh = (window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 650);
		
		oLayer.style.top = topPos + wh - oLayer.offsetHeight + "px";
	},
	animateX : function() {
		var maxWidth = 220;
		var movWidth = document.getElementById("layerBreakingNewsSearch").offsetWidth;
		var changeWidth = Math.ceil( movWidth + ( maxWidth - movWidth ) * 0.1);
				
		if ( maxWidth > movWidth ) {
			document.getElementById("layerBreakingNewsSearch").style.width = changeWidth + "px";
			window.setTimeout(breakingNewsSearchExec.animateX, 30);
		} else {
			breakingNewsSearchExec.runTimeout();
		}
	},
	setCookie : function(idx) {
	 	var d = new Date(), day="";
		d.setDate(d.getDate() + 1);
		document.cookie = "BREAKINGNEWS=" + idx + ";domain=.daum.net;path=/;expires=" + d.toGMTString() + ";";
	},
	getCookie : function() {
		var cookieStr, searchName, valueStart, valueEnd;
		cookieStr = ";" + document.cookie.replace(/ /g, "") + ";";
		searchName = ";BREAKINGNEWS=";
		valueStart = cookieStr.indexOf(searchName);
		if (valueStart != -1) {
			valueStart += searchName.length;
			valueEnd = cookieStr.indexOf(";", valueStart);
			return unescape(cookieStr.substr(valueStart, valueEnd - valueStart));
		}
		return "0";
	},
	chkCookie : function(idx) {
		if(this.cookieIdx == idx) { 
			return false;
		} else {
			return true;
		}
	},
	callBack : function (data) {
		if(typeof(data.idx) == "undefined" || data.idx == "") {
			return;
		}
		
		if(this.chkCookie(data.idx)) {
			this.setCookie(data.idx);
			this.makeHtml(data);
		}

	},
	callBreakingNews : function() {
		var oScript;
		var oParent;

		if( document.getElementById("breakingNewsSearchCallBack") ) { 
			oScript = document.getElementById("breakingNewsSearchCallBack");
		}

		if(oScript) {
			oParent = oScript.parentNode;
			oParent.removeChild(oScript);
		} else {
			oParent = document.getElementsByTagName("head")[0];
		}

		oScript = document.createElement('script');
		oScript.type = "text/javascript";
		oScript.charset = "utf-8";
		oScript.defer = true;
		oScript.id = "breakingNewsSearchCallBack";
		oScript.src = this.dataUrl.replace(/\r\n/g,"");

		oParent.appendChild(oScript);
	}
};

try { 
	var breakingNewsSearchExec = null; 
	document.onLoad = window.setTimeout(function() {breakingNewsSearchExec = new breakingNewsSearch("http://fs.search.daum.net/breakingnews.js?" + new Date().getTime()); }, 3000);
} catch(e) {}