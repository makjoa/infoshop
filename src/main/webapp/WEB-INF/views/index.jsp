<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:directive.include file="include/includes.jspf"/>
<jsp:directive.include file="include/header.jspf"/>
<SCRIPT>
function add() {
var tableObj = [{"TABLE1":[{"col1":"하하하하","col2":"ssss"},{"col1":"호호호","col2":"xxxxx"}] ,"TABLE2":[{"col1":"강감찬","col2":"dfdfd"},{"col1":"이순신","col2":"dfdfd"}]}];
var targetId =  "testDIV";

if(tableObj != undefined) { 

	var resultData = "";
	
	$.each(tableObj[0], function(key, value) {

		resultData += "<TABLE id="+key+">\n";
		
		for(var i = 0; i < value.length; i++) {
			resultData += "<tr>\n";
			
			$.each(value[i], function(subKey, subValue) {
				resultData += "<td>" +subValue + "</td>\n";				
			});
			
			resultData += "</tr>\n";
		}
	});	
	
	$("#" + targetId).html(resultData);
}

}
/* 	var tableName = "TABLE"+i;	
	var tableData   = '<table id="'+tableObj.tableName+'">';	
	var resultData   = '<table id="'+tableObj.tableName+'">';	
		for(var j = 0; j < tableObj.[TABLE[i]].length; j++) {
			resultData += "<tr><td>'+tableObj.[TABLE[i].col1+'</td><td>'+tableObj.[TABLE[i].col2+'</td></tr>";		
		}
	}
	
	$("#" + targetId).html(resultData);  */

