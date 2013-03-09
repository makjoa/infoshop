/* quick link */
function skipid(id) {
	document.getElementById(id).focus();
}

/* popup */
function popup(url,name,w,h,scroll,resize){
	openWindow=window.open(url,name,'width='+w+',height='+h+',scrollbars='+scroll+',resizable='+resize);
	openWindow.focus();
}

function existedPlanet(daumid){
	DaumCafeAjax.get("/pcp/get_planet_exist_hdn.do", 
		function( data ){
			var oXmlDoc =  data;
			var cs = oXmlDoc.getElementsByTagName("CHECK").item(0).firstChild.nodeValue;
			if (cs == "true"){
				window.location = "http://planet.daum.net/"+daumid + '?nil_loginbox=planet';					
			}else{
				alert("개설되지 않았거나 폐쇄된 플래닛입니다.");
			}
		}, 
		function( data ){}
	);
}


document.writeln=function(str) {document.write(str+"\n");};
var oldWriteMethod = document.write;

function evalInDiv(js, target) {
	target.innerHTML = "";
	document.write = function(str){
		target.innerHTML += str;
	};
	eval(js);
	document.write = oldWriteMethod;
}

function srcInDiv(jsObj, src, target) {
	try {
		target.innerHTML = "";
		document.write = function(str){
			target.innerHTML += str;
		};
		jsObj.setAttribute("src", src);
	} catch(e) { }
}

var embedScriptArr = null;
var embedScriptIdx = 0;
scriptParse=function(obj){
     try {
        tmpEmbedScriptArr = obj.getElementsByTagName("SCRIPT");
        if( tmpEmbedScriptArr != null ) {
                embedScriptArr = new Array();
                for( i=0; i<tmpEmbedScriptArr.length; i++ ) {
                        embedScriptArr[i] = tmpEmbedScriptArr[i];
                }
        }
        if (embedScriptArr != null) {
            embedScriptIdx = 0;
            executeScript();
        }
    }catch(e){}
};


try {
	var	jsWriteDiv = document.createElement("DIV");
	jsWriteDiv.style.cssText = "display:none;";
}catch(e){}
var _agent = navigator.userAgent.toLowerCase();
executeScript=function(){
    try {
            if(embedScriptIdx >= embedScriptArr.length)
                return;
            if(embedScriptArr[embedScriptIdx].src != ""){
            	var	embedJsObject = embedScriptArr[embedScriptIdx];
                var source = embedJsObject.src;
                
                if(navigator.userAgent.toLowerCase().indexOf('msie') > -1) {
                	try {
	                	srcInDiv(document.getElementById("dynamicContent"), source, jsWriteDiv);
			            dynamicContent.onreadystatechange = function(){
			            	document.write = oldWriteMethod;
			            	for( var i=0; i<jsWriteDiv.childNodes.length; i++ ) {
			            		embedJsObject.parentNode.insertBefore(jsWriteDiv.childNodes[i], embedJsObject);
			            	}
	                        embedScriptIdx++;
	                        executeScript();
	                    }
                	} catch(e) { }
                } else {
                    var sss  = document.createElement("script");
                    sss.src = source;
                    sss.onload = function(){
                        embedScriptIdx++;
                        executeScript();
                    };
                    document.body.appendChild(sss);
                    if(_agent.indexOf("safari")>-1 && _agent.indexOf("419") >-1){ // when safari ver 2.0
                    	embedScriptIdx++;
                        executeScript();
                    } 
                }
            }else{
            	if( embedScriptArr[embedScriptIdx].innerHTML.indexOf("write") > -1 ) {
            		try {
	            		var	embedJsObject = embedScriptArr[embedScriptIdx];
	                	evalInDiv(embedScriptArr[embedScriptIdx].innerHTML, jsWriteDiv);
	                	for( var i=0; i<jsWriteDiv.childNodes.length; i++ ) {
			            	embedJsObject.parentNode.insertBefore(jsWriteDiv.childNodes[i], embedJsObject);
			            }
            		}catch(e) { }
            	}
            	else {
	                eval(embedScriptArr[embedScriptIdx].innerHTML);
            	}
                embedScriptIdx++;
                executeScript();
            }
    }catch(e){
    }
};

// 해당 요소가 클래스를 포함하는지 여부를 리턴
function hasClassName(id, cls) {
	var el = document.getElementById(id);
	if (el) { return (el.className.indexOf(cls) == -1) ? false : true; }
}

var $A = Array.from = function(iterable) {
  if (!iterable) return [];
  if (iterable.toArray) {
    return iterable.toArray();
  } else {
    var results = [];
    for (var i = 0; i < iterable.length; i++)
      results.push(iterable[i]);
    return results;
  }
}

Function.prototype.bind = function() {
  var __method = this, args = $A(arguments), object = args.shift();
  return function() {
    return __method.apply(object, args.concat($A(arguments)));
  }
}
Object.extend = function(destination, source) {
  for (var property in source) {
    destination[property] = source[property];
  }
  return destination;
}

DaumCafeAjax = {
	execResult: function(xhr, success_callback, fail_callback) {
		if(xhr.readyState == 4) {
			var ct = xhr.getResponseHeader("content-type");
			var data = (ct && ct.indexOf("xml") >= 0) ? xhr.responseXML : xhr.responseText;
			if(xhr.status == 200) {
				if(success_callback!=null) success_callback(data);
			} else {
				if(fail_callback!=null) fail_callback(data);
			}
		}
	},
	get: function(url, success_callback, fail_callback) {
		var xhr = null;
		try{
			xhr = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
		} catch(e){ return; }
		if(xhr != null){
			try{
				xhr.onreadystatechange = this.execResult.bind(this, xhr, success_callback, fail_callback);
				if(url != null && url != "") {
					xhr.open("GET", url, true);
					xhr.send(null);
				}
			}catch(e){ return; }
		}
	},
	post: function(url, param, success_callback, fail_callback){
		var xhr = null;
		try{
			xhr = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
		} catch(e){ return; }
		if(xhr != null){
			try{
				xhr.onreadystatechange = this.execResult.bind(this, xhr, success_callback, fail_callback);
				if(url != null && url != "") {
					xhr.open("POST", url, true);
					xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=euc-kr");
					xhr.setRequestHeader("Content-Length", param.length);
					xhr.setRequestHeader("Connetion","close");
					xhr.send(param);
				}
			}catch(e){ return; }
		}
	}
}

function randNum(range) {
	var now = new Date()
	var num = (now.getSeconds()) % range
	var num = num + 1
	return num;
}

function copyCafeRssChannel(server, grpid, grpname, rssurl) {
	var url = "http://cafe"+server+".daum.net/_c21_/founder_rss_board_management?grpid="+grpid+"&cmd=popCopyChannel&rssurl=" + rssurl + "&isCafeRss=Y";
	window.open(url, 'pop_rss', 'width=530,height=400,resizable=no,scrollbars=no');
}

var Daum = {
	ua: navigator.userAgent,
	isLayerShown: false,
	isLogin: false,
	
	resetLayer: function() {	// handler of Event::document.onclick
		if (this.isLayerShown) {
			this.isLayerShown = false;
		} else {
			this.Dom.removeOldDiv();
		}
	}
};

//document.onclick = function() {
	//processAnalClick();	//통합 검색창 코드로 이동
//};

Daum.Dom = function() {
	var oldDiv = null;		// 마지막으로 block된 div의 id 속성 값
	return {
		setOldDiv: function(id) {
			oldDiv = id;
		},
		
		getOldDiv: function() {
			var id = oldDiv;
			return id;
		},
		
		removeOldDiv: function() {
			if (oldDiv) {
				document.getElementById(oldDiv).style.display = 'none';
			}
		},
		
		toggle: function(id, action, regist, delay) {
			Daum.isLayerShown = regist;
			var el = document.getElementById(id);
			
			if (oldDiv) {
				document.getElementById(oldDiv).style.display = 'none';
			}
			if (el) {
				if (delay) {
					setTimeout(function() {
						el.style.display = action;
					}, delay);
				} else {
					el.style.display = action;
				}
			}
			if (regist === true) {
				Daum.Dom.setOldDiv(id);
			}
		},
		
		// 단순하게 id를 block/none 처리
		simpleToggle: function(id) {
			var el = document.getElementById(id);
			
			if (el) {
				el.style.display = (el.style.display == 'block') ? 'none' : 'block'; 
			}
		}
	}
}();

