<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
<script>

function create(datanum) {
	$("#tpl_body").html("");
	var tpl = $("#tpl_prog"+datanum).html();
	
	$("#tpl_body").html(tpl);
}

</script>


      <div id="page-outer" class="main_container">                 
        <div id="page-container" class="wrapper wrapper-profile white">
          <div class="content-top">
            <div class="module">
              <div class="flex-module profile-summary js-profile-summary">
                <h2 class="js-timeline-title">전술</h2>
              </div>
            </div>
          </div>
          <div class="content-custom js-timeline-from-cache" id="timeline">
            <div class="content-header">
              <div class="header-inner">
                <h2 class="js-timeline-title">최신정보</h2>
              </div>
            </div>
            <div class="stream-container " data-max-id="302023254317608959" data-since-id="304214130078916608">
              <div class="stream home-stream">
                <ol class="stream-items" id="stream-items-id" data-item-count="2">
                    <li class="js-stream-item stream-item stream-item expanding-stream-item" data-item-id="304775453590294528" id="stream-item-tweet-304775453590294528" data-item-type="tweet" style="margin-top: 0px; margin-bottom: 0px;">
                    <div class="expansion-container js-expansion-container" style="height: auto;">
                    <div class="tweet original-tweet js-stream-tweet js-actionable-tweet js-profile-popup-actionable js-original-tweet with-social-proof">                                    
                      <div class="content">
                        <div class="stream-item-header">
                          <small class="time">
                          <a href="/anipangkakao/status/304775453590294528" class="tweet-timestamp js-permalink js-nav" title="오전 11:11 - 2013년 2월 22일"><span class="_timestamp js-short-timestamp js-relative-timestamp" data-time="1361499105" data-long-form="true">2시간</span></a>
                          </small>
                          <a class="account-group js-account-group js-action-profile js-user-profile-link js-nav" href="#" data-user-id="791556422">
                          <img class="avatar js-action-profile-avatar" src="https://si0.twimg.com/profile_images/2985646591/86cba3066a69ec55e14c66b662ed3a43_normal.png" alt="애니팡 for Kakao">
                          <strong class="fullname js-action-profile-name show-popup-with-id">애니팡 for Kakao</strong>
                          <span>‏</span><span class="username js-action-profile-name"><s>@</s><b>anipangkakao</b></span>
                          </a>
                        </div>
                        <p class="js-tweet-text">
                          2013.02.21 21:06부터 약 50분간 애니팡 서버 문제로 인해 접속하지 못하는 현상이 있었습니다. 현재는 수정되어 정상적으로 접속하실 수 있습니다. 불편드려 정말 죄송합니다.
                        </p>
                        <div class="stream-item-footer">
                          <div class="context">
                          </div>
                          <a class="details with-icn js-details" href="/anipangkakao/status/304775453590294528">
                          <span class="details-icon js-icon-container">
                          </span>
                          <b>
                          <span class="expand-stream-item js-view-details">
                          <span class="expand-action-wrapper">
                          펼치기 </span>
                          </span>
                          </b>
                          </a>                                        
                        </div>
                        <div class="expanded-content js-tweet-details-dropdown">
                        </div>
                      </div>
                    </div>
                    </div>
                    </li>
                </ol>
                <div class="stream-footer " style="">
                  <div class="timeline-end has-items">
                    <div class="stream-end">
                      <div class="stream-end-inner" id="testDIV">
                      </div>
                    </div>                                  
                  </div>
                </div>                
              </div>
            </div>
            <div class="flex-module profile-summary js-profile-summary">
            </div>         
          </div>
 
        
        <jsp:directive.include file="../include/footer.jspf"/>
        
        </div>
      </div>
    </div>
</body>
</html>