</SCRIPT>
      <div id="page-outer" class="main_container">                 
        <div id="page-container" class="wrapper wrapper-profile white">
          <div class="content-top">            
            <div class="module">
              <div class="flex-module profile-summary js-profile-summary">
                <h2 class="js-timeline-title">메인</h2>
              </div>
            </div>
          </div>
          <div class="content-small">            
            <div class="module">
              <div class="flex-module profile-summary js-profile-summary">
                <h3 class="js-timeline-title">일정</h3>
              </div>
            </div>
          </div>
          <div class="content-center">            
            <div class="module">
              <div class="flex-module profile-summary js-profile-summary">
                <h3 class="js-timeline-title">기록</h3>
              </div>
            </div>
          </div>
          <div class="content-right">
            <div style="height: auto;;">
	            <div class="content-header">
	              <div class="header-inner">                
	                <ul class="nav js-global-actions" id="global-actions">
	                  <li id="global-nav-home" class="home" data-global-action="home">
	                    <h3 class="js-timeline-title">리그순위표</h3>
		                </li>
	                </ul>
					<div class="pull-right">
					  <ul class="">
					    <li class="me dropdown session js-session" data-global-action="t1me" id="user-dropdown">
					    <a class="dropdown-toggle js-dropdown-toggle" href="#" id="user-dropdown-toggle" data-toggle="dropdown">
					    <span class="caret"></span>
					    </a>
					    <ul class="dropdown-menu">
					      <li class="dropdown-caret">
					      <span class="caret-outer"></span>
					      <span class="caret-inner"></span>
					      </li>
					      <li class="current-user" data-name="profile">
					      <a href="/settings/profile" class="account-summary account-summary-small" data-nav="edit_profile">
					      <div class="content">
					        <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
					          <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
					          <b class="fullname">최중섭</b>
					          <small class="metadata">프로필 수정하기 </small>
					        </div>
					      </div>
					      </a></li>
					      <li class="dropdown-divider"></li>
					      <li class="messages" data-name="messages">
					      <a class="js-dm-dialog" href="/#!/" data-nav="messages">
					      <span class="js-direct-message-count count"></span>
					      쪽지 </a>
					      </li>
					      <li data-name="lists"><a href="/mouse208/lists" data-nav="all_lists">리스트</a></li>
					    </ul>
					    </li>
					  </ul>
					</div>		              
	              </div>                           
	            </div>	            
	            <div class="stream-container">
	              <div class="stream home-stream">
	                <table class="tbl main_season_kl">
	                  <thead>
				          <tr>
				            <th class="rank">순위</th>
				            <th class="team">팀</th>
				            <th class="game_qty"><a href="?col=GAME_QTY">경기</a></th>
				            <th class="gain_point"><a href="?col=GAIN_POINT">승점</a></th>
				          </tr>
				          </thead>
				          <tbody>					
				            <tr class="first">
				              <td class="rank">1</td>
				              <td class="team"><a href="tinf_main.daum?team_id=246"><img src="http://i1.daumcdn.net/img-section/sports09/logo/team/epl/1_2018.gif" width="20" height="18" alt=""> 맨유</a> </td>
				              <td class="game_qty">26</td>
				              <td class="gain_point">65</td>
				            </tr>
	                  </tbody>                  
	                </table>
	                <div class="stream-footer " style="">
	                 <div class="timeline-end has-items">
	                   <div class="stream-end">
	                     <div class="stream-end-inner">
	                     </div>
	                   </div>                    
	                 </div>
	                </div>	               
	              </div>
	            </div>
            </div>
              <div class="module wtf-module js-wtf-module has-content">
              <div class="flex-module">
                <div class="flex-module-header">
                  <h3>팔로우 추천</h3>
                  <small>· <a class="js-refresh-suggestions" href="javascript:add();">새로고침</a></small>
                  <small class="view-all">· <a class="js-view-all-link" href="/who_to_follow/suggestions" data-element-term="view_all_link">모두 보기</a></small>
                </div>
                <div class="js-recommended-followers dashboard-user-recommendations flex-module-inner" data-section-id="wtf" style="opacity: 1;">
                  <div class="js-account-summary account-summary js-actionable-user " data-user-id="331908924" data-feedback-token="110">
                    <div class="dismiss js-action-dismiss">
                      <i class="close"></i>
                    </div>
                    <div class="content">
                      <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/BlizzCon" data-user-id="331908924">
                      <img class="avatar js-action-profile-avatar " src="https://si0.twimg.com/profile_images/1515030164/icon_normal.gif" alt="BlizzCon">
                      <span class="account-group-inner js-action-profile-name" data-user-id="331908924">
                      <b class="fullname">BlizzCon</b>
                      <span>‏</span>
                      <span class="username"><s>@</s><span class="js-username">BlizzCon</span></span>
                      </span>
                      </a>
                      <small class="metadata social-context">
                      </small>
                      <span class="user-actions not-following" data-user-id="331908924">
                      <a href="#" class="follow-link">
                      <span class="link-text follow-text">팔로우</span>
                      </a>
                      </span>
                    </div>
                  </div>
                  <div class="js-account-summary account-summary js-actionable-user " data-user-id="448977819" data-feedback-token="110">
                    <div class="dismiss js-action-dismiss">
                      <i class="close"></i>
                    </div>
                    <div class="content">
                      <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/BlizzardCSEU_PT" data-user-id="448977819">
                      <img class="avatar js-action-profile-avatar " src="https://si0.twimg.com/profile_images/1719734012/BlizzLogo_reasonably_small_reasonably_small_normal.jpg" alt="BlizzardCSEU_PT">
                      <span class="account-group-inner js-action-profile-name" data-user-id="448977819">
                      <b class="fullname">BlizzardCSEU_PT</b>
                      <span>‏</span>
                      <span class="username"><s>@</s><span class="js-username">BlizzardCSEU_PT</span></span>
                      </span>
                      </a>
                      <small class="metadata social-context">
                      <a class="pretty-link user-profile-link js-user-profile-link" data-user-id="174315652" href="/BlizzardCS_KR" title="블리자드 고객지원"><b>블리자드 고객지원</b></a> 님 외 <a href="/BlizzardCSEU_PT/followers_you_follow" class="pretty-link"><b>다수</b></a>가 팔로우함 </small>
                      <span class="user-actions not-following" data-user-id="448977819">
                      <a href="#" class="follow-link">
                      <span class="link-text follow-text">팔로우</span>
                      </a>
                      </span>
                    </div>
                  </div>
                  <div class="js-account-summary account-summary js-actionable-user " data-user-id="107021530" data-feedback-token="109">
                    <div class="dismiss js-action-dismiss">
                      <i class="close"></i>
                    </div>
                    <div class="content">
                      <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/ShesMD" data-user-id="107021530">
                      <img class="avatar js-action-profile-avatar " src="https://si0.twimg.com/profile_images/2061851127/____DSC_3899_normal.jpg" alt="쉬즈엠디">
                      <span class="account-group-inner js-action-profile-name" data-user-id="107021530">
                      <b class="fullname">쉬즈엠디</b>
                      <span>‏</span>
                      <span class="username"><s>@</s><span class="js-username">ShesMD</span></span>
                      </span>
                      </a>
                      <small class="metadata social-context">
                      </small>
                      <span class="user-actions not-following" data-user-id="107021530">
                      <a href="#" class="follow-link">
                      <span class="link-text follow-text">팔로우</span>
                      </a>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="flex-module-footer">
                  <a href="/who_to_follow/interests" class="js-interests-link" data-element-term="interests_link">주제별로 찾기</a> · <a href="/who_to_follow/import" class="js-find-friends-link" data-element-term="import_link">친구 찾기</a>
                </div>
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
        <jsp:directive.include file="include/footer.jspf"/>
        </div>
      </div>
    </div>
</body>
</html>