Daum.Util = function() {	// common functions
	var pageInfo = {};
	return {
		addClassName: function(id, cls) {
			var target = document.getElementById(id);
			if (target) {
				target.className ? target.className + ' ' + cls : cls;
			}
		},
		
		rollingPage: function(key, direction, total) {
			var oldPage, curPage,
				flag = true;
			
			if (!pageInfo[key]) { pageInfo[key] = 1; }
			oldPage = pageInfo[key];
			
			if (direction == "next") {
				if(oldPage == total){
					flag = false;
				}else{
					curPage = parseInt(oldPage) + 1;
					if(curPage == total){
						document.getElementById(key + "_next").className = "no_next";
					}
					if(curPage != 1){
						document.getElementById(key + "_prev").className = "prev";
					}
				}
			} else {
				if(oldPage == "1"){
					flag = false;
				}else{
					curPage = parseInt(oldPage) - 1;
					if(curPage != total){
						document.getElementById(key + "_next").className = "next";
					}
					if(curPage == 1){
						document.getElementById(key + "_prev").className = "no_prev";
					}	
				}
			}

			if(flag){
				pageInfo[key] = curPage;

				Daum.Dom.toggle(key + "_" + oldPage, 'none');
				Daum.Dom.toggle(key + "_" + curPage, 'block');
			}
		}
	}
}();

realtime_highlighter = function(){
	var numItems,
		interval		= 2000,
		itemIndex		= -1,
		isInitialized	= false,
		isPlaying		= true,
		timer,
		defaultTopPos,
		defaultBgPos,
		defaultPos,
		layer;
		
	
	var updateDisplay = function(){
		daum.Element.setStyle(layer, "top:"+ (defaultTopPos + itemIndex*22) + "px;background-position:" + defaultPos + "px -"+(itemIndex*25 + defaultBgPos)+"px");
	};
	var animate = function(){
		if(itemIndex >= numItems) itemIndex = 0;
		updateDisplay();
		itemIndex++;
		restart_animation();
	};
	var stop_animation = function(){ clearTimeout(timer); };
	var restart_animation = function(){
		stop_animation();
		if(isPlaying) timer = setTimeout(animate, interval);
	};
	
	return {
		init: function(option){
			defaultPos = option.defaultPos;
			defaultBgPos = option.defaultBgPos;
			defaultTopPos = option.defaultTopPos; 
			numItems = option.numItems;
			layer = daum.$(option.layer);
			itemIndex = daum.random(0, numItems-1);
			var o1 = daum.addEvent(layer, "mouseover", stop_animation);
			var o2 = daum.addEvent(layer, "mouseout", restart_animation);
			layer.className = "highlighter";
			updateDisplay(option);
			itemIndex++;
			isInitialized = true;
		},
		refresh: function(option){
			if(!isInitialized || layer != option.layer){ this.init(option); }
			restart_animation();
		}
	}
}();

var realtime_chart = function(){
	var typeIndex = -1,
		chart = [];

	var update_chart = function(){
		if(typeIndex < 0 || typeIndex > chart.length-1) return;
		daum.$("trndList").className = chart[typeIndex];
		if(!daum.$("fanDonationLayer")){
			realtime_highlighter.refresh({
				layer : "schRealtimeBoxLayer",
				numItems : 10,
				defaultPos : 4,
				defaultTopPos : 27,
				defaultBgPos : 247
			});
		}
	};
	
	return {
		init: function(){
			var obj = daum.$$("#trndList .chart"), n=obj.length;
			for(var i=0; i<n; i++){
				chart[i] = obj[i].id;
			}
			typeIndex = daum.random(0, chart.length-1);
			update_chart();
		},
		nav: function(type){
			switch(type){
				case "prev" : typeIndex = (typeIndex>0) ? typeIndex-1 : chart.length-1;	break;
				case "next" : typeIndex = (typeIndex<chart.length-1) ? typeIndex+1 : 0; break;
				default : return;
			}
			update_chart();
		}
	}
}();

var top_mycafe = function(){
	var tabId_pattern	= /cafetoday|favorites|activities|lastvisits/,
		page_pattern	= /page(\d+)/,
		pagesize		= 8;
	
	var get_list = function(tabId){ var matched = daum.$$("#"+tabId+" .list"); return matched[0] || null; };
	
	var config = {
		cafetoday: {isInitialized:true, canExpand:false, needLogin:false},
		favorites: {isInitialized:false, canExpand:true, needLogin:true},
		activities: {isInitialized:false, canExpand:true, needLogin:true, contenturl:"/_c21_/myalimi_top"},
		lastvisits: {isInitialized:false, canExpand:true, needLogin:true, contenturl:"/_c21_/recentvisitcafe"},
		toggle: {isInitialized:false}
	};
	
	var updateClassByPattern = function(el, pattern, newClassName){
		if(!el) { return; }
		var curClassName = el.className;
		if( pattern.test(curClassName) ){
			el.className = curClassName.replace(pattern, newClassName);
		} else {
			daum.$E(el).addClassName(newClassName);
		}
	};
	
	var toggleClass = function(a, className, flag){
		for(var i=0,n=a.length; i<n; i++){
			var el = a[i];
			if( arguments.length<3 ){ flag = !daum.Element.hasClassName(el, className); }
			if(flag){
				daum.Element.addClassName(el, className);
			} else {
				daum.Element.removeClassName(el, className);
			}
		}
	};
	
	var get_pagenum = function(tabId) {
		var list = get_list(tabId);
		if(!list) { return -1; }
		var o = String(list.className).match(page_pattern);
		return o && o[1] ? Number(o[1]) : -1;
	};
	
	var update_dyncontent = function(xml) {
		var x = daum.xmlToObject(xml);
		
		var contentId = x.contentId;
		tabconfig = config[contentId];
		tabconfig.isEmpty = daum.String.trim(x.isEmpty) === "true";
		
		var c = x.content;
		if(c.length < 5) {
			var html=[], k=-1;
			c = xml.getElementsByTagName("content")[0].childNodes;
			for(var i=0,n=c.length;i<n;i++){
				var o = c[i];
				html[++k] = o.textContent || o;
			}
			c = html.join("");
		}
		daum.$(contentId).innerHTML = c;
		init_pages_callback(contentId);
	};
	
	var isExpanded = function() { return daum.$E("cWrap").hasClassName("expand"); };
	var toggleExpn = function(){
		toggleClass( daum.$$("#cWrap"), "expand" );
		for(var key in config){
			var o = config[key];
			if(o.canExpand) { update_pages(key); }
		}
	};
	
	var nav_handler = function(e){
		var o = daum.Event.getElement(e);
		var type = o.className;
		var el = daum.$E( daum.$E(o).getParent() );
		if( (type == "prev" && el.hasClassName("prev-disabled")) || (type == "next" && el.hasClassName("next-disabled")) ) {
			daum.Event.preventDefault(e);
			return false;
		}
		
		while(!el.hasClassName("content")){
			el = daum.$E( el.getParent() );
		}
		var tabId = el.id;
		var p = get_pagenum(tabId);
		var incr = isExpanded() ? 2 : 1;
		p = type == "prev" ? p-incr : p+incr;
		update_pages(tabId, p);
		daum.Event.preventDefault(e);
		return false;
	};
	
	var init_controls = function(tabId, canPage){
		if(canPage) {
			var navs = daum.$$("#"+tabId+" .box-navi a");
			for(var i=0,n=navs.length; i<n; i++){
				daum.Event.addEvent(navs[i], "click", nav_handler);  
			}
		}
		
		if(!config.toggle.isInitialized) {
			daum.Event.addEvent(daum.$$("#top-mycafe .content-footer .toggle")[0], "click", toggleExpn);
			config.toggle.isInitialized = true;
		}
	};
	
	var init_pages_callback = function(tabId){
		var tabconfig = config[tabId];
		var numcafes = daum.$$("#"+tabId+" .list tr").length;
		if(tabId == "favorites" && !tabconfig.isEmpty) {
			var placeHolder = daum.$$("#favorites .summary .firstchild strong.fav");
			if(placeHolder.length > 0) { placeHolder[0].innerHTML = numcafes; }
		}
		var numpages = Math.ceil(numcafes/pagesize);
		tabconfig.numpages = numpages;
		
		init_controls(tabId, numpages>1);
		update_containers(tabconfig);
		update_pages(tabId, 0);
		tabconfig.isInitialized = true;
	};

	var init_pages = function(tabId, afterDelete) {
		var tabconfig = config[tabId];
		var contentUrl = tabconfig.contenturl;
		if(afterDelete){
			contentUrl += "?afterDelete=true"
		}		
		if(!!contentUrl) {
			new daum.Ajax({
				onsuccess:function(r){ update_dyncontent(r.responseXML); }
			}).request(contentUrl); 
		} else {
			init_pages_callback(tabId);
		}
	};
	
	var update_pages = function(tabId, p) {
		var expn = isExpanded();
		var tabconfig = config[tabId];
		
		if(!tabconfig.isEmpty) {
			p = p !== undefined ? Number(p) : get_pagenum(tabId);
			var p2 = p%2 === 0 ? p+1 : p-1;
			var n = tabconfig.numpages;
			
			for(var i=0; i<n; i++){
				var table = daum.$$("#"+tabId+" .list table:eq("+i+")");
				if(table.length === 0) { continue; }
				toggleClass(table, "hide", expn ? (i!==p && i !==p2) : (i!==p));
			}
			
			var first = expn ? Math.min(p, p2) : p;
			var last = expn ? Math.max(p, p2) : p;
			var navs = daum.$$("#"+tabId+" .box-navi");
			if(navs.length > 0) {
				toggleClass(navs, "prev-disabled", first===0);
				toggleClass(navs, "next-disabled", last>=n-1);
			}
			
			updateClassByPattern( get_list(tabId), page_pattern, "page"+first);
		}
	};
	
	var update_containers = function(tabconfig) {
		if(isExpanded() && (!tabconfig.canExpand || !!tabconfig.isEmpty)) { toggleExpn(); }
		toggleClass(daum.$$("#top-mycafe"), "no_data", !!tabconfig.isEmpty);
	};
	
	var delete_notifier = function(param) {
		var url = "/_c21_/alimi_delete?"+param+"&_top_cafetop=myremove";
		new daum.Ajax({
			onsuccess:function(r){
				init_pages("activities", true);
			}
		}).request(url); 
	};
	
	var chk_loginStatus = function(tabId) {
		var layer = daum.$E("needLogin");
		if(config[tabId].needLogin) {
			layer.removeClassName("hide");
			var ml = 37;
			switch(tabId){
				case "activities" : ml=133;	break;
				case "lastvisits" :	ml=177; break;
			}
			daum.Element.setStyle(layer, "margin-left:"+ml+"px");
		} else {
			layer.addClassName("hide");
		}
	};
	
	return {
		isEmpty:function(tabId){	config[tabId].isEmpty = true; },
		toggle:function(tabId){
			var tabconfig = config[tabId];

			if(!Daum.isLogin) { chk_loginStatus(tabId); return; }

			update_containers(tabconfig);
			updateClassByPattern(daum.$("top-mycafe"), tabId_pattern, tabId);
			if(tabconfig.isInitialized){
				update_pages(tabId);
			} else {
				init_pages(tabId);
			}
		},
		del_An:function(grpid, fldid, dataid, type){ //deleteArticleNotifier//댓글/답글 알림 삭제
			var param=[], k=-1;
			param[++k] = "deltype=article";
			param[++k] = "grpid="+grpid;
			param[++k] = "fldid="+fldid;
			param[++k] = "dataid="+dataid;
			param[++k] = "type="+type;
			delete_notifier(param.join("&"));
		},
		del_MGn:function(grpid, type){ //deleteMemberGradeNotifier//댓글/답글 알림 삭제
			var param=[], k=-1;
			param[++k] = "deltype=user";
			param[++k] = "grpid="+grpid;
			param[++k] = "type="+type;
			delete_notifier(param.join("&"));
		},
		del_visitedCafe:function(grpid){ // 최근 방문한 카페 삭제
			var url = "/_c21_/deletevisitcafe?grpid="+grpid;
			new daum.Ajax({
				onsuccess:function(r){
					init_pages("lastvisits");
				}
			}).request(url);
		}
	};
	
}();


function noticePaging() {
	var container = daum.$('pagingNoticeList');
	container.className = container.className == "notice1" ? "notice2" : "notice1";
}

function boxtab_handler(id, n){
	switch(id){
		case "c" : id = "cafehotissue"; break;
//		case "s" : id = "subject_cafe"; break;
		default : return false;
	}
	daum.$(id).className = "wrap_box content"+n;
}
function cafefocus_nav(type){
	var container = daum.$('cafefocus');
	var curClass = container.className;
	if(curClass.indexOf("content") > -1){
		var l = daum.$$("#cafefocus .content").length;
		var i = Number( curClass.substr(7) );
		if(type == "prev") {
			i = i==1 ? l : i-1; 
		} else {
			i = i==l ? 1 : i+1;
		}
		container.className = "content"+i;
	}
}

function showRandomSub(containerId, subClassName) {
	var con = daum.$(containerId);
	con.className = con.className.replace(/\d+/, daum.random(1, daum.$$("#"+containerId+" ."+subClassName).length)); 
}

/* nil 태그 */
function sendAnalURL(url){
    var dummy = getDummy();
    var img = new Image(1,1);
    img.src = 'http://tiara.daum.net/tiara.front/front/click/' + dummy + '?dummy=' + dummy + '&url=' + url;
}
 
function processAnalClick(agEvt) {
    try {
        var evt = agEvt || window.event;
        var node = evt.srcElement || evt.target;
        while(1) {
            if (node.nodeName && node.nodeName.toLowerCase() == 'a') {
                break;
            }
            else {
                if (node.parentNode) {
                    node = node.parentNode;
                }
                else {
                    break;
                }
            }
        }
        if (node.href && node.href.indexOf('javascript') < 0) {
            var dummy = getDummy();
            var img = new Image(1,1);
            img.src = 'http://tiara.daum.net/tiara.front/front/click/' + dummy + '?dummy=' + dummy + '&url=' + node.href;
        }
    }
    catch(e) {}
}
 
function getDummy() {
    return new Date().getTime() + Math.ceil(Math.random() * 2147483647);
}
var cafetop_init = function(){
	realtime_chart.init();
	showRandomSub("cafehotissue", "box_body");
//	showRandomSub("subject_cafe", "box_body");
	showRandomSub("cafefocus", "content");
	
};

/* cookie function */
function setCookie(name, value, expiredays, domain) {
    var exdate = new Date();
    exdate.setDate( exdate.getDate() + expiredays );
    if (typeof(domain) == 'undefined') { domain = document.location.hostname; }    
    document.cookie=name+ "=" +escape(value)+"; path=/; domain=" + domain + ((expiredays==null) ? "" : ";expires="+exdate.toGMTString());    
}

function getCookie(name) {
	if (document.cookie.length>0) {
		var c_start=document.cookie.indexOf(name + "=");
		if (c_start!=-1) {
			c_start=c_start + name.length+1;
			var c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1) c_end=document.cookie.length;
			return unescape(document.cookie.substring(c_start,c_end));
		}
	}
	return "";
}

function deleteCookie(name, domain)
{
	var expireDate = new Date();
	expireDate.setDate( expireDate.getDate() - 1 );
	if (typeof(domain) == 'undefined') { domain = document.location.hostname; }
	document.cookie = name + "= " + "; path=/; domain=" + domain + "; expires=" + expireDate.toGMTString() + ";";
}

/* resize popup window */
function resizeToAutoHeight(width, heightOffset, offsets){
	var gap = 0;
	heightOffset = heightOffset?heightOffset:0;
	if(offsets){
		for(var i = 0;i < offsets.length; i++){
			if(offsets[i].bw){heightOffset = offsets[i].offset;}
		}
	}
	width = width?width:document.documentElement.scrollWidth;
	if(daum.Browser.cr){
		if (document.documentElement.clientHeight > 0) { gap = 50; }
		window.resizeTo(width, document.body.clientHeight + gap + heightOffset);
		return;
	}//Chrome
	var height = daum.Browser.sf ? document.body.clientHeight : document.body.scrollHeight;
	window.resizeTo(width, height); //set Standard Size...
	var innerHeight=document.documentElement.scrollHeight?document.documentElement.scrollHeight:document.body.scrollHeight;
	var contentHeight=0;
	if(daum.Browser.ie || daum.Browser.op){
		contentHeight = document.documentElement.clientHeight?document.documentElement.clientHeight:document.body.clientHeight;
		if(daum.Browser.ie_sv1){innerHeight = document.body.scrollHeight;}
	}
	else if(daum.Browser.ff){
		contentHeight = window.innerHeight;
	}
	else if(daum.Browser.sf)
	{
		innerHeight = document.body.clientHeight;
		contentHeight = window.innerHeight;
	}
	if(innerHeight && contentHeight && innerHeight != contentHeight){
		gap = innerHeight - contentHeight;
	}

	window.resizeTo(width, height+gap+heightOffset);
}

function namespace(strNamespace){
	(function (arrNames, parentObj){
		if(!arrNames || !arrNames.length){return;}
		var pkgName = arrNames.shift();
		if(!parentObj[pkgName]){
			parentObj[pkgName] = {};
		}
		arguments.callee(arrNames, parentObj[pkgName]);
	})(strNamespace.split("."), window);
}

/* 
 * Mobile Web Redirect
 */
function checkMobileUserAgent(){
	var MobileDevice = [/lgtelecom/,/opera.*skt/,/ppc.*opera/,/smartphone.*opera/,/800*480;nate/,/nate.*browser/,/mobile safari/,/iriver/,/iemobile navi/,/polaris/,/iphone/,/dolfin/,/ipad/];
	var isMobile = false;
	for(var i=MobileDevice.length -1 ; i>=0 ; i--){
		if(_agent.search(MobileDevice[i]) > -1){
			isMobile = true;
			break;
		}
	}
	return isMobile;
}

/*!
 * @overview Blinder Javascript widget
 * Copyright (c) 2011 Ft4 Front-end Technology Center, Daum Communications.
 * 
 * $Version : 1.0.0 $
 * $Date : 2011-09-07 14:12 $
 * $Description : darkLayer$
 * $Required : namespace (function), jigu$
 * $CSS : 
 * 				#darkBg {z-index:99999; position:fixed; top:0; left:0; background-color:#000;width:100%;height:100%;background-color:#000;opacity:0.5; filter:alpha(opacity=50);}
 * 				* html #darkBg {position:absolute;}
 *				.light_box {position:fixed; z-index:100000;}
 *				* html .light_box {position:absolute;}
 *
 */

(function(){
	namespace("daum.cafe.widget");
	daum.cafe.widget.Blinder = {
			layerEl : null,
			shadowEl : null,
			darkBgEl : null,
			_offsetX : 0,
			
			makeDarkBg: function(){
				var el = document.createElement("div");
				el.id = "darkBg";
				el.style.display = "none";
				document.body.appendChild(el);
				return el;
			},
			showWithSize: function(layerEl, width, height){
				this.layerEl = daum.$(layerEl);
				this.updateLayerPosition(width, height);
				this.show(layerEl);
			},
			show : function(layerEl, shadowEl, offsetX){
				if(!this.darkBgEl){
					this.darkBgEl = this.makeDarkBg();
					daum.Event.addEvent(window, "resize", this.onResizeWindow.bindAsEventListener(this));
					daum.Event.addEvent(window, "scroll", this.onScroll.bindAsEventListener(this));
				}
				
				this.setOffsetX(offsetX);
				this.layerEl = daum.$(layerEl);
				this.shadowEl = daum.$(shadowEl);
				
				daum.Element.addClassName(this.layerEl, "light_box");
				daum.Element.show(this.darkBgEl);
				daum.Element.show(this.layerEl);
				this.didFixPosition = false;
				
				var initUpdateTimer = setInterval(this.updateUI.bind(this), 300);
				setTimeout(function(){
					clearInterval(initUpdateTimer);
				}, 2000);
			},
			
			hide : function(){
				clearTimeout(this.darkLayerTimer);
				daum.Element.hide(this.layerEl);
				this.layerEl = null;
				this.shadowEl = null;
				daum.Element.hide(this.darkBgEl);
			},
			
			onScroll: function(){
				this.updateUI();
			},
			onResizeWindow: function(evt){
				this.updateUI();
			},
		
			updateUI : function(){
				this.updateLayerPosition();
				this.updateDarkBgElementSize();
			},
			
			updateLayerPosition : function(width, height){
				if(!this.layerEl){return;}
				
				var elOffset = daum.Element.getCoords(this.layerEl, true),
		    	bOffset = daum.Browser.getWindowSize(),
		    	w = width || elOffset.right - elOffset.left,
		    	h = height || elOffset.bottom - elOffset.top,
				x =  this.calcCenter(bOffset.width, w),
		    	y =  this.calcCenter(bOffset.height, h);
				
				if(h >= bOffset.height || w >= bOffset.width){
					
						if(!this.didFixPosition && daum.Browser.ie6){
							this.offsetScrollX = this.getScrollLeft();
							this.offsetScrollY = this.getScrollTop();
							this.didFixPosition = true;
						}
							
						if(daum.Browser.ie6){
							x += this.offsetScrollX;
							y += this.offsetScrollY;
						} else {
							x -=  this.getScrollLeft();
							y -= this.getScrollTop();
						}
						
				} else {
					 if(daum.Browser.ie6) {
						 this.didFixPosition = false;
							x += this.getScrollLeft();
							y += this.getScrollTop();
					}
				}
				daum.Element.setPosition(this.layerEl, (parseInt(x) + this._offsetX), parseInt(y));
			    this.updateShadowElementPositionAndSize (x, y);
			},
			
			
			
			updateDarkBgElementSize: function(){
				if(daum.Browser.ie6 && this.darkBgEl){
					var bOffset = daum.Browser.getWindowSize();
					
					var winHeight = Math.max(bOffset.height, document.body.scrollHeight);
					var winWidth = Math.max(bOffset.width, document.body.scrollWidth);
					
					
					var isHeightChange = winHeight!= this.darkBgEl.offsetHeight;
					var isWidthChange = winWidth != this.darkBgEl.offsetWidth; 
					if(isHeightChange){
						this.darkBgEl.style.height = winHeight.px();
					}
					if(isWidthChange){
						this.darkBgEl.style.width = winWidth.px();
					}
				}
			},
			
			
			updateShadowElementPositionAndSize : function(x, y){
				if(this.shadowEl){
			    	this.shadowEl.style.left = parseInt(x).px();
			    	this.shadowEl.style.top = parseInt(y).px();
			    	this.shadowEl.style.width = this.layerEl.offsetWidth.px();
			    	this.shadowEl.style.height = this.layerEl.offsetHeight.px();
			    }
			},
			
			
			calcCenter: function(nParent, nChild) {
				return Math.abs((nParent - nChild) * 0.5);
			},
			
			setOffsetX : function(offsetX){
				offsetX = parseInt(offsetX);
				if(!!offsetX){
					this._offsetX = offsetX;
				}
			},
			
			getScrollLeft : function(){
				return document.documentElement.scrollLeft || document.body.scrollLeft;
			},
			getScrollTop : function(){
				return document.documentElement.scrollTop || document.body.scrollTop;
			}
			
		};
})();

function findParentItem(query, item) {
	if(!item || item === document) {
		return;
	} else if(!item.tagName) {
		return;
	}
	
	var queries = query.split(".");
	var tagName = null;
	var className = null;
	var itemTagName = item.tagName.toLowerCase();
	
	switch(queries.length) {
		case 1: 
			tagName = queries[0]; 
			break;
		case 2: 
			tagName = queries[0];
			className = queries[1];
			break;
		default:
			return;
	}
	
	if(tagName && className){
		if(itemTagName === tagName && daum.Element.hasClassName(item, className)) return item;
	} else if(tagName){
		if(itemTagName === tagName) return item;
	} else if(className){
		if(daum.Element.hasClassName(item, className)) return item;
	}
	
	var parent = daum.Element.getParent(item);
	
	if(parent){
		return findParentItem(query, parent);
	} else {
		return;
	}
}

/**
 * Layer Observer
 * 
 * options
 ** top, left (number)
 ** show, hide (function)
 ** isNotAutoClose (boolean)
 */
LayerItem = function(target, layer, option) {
	this.target = target;
	this.layer = layer;
	daum.extend(this, option);
	this.init();
};

LayerItem.prototype = {
	init: function() {
		if(!this.show) {
			this.show = this.showAction;
		}
		
		if(!this.hide) {
			this.hide = this.hideAction;
		}
		 
		this.initEvent();
	},
	initEvent: function() {
		this.targetEvent = daum.Event.addEvent(this.target, "click", this.toggleLayer.bind(this));
		this.layerEvent = daum.Event.addEvent(this.layer, "click", this.onclickLayer.bind(this));
	},
	getRelativeParent: function() {
		var parent = daum.Element.getParent(this.layer);
		
		while(parent.tagName) {
			var position = daum.Element.getStyle(parent, "position");
			
			if(position === "absolute" || position === "relative") {
				return parent;
			}
			
			parent = daum.Element.getParent(parent);
		}
		
		return;
	},
	toggleLayer: function(ev) {
		if (ev) {
			daum.Event.stopEvent(ev);
		}
		
		if(this.top || this.left) {
			this.setLayerPosition();
		}
		this.hideOtherLayer();
		
		if(daum.Element.visible(this.layer)) {
			this.hide();
		} else {
			this.show();
		}
	},
	showAction: function() {
		daum.Element.show(this.layer);
	},
	hideAction: function() {
		daum.Element.hide(this.layer);
	},
	setLayerPosition: function() {
		if(!this.relativeParent) {
			this.relativeParent = this.getRelativeParent();
		}
		var coords = (this.relativeParent) ? daum.Element.getCoordsTarget(this.target, this.relativeParent) : daum.Element.getCoords(this.target);
		var left = (this.left) ? coords.left + this.left : coords.left;
		var top = (this.top) ? coords.top + this.top : coords.top;
		
		daum.Element.setPosition(this.layer, left, top);
	},
	hideOtherLayer: function() {
		LayerObserver.hideAllLayer(null, this.layer);
	},
	onclickLayer: function(ev) {
		if(ev) {
			daum.Event.stopPropagation(ev);
		}
		if(!this.isNotAutoClose) {
			this.hide();
		}
	},
	remove: function() {
		if(this.targetEvent) {
			daum.Event.stopObserving(this.targetEvent);
		}
		if(this.layerEvent) {
			daum.Event.stopObserving(this.layerEvent);
		}
	}
};

LayerObserver = {
	layerItems: [],
	add: function(target, layer, option) {
		if(!target || !layer) return;
		
		var layerItem = new LayerItem(target, layer, option);
		this.layerItems.push(layerItem);
		
		if(this.layerItems.length == 1){
			this.initEvent();
		}
		
		return layerItem;
	},
	initEvent: function() {
		daum.Event.addEvent(document.body, "click", this.hideAllLayer.bindAsEventListener(this));
	},
	hideAllLayer: function(ev, exceptItem) {
		for(var i = this.layerItems.length; i--;) {
			if(!exceptItem || exceptItem !== this.layerItems[i].layer) {
				this.layerItems[i].hide();
			}
		}
		
		if(ev) {
			daum.Event.stopPropagation(ev);
		}
	}
};

function getMyPeoplePcVersion(anchor) {
	var platform = window.navigator.platform.toLowerCase();
	
	if (platform && platform.indexOf('win') != -1) {
		anchor.href = "http://get.daum.net/myb/MyPeopleSetup.exe";
	} else if (platform && platform.indexOf('mac') != -1) {
		anchor.href = "http://get.daum.net/myb/MyPeople.air";
	} else {
		anchor.target = "_blank";
	}
}

/* 팬카페 섹션 */
function showRankLayer(el){
	var score = daum.$C(el, "score")[0];
	if(score){
		daum.Element.show(score);
	}
}

function hideRankLayer(el){
	var score = daum.$C(el, "score")[0];
	if(score){
		daum.Element.hide(score);
	}
}

function openFancafePopup(){
	var fancafePopLayer = daum.$("fancafePopLayer");
	focusLayer.show(fancafePopLayer);
}

var FancafeArticleManager = function(elList, pixelPerPage, maxIndex){
	this.init(elList, pixelPerPage, maxIndex);
}.members({
	index: 1,
	pageGap : 6,
	articleList: null,
	articleListWidth: 0,
	btnPrev: null,
	btnNext: null,
	prevJump: false,
	nextJump: false,
	template: new daum.Template('<div id="star_title"><a href="http://search.daum.net/search?w=tot&q=#{keyword}" target="_blank"><img src="#{imgurl}" width="28" height="28" /></a><a href="#{link}" target="_blank"><strong class="txt_point">#{keyword}</strong></a></div>\
			<a href="#{link}" target="_blank"><p id="star_article" class="txt_article">#{title}</p></a>\
			<div id="star_article_info"><img src="http://i1.daumcdn.net/cafeimg/top7/cafe/fancafe4/icon_startalk_time.gif" width="10" height="10"/><span class="txt_sub">#{regdt}</span><span class="txt_bar">|</span><img src="http://i1.daumcdn.net/cafeimg/top7/cafe/fancafe4/icon_startalk_reply.gif" width="13" height="10"/><span class="txt_point">#{cmtCount}</span></div>'), 
	init: function(elList, pixelPerPage, maxIndex){
		var articleListWrap = daum.$(elList);
		this.articleList = articleListWrap.getElementsByTagName("ul")[0];
		this.articleListWidth = this.articleList.offsetWidth-150-33;
		this.btnPrev = daum.$("star_prev_btn");
		this.btnNext = daum.$("star_next_btn");
		this.talkBox = daum.$("starTalkBox");
		this.pixelPerPage = pixelPerPage;
		this.prevJump = true;
		this.maxIndex = maxIndex;
		this.interval = null;
		this.borderBox = daum.$("border_box");
		this.startInterval();
		this.current = 0;
		this.setTalkBoxBackground(this.index);
		
		this.articleHelp = daum.$("article_help");
		this.articleHelpLayer = daum.$("article_help_layer");
		
		daum.addEvent(this.articleHelp,"mouseover",this.showHelpLayer.bind(this));
		daum.addEvent(this.articleHelp,"mouseout",this.hideHelpLayer.bind(this));
		
		daum.addEvent(this.btnPrev,"click",this.goToOtherList.bind(this,"prev",true));
		daum.addEvent(this.btnNext,"click",this.goToOtherList.bind(this,"next",true));
	
		daum.addEvent("star_article_wrap","mouseover",this.onmouseOverInWrap.bindAsEventListener(this));
		daum.addEvent("star_article_wrap","mouseout",this.onmouseOutInWrap.bindAsEventListener(this));
		
		daum.addEvent(this.borderBox,"click",this.goToStarSearch.bind(this));
	
	},
	goToStarSearch: function() {
		window.open(starAticleArr[this.index+this.current-1].link,'_blank');
	},
	showHelpLayer: function(){
		daum.Element.show(this.articleHelpLayer);
	},
	hideHelpLayer: function(){
		daum.Element.hide(this.articleHelpLayer);
	},
	startInterval: function(){
		this.interval = daum.Function.timeout(this.intervalFunction, 3000, this);
	},
	stopInterval: function(){
		if(this.interval != null){
			window.clearTimeout(this.interval);
			this.interval = null;
		}
	},
	intervalFunction: function(){
		this.goToOtherList("next");
		this.startInterval();
	},
	checkParent: function(target){
		while(target && target.tagName.toLowerCase() !== "body"){
			if (target.tagName.toLowerCase() === "li"){
				return target;
			}else{
				target = target.parentNode;
			}
		}
		return null;
	},
	onmouseOverInWrap: function(e){
		this.stopInterval();
		var target = daum.Event.getElement(e);
		target = this.checkParent(target);
		if (target && target.tagName.toLowerCase() === "li"){
			var targetIndex = target.id.split("-")[1];
			this.current = (targetIndex - this.index);
			this.setTalkBoxBackground(targetIndex);
		}
	},
	onmouseOutInWrap: function(e){
		var target = daum.Event.getElement(e);
		daum.Event.stopEvent(e);
		this.startInterval();
	},
	setTalkBoxBackground: function(targetIndex, focusIndex){
		if(focusIndex){
			this.talkBox.innerHTML = this.template.evaluate(starAticleArr[targetIndex-1+focusIndex]);
			this.talkBox.className = "star_talk_box box"+focusIndex;
			daum.Element.setLeft(this.borderBox, 32+61*focusIndex);
		}else{
			this.talkBox.innerHTML = this.template.evaluate(starAticleArr[targetIndex-1]);
			this.talkBox.className = "star_talk_box box"+(targetIndex - this.index);
			daum.Element.setLeft(this.borderBox, 32+61*(targetIndex - this.index));
		}
	},
	setSelectedStarProfil: function(index){
		var listItem = daum.$("star_article-"+index);
		var item = daum.$T("p", listItem)[0];
		var data = item.innerHTML;			
	},
	goToOtherList: function(pageMoveType, isFoucusing){

		if(pageMoveType == "prev"){
			if(this.hasPrev()){
				this.index--;
			}else{
				this.index = this.maxIndex;
			}
		}else if(pageMoveType == "next"){
			if(this.hasNext()){
				this.index++;
			}else{
				this.index = 1;
			}
		}
		var pixelWithIndex = this.getPixelWithIndex(this.index);
		var curPagePixel = (pixelWithIndex * -1).px();
		this.articleList.style.marginLeft = curPagePixel;
		this.changeBtnClass();
		if(isFoucusing){
			this.setTalkBoxBackground(this.index, this.current);
		}else{
			this.current = 0;
			this.setTalkBoxBackground(this.index);
		}
	},
	
	getPixelWithIndex : function(index){
		return (index-1) * this.pixelPerPage;
	},
	
	hasNext : function(){
		return this.articleListWidth > this.getPixelWithIndex(this.index+1) + this.pageGap;
	},
	
	hasPrev : function(){
		return this.index > 1;
	},
	
	changeBtnClass: function(){
		if(this.hasPrev()){
			daum.Element.removeClassName(this.btnPrev, "opacity");
			this.prevJump = false;
		} else {
			daum.Element.addClassName(this.btnPrev, "opacity");
			this.prevJump = true;
		}
		if(this.hasNext()){
			daum.Element.removeClassName(this.btnNext, "opacity");
			this.nextJump = false;
		} else {
			daum.Element.addClassName(this.btnNext, "opacity");
			this.nextJump = true;
		}
	}		
});

var FancafeStarSearchManager = {
	urlList: {
		all : "/_c21_/starcafe_list",
		musition : "/_c21_/starcafe_list?field=3",
		actor : "/_c21_/starcafe_list?field=2",
		sportsman :  "/_c21_/starcafe_list?field=4",
		author : "/_c21_/starcafe_list?field=6",
		gagman : "/_c21_/starcafe_list?field=1",
		progamer : "/_c21_/starcafe_list?field=5"
	},
	typeIndex:["all", "musition", "actor", "sportsman", "author", "gagman", "progamer"],
	init: function(){
		this.state = false;
		this.starBtn = daum.$("fancafeStarBtn");
		this.closeBtn = daum.$("fancafeStarCloseBtn");
		this.starListLayer = daum.$("layer_starsearch");
		this.starList = daum.$C(this.starListLayer, "list_name")[0];
		this.menu = daum.$$("a", this.starListLayer);
		
		daum.Event.addEvent(this.starBtn, "click", this.showStarSearchLayer.bindAsEventListener(this));
		daum.Event.addEvent(this.closeBtn, "click", this.hideStarSearchLayer.bindAsEventListener(this));
		
		for(var i=0,len=this.menu.length;i<len;i++){
			daum.Event.addEvent(this.menu[i], "click", this.requestStarList.bindAsEventListener(this,this.typeIndex[i]));
		}
	},
	showStarSearchLayer: function(){
		if(!this.state){
			this.requestStarList(null,"all");
			this.state="all";
		}
		daum.Element.show(this.starListLayer);
	},
	hideStarSearchLayer: function(){
		daum.Element.hide(this.starListLayer);
	},
	requestStarList: function(e, type){
		if(e){
			daum.Event.preventDefault(e);
		}
		if(this.state != type){
			var ajaxCall = new daum.Ajax();
    		ajaxCall.request(this.urlList[type],{onsuccess:this.setStarList.bind(this,type),onfailure: function(){console.log("fail")}}); 
		}
	},
	setStarList: function(type, r){
		this.setSelectedType(type);
		this.starList.innerHTML =  r.responseText;
		this.starList.scrollTop = 0;
	},
	setSelectedType: function(type){
		for(var i=0,len=this.menu.length;i<len;i++){
			if(type == this.typeIndex[i]){
				daum.Element.addClassName(this.menu[i],"focus");
				this.state = type;
			}else{
				daum.Element.replaceClassName(this.menu[i],"focus","");
			}
		}
	}
};

var FancafeManager = {
	urlList: {
		cheer:["/_c21_/fancafe_list_new","/_c21_/fancafe_list_new?order=click","/_c21_/fancafe_list_new?order=visit","/_c21_/fancafe_list_new?order=newmember","/_c21_/fancafe_list_new?order=article"],
		field:["/_c21_/fancafe_list_field?field=003","/_c21_/fancafe_list_field?field=001","/_c21_/fancafe_list_field?field=002","/_c21_/fancafe_list_field?field=004","/_c21_/fancafe_list_field?field=009","/_c21_/fancafe_list_field?field=010"],
		number:["/_c21_/fancafe_list_term?term=1","/_c21_/fancafe_list_term?term=2","/_c21_/fancafe_list_term?term=3","/_c21_/fancafe_list_term?term=4"]
	},
	init: function(){
		this.intro = daum.$("fancafeIntro");
		this.stage = daum.$("fancafeStage");
		this.introBtn = daum.$("fancafeIntroBtn");
		this.stageBtn = daum.$("fancafeStageBtn");
		this.currentState = "cheer0";
		this.mainTab = daum.$("fancafeMainTab");
		this.subTab = daum.$("fancafeSubTab");
		
		this.cheerList = daum.$("fancafeCheerList");
		this.fieldList = daum.$("fancafeFieldList");
		this.fancafeHelpLayer = daum.$("fancafeHelpLayer");
		    		
		this.currentList = this.cheerList;
		    		
		this.fancafeWrapBtns = daum.$("fancafeWrapBtn");
		this.moreBtn = daum.Element.getChildElements(this.fancafeWrapBtns)[1];
		this.allBtn = daum.Element.getChildElements(this.fancafeWrapBtns)[2];
		this.topBtn = daum.Element.getChildElements(this.fancafeWrapBtns)[3];
			
		this.mainTabSelected = 1;
		this.registSideTabEvent();
		this.registMainTabEvent();
		
		this.registCheerSubTabEvent();
		this.registFieldSubTabEvent();
		this.registFancafeWrapBtnEvent();
		
	},
	registFancafeWrapBtnEvent: function(){
		daum.Event.addEvent(this.moreBtn, "click", this.showMoreDataList.bind(this));
		daum.Event.addEvent(this.allBtn, "click", this.showAllDataList.bind(this));
		daum.Event.addEvent(this.topBtn, "click", this.goTop.bind(this));
	},
	registSideTabEvent: function(){
		daum.Event.addEvent(this.stageBtn, "click", this.sideTabManager.bind(this));
		daum.Event.addEvent(this.introBtn, "click", this.sideTabManager.bind(this));
	},
	registMainTabEvent: function(){
		var items = daum.Element.getChildElements(this.mainTab);
		daum.Event.addEvent(items[0], "click", this.mainTabManager.bindAsEventListener(this,1));
		daum.Event.addEvent(items[1], "click", this.mainTabManager.bindAsEventListener(this,2));
		daum.Event.addEvent(items[2], "click", this.mainTabManager.bindAsEventListener(this,3));
	},
	registSubTabEvent: function(el, type){
		var ul = daum.$C(el, "tab_sort")[0];
		var items = daum.Element.getChildElements(ul);
		for (var i=0, len=items.length; i<len; i++){
			daum.Event.addEvent(items[i], "click", this.subTabManager.bindAsEventListener(this,type, i));
		}
	},
	registCheerSubTabEvent: function(){
		this.registSubTabEvent(this.cheerList, "cheer");
	},
	registFieldSubTabEvent: function(){
		this.registSubTabEvent(this.fieldList, "field");
	},
	showAllDataList: function(e){
		daum.Event.preventDefault(e);
		var dataList = daum.$C(this.currentList,"list_fancafe")[0];
		this.currentList.style.height = null;
		this.disabledBtn();		
	},
	showMoreDataList: function(e){
		daum.Event.preventDefault(e);
		var dataList = daum.$C(this.currentList,"list_fancafe")[0];
		if(this.currentState.indexOf("cheer") > -1){
			var plusHeight = 580;
		}else{
			var plusHeight = 450;
		}
		if(dataList.offsetHeight - plusHeight > this.currentList.offsetHeight){ 
			daum.Element.setHeight(this.currentList, plusHeight, true);
		}else{
			daum.Element.setHeight(this.currentList, dataList.offsetHeight+23+24);
			this.disabledBtn();
		}
	},
	disabledBtn: function(){
		if(!daum.Element.hasClassName(this.allBtn, "disable")){
			daum.Element.addClassName(this.allBtn, "disable");
		}
		if(!daum.Element.hasClassName(this.moreBtn, "disable")){
			daum.Element.addClassName(this.moreBtn, "disable");
		}
	},
	goTop: function(e){
		daum.Event.preventDefault(e);
		window.scrollTo(0,0);
	},
	sideTabManager: function(e){
		daum.Event.preventDefault(e);
		var target = daum.Event.getElement(e);
		var parent = daum.Element.getParent(target);
		if(target === this.introBtn || parent === this.introBtn){
			this.introBtn.className = "on";
    		this.stageBtn.className = "off";
    		daum.Element.removeClassName(this.stage,"show");
    		daum.Element.addClassName(this.intro,"show");
		}else if(target === this.stageBtn || parent === this.stageBtn){
			this.introBtn.className = "off";
    		this.stageBtn.className = "on";
    		daum.Element.removeClassName(this.intro,"show");
    		daum.Element.addClassName(this.stage,"show");
		}
	},
	checkParent: function(target){
		while(target && target.tagName.toLowerCase() !== "body"){
			if (target.tagName.toLowerCase() === "li"){
				return target;
			}else{
				target = target.parentNode;
			}
		}
		return null;
	},
	mainTabManager: function(e, seq){
		var target = daum.Event.getElement(e);
		if (target && seq != this.mainTabSelected){
			daum.Element.replaceClassName(this.mainTab, "tab_fan"+this.mainTabSelected, "tab_fan"+ seq);
			this.mainTabSelected = seq;
			daum.Element.hide(this.cheerList);
			daum.Element.hide(this.fieldList);
			//daum.Element.hide(this.numberList);
			daum.Element.hide(this.fancafeHelpLayer);
			switch(seq){
    			case 1:
    				daum.Element.show(this.cheerList);
    				daum.Element.show(this.fancafeWrapBtns);
    				this.subTabManager(null, "cheer",0);
    				break;
    			case 2:
    				daum.Element.show(this.fieldList);
    				daum.Element.show(this.fancafeWrapBtns);
    				this.subTabManager(null, "field",Math.floor(Math.random()*this.urlList["field"].length));
    				break;
    			case 3:
    				daum.Element.show(this.fancafeHelpLayer);
    				daum.Element.hide(this.fancafeWrapBtns);
    				break;
			}
		}
	},
	subTabManager: function(e, type, index){
		if(e){
			daum.Event.preventDefault(e);
		}
		if (this.currentState != (type+index)){
    		this.currentState = type+index;
    		this.setSubTabSelected(type, index);
    		var urlType = this.urlList[type];
    		var ajaxCall = new daum.Ajax();
    		ajaxCall.request(urlType[index],{onsuccess:this.setFancafeData.bind(this,type),onfailure: function(){console.log("fail")}}); 
		}
	},
	setSubTabSelected: function(type, index){
		if(type == "cheer"){
			var subList = daum.$C(this.cheerList,"tab_sort")[0];
		}else if(type == "field"){
			var subList = daum.$C(this.fieldList,"tab_sort")[0];
		}
		var items = daum.Element.getChildElements(subList);
		for (var i=0, len=items.length; i<len; i++){
			if (index == i){
				daum.Element.addClassName(items[i], "on");
			}else{
				daum.Element.replaceClassName(items[i], "on", "");
			}
		}
	},
	setFancafeData: function(type, r){
		if(type == "cheer"){
			var dataList = daum.$C(this.cheerList,"list_fancafe")[0];
			this.currentList = this.cheerList;
			var initHeight = 594;
		}else if(type == "field"){
			var dataList = daum.$C(this.fieldList,"list_fancafe")[0];
			this.currentList = this.fieldList;
			var initHeight = 465;
		}
		dataList.innerHTML = r.responseText;
		this.setInitHeightOfList(dataList, initHeight);
		if(daum.Element.getChildElements(dataList).length <= 15){
			daum.Element.hide(this.moreBtn);
			daum.Element.hide(this.allBtn);
			daum.Element.hide(this.topBtn);
			this.fancafeWrapBtns.style.height="35px";
		}else{
			daum.Element.show(this.moreBtn);
			daum.Element.show(this.allBtn);
			daum.Element.show(this.topBtn);
			this.fancafeWrapBtns.style.height="85px";
			daum.Element.replaceClassName(this.moreBtn,"disable","");
			daum.Element.replaceClassName(this.allBtn,"disable","");
		}
	},
	setInitHeightOfList: function(dataList, initHeight){
		if(dataList.offsetHeight - initHeight < 0){ 
			daum.Element.setHeight(this.currentList, dataList.offsetHeight+23+24);
		}else{
			daum.Element.setHeight(this.currentList, initHeight);
		}	
	}
};

/*
 * cafeDarkLayer 대체로 만듬 - wracker1
 * 
 * focusLayer.show(wannaShowLayerElement);
 * focusLayer.hide();
 * focusLayer.setup({darkLayerOpacity: 0.1, layerZindex: 99}); <- (optional method): z-index, 다크레이어 스타일과 같이 기본 설정을 오버라이딩하고 싶을 경우 사용.
 * 주의: document.body 가 domready가 된 이후에 사용할 것
 * 
 */
var focusLayer = {
	suspendTaskLayer: null,
	/* 오버라이딩 가능 */
	layerZindex: 999999,
	darkLayerOpacity: 0.6,
	darkLayerStyle: "display:none;width:100%;height:100%;top:0;left:0;background-color:#000;",
	hideElementQuery: "select, object, iframe",
	useFixed: true,
	useDarkLayer: true,
	
	show: function(layer) {
		if(this.isInitialized) {
			this.showLayer(daum.$(layer));
		} else {
			this.suspendTaskLayer = daum.$(layer); 
			this.init();
		}
	},
	hide: function() {
		if(this.isInitialized) {
			this.hideLayer();
		}
	},
	setup: function(option) {
		daum.extend(this, option, true);
		this.init();
	},
	init: function() {
		this.appendTarget = document.body;
		this.isAbsoluteLayer = (daum.Browser.ie6) ? true : false;
		
		if(this.isAbsoluteLayer) {
			this.needHideElements = daum.$$(this.hideElementQuery, document.body);
		}
		
		if(this.useDarkLayer) {
			this.makeDarkLayer(this.darkLayerStyle);
		}
		this.isInitialized = true;
		this.executeTask();
	},
	showLayer: function(layer) {
		if(this.layer && daum.Element.visible(this.layer)) {
			daum.Element.hide(this.layer);
		}
		
		if(this.useDarkLayer) {
			daum.Element.show(this.darkLayer);
		}
		
		if(layer) {
			if(!layer.isInitialized) {
				this.setMainLayerStyle(layer);
			}
			this.layer = layer;
			daum.Element.show(this.layer);
			this.centeringMainLayer();
		}
		
		if(this.isAbsoluteLayer) {
			this.hideOtherElements();
		}
		this.createEvent();
	},
	hideLayer: function() {
		if(this.useDarkLayer) {
			daum.Element.hide(this.darkLayer);
		}
		
		if(this.isAbsoluteLayer) {
			this.showOtherElements();
		}
		
		if(this.layer) {
			daum.Element.hide(this.layer);
		}
		this.destroyEvent();
	},
	createEvent: function() {
		this.resizeEvent = daum.addEvent(window, "resize", this.resizingEventHandler.bind(this));
		this.keyEvent = daum.addEvent(document.body, "keyup", this.keyEventHandler.bind(this));
		
		if(this.isAbsoluteLayer && this.useFixed) {
			this.scrollEvent = daum.addEvent(window, "scroll", this.scrollingEventHandler.bind(this)); 
		}
	},
	destroyEvent: function() {
		daum.stopObserving(this.resizeEvent);
		daum.stopObserving(this.keyEvent);
		
		if(this.scrollEvent) {
			daum.stopObserving(this.scrollEvent);	
		}
	},
	makeDarkLayer: function(style) {
		this.darkLayer = daum.createElement("div", {style: style + "z-index:" + this.layerZindex + ";"});
		this.appendTarget.appendChild(this.darkLayer);
		this.setStylePositionType(this.darkLayer);
		daum.Element.setOpacity(this.darkLayer, this.darkLayerOpacity);
		
		if(this.isAbsoluteLayer) {
			this.resetDarkLayerSize();
		}
	},
	setMainLayerStyle: function(mainLayer) {
		this.appendTarget.appendChild(mainLayer);
		this.setStylePositionType(mainLayer);
		mainLayer.style.zIndex = this.layerZindex + 1;
		mainLayer.isInitialized = true;
		
		if(this.isAbsoluteLayer) {
			this.setExceptElements(mainLayer);
		}
	},
	setExceptElements: function(mainLayer) {
		var temp = [];
		var exceptItems = daum.$$(this.hideElementQuery, mainLayer);
		
		for(var i = this.needHideElements.length; i--;) {
			var isExist = false;
			
			for(var j = exceptItems.length; j--;) {
				if(this.needHideElements[i] === exceptItems[j]) {
					isExist = true;
				}
			}
			
			if(!isExist) {
				temp.push(this.needHideElements[i]);
			}
		}
		this.needHideElements = temp;
	},
	centeringMainLayer: function() {
		var winSize = daum.Browser.getWindowSize();
		var checkHorizon = this.horizonCenter(winSize.width, this.layer.offsetWidth);
		var checkVertical = this.verticalCenter(winSize.height, this.layer.offsetHeight);
		var position = (checkHorizon && checkVertical) ? "fixed" : "absolute";
		this.changeMainLayerPosition(position);
	},
	horizonCenter: function(winWidth, layerWidth) {
		var left = 0;
		var isLayerLargerThanWindow = true;
		
		if(winWidth >= layerWidth) {
			left = (winWidth - layerWidth) / 2;
		} else {
			isLayerLargerThanWindow = false;
		}
		daum.Element.setLeft(this.layer, left);
		
		return isLayerLargerThanWindow;
	},
	verticalCenter: function(winHeight, layerHeight) {
		var top = 0;
		var isLayerLargerThanWindow = true;
		
		if(winHeight >= layerHeight) {
			top = (winHeight - layerHeight) / 2;
		} else {
			isLayerLargerThanWindow = false;
		}
		
		if((isLayerLargerThanWindow && (this.isAbsoluteLayer || !this.useFixed)) || (!isLayerLargerThanWindow && !this.isAbsoluteLayer)) {
			top += daum.Browser.getScrollOffsets().top;
		}
		daum.Element.setTop(this.layer, top);
		
		return isLayerLargerThanWindow;
	},
	changeMainLayerPosition: function(position) {
		if(!this.isAbsoluteLayer && daum.Element.getStyle(this.layer, "position") !== position) {
			this.layer.style.position = position;
		}
	},
	setStylePositionType: function(layer) {
		if(this.isAbsoluteLayer) {
			layer.style.position = "absolute";
		} else {
			if(!this.useFixed && layer !== this.darkLayer) {
				layer.style.position = "absolute";
			} else {
				layer.style.position = "fixed";
			}
		}
	},
	executeTask: function() {
		this.showLayer(this.suspendTaskLayer);			
	},
	resizingEventHandler: function() {
		this.centeringMainLayer();
		
		if(this.isAbsoluteLayer && this.useDarkLayer) {
			this.resetDarkLayerSize();
		}
	},
	scrollingEventHandler: function() {
		var winHeight = daum.Browser.getWindowSize().height;
		var layerHeight = this.layer.offsetHeight;
		this.verticalCenter(winHeight, layerHeight);
		
		if(this.isAbsoluteLayer && this.useDarkLayer) {
			this.resetDarkLayerSize();
		}
	},
	keyEventHandler: function(ev) {
		if(ev.keyCode == 27) {
			this.hide();
		}
	},
	resetDarkLayerSize: function() {
		var width = document.body.scrollWidth;
		var height = document.body.scrollHeight;
		
		if(this.darkLayer.offsetWidth !== width) {
			daum.Element.setWidth(this.darkLayer, width);	
		}
		
		if(this.darkLayer.offsetHeight !== height) {
			daum.Element.setHeight(this.darkLayer, height);
		}
	},
	showOtherElements: function() {
		for(var i = this.needHideElements.length; i--;) {
			this.needHideElements[i].style.visibility = "visible";
		}
	},
	hideOtherElements: function() {
		for(var i = this.needHideElements.length; i--;) {
			this.needHideElements[i].style.visibility = "hidden";				
		}
	},
	getLayers: function() {
		return {
			darkLayer: this.darkLayer,
			mainLayer: this.layer
		};
	}
};
fancafeDonationAjax = {
	init: function(option) {
		this.MESSAGE_POLLING_TIME = option.MESSAGE_POLLING_TIME;
		this.parentElement = option.wrapElement;
		this.wrapElement = option.wrapElement;
		this.ajaxUrl = option.url;
		this.deleteFunc = option.deleteFunc;
		this.TimerId = 0;
		this.ajaxOptions = {
				onsuccess: this.resposneAjax.bind(this, this.wrapElement, option.createFunc),
				onfailure: this.deleteFunc.bind(this, this.wrapElement)
		};
		this.initEvent();
		this.ajaxCall(this.ajaxUrl, this.ajaxOptions);				
	},
	initEvent: function() {
		this.TimerId = daum.Function.interval(this.ajaxCall.bind(this, this.ajaxUrl, this.ajaxOptions),this.MESSAGE_POLLING_TIME);
	},
	ajaxCall: function(url, options ) {
		new daum.Ajax(	).request(url, options);  
	},
	getObjectFromXmlHttp: function(xmlHttp){
		var ct = xmlHttp.getResponseHeader("content-type");
		var xmlDoc;
		if(ct && ct.indexOf("xml") >= 0){
			xmlDoc = xmlHttp.responseXML;
			return (xmlDoc != null) ? daum.xmlToObject(xmlDoc) : null;
		} else if(ct && ct.indexOf("text/html") >= 0){
			xmlDoc = xmlHttp.responseText;	
			return xmlDoc;
		}
		return null;
	},
	resposneAjax: function(wrapElement, createFunc, xmlHttp){
		var object = this.getObjectFromXmlHttp(xmlHttp);
		if(object != ""){
			if(wrapElement == this.rankWrap){
				createFunc(object);
			} else {
				wrapElement.innerHTML = createFunc(object);
			}
		}
		if(object == "" || wrapElement.innerHTML == ""){
			this.deleteFunc(wrapElement);
		}
	}
}
	