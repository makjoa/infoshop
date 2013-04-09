<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
<script type="text/javascript">

    var count = 0;
    var result = "";
    var socket = io.connect('http://makjoa.iptime.org:8001/');

    var addCount = function(object) {
		count++;
		result += object;
		console.log(object);
	    var $newCount = $(	    		        
	        '<div class="stream-item">'
	            + '<div class="new-tweets-bar js-new-tweets-bar" data-item-count="'+object.resultData.dataNum+'" onClick="javscript:addNews();">'
	                + '새 글' +count+' 개'
	            + '</div>'
	        + '</div>'
	    );	   
	    $('ol.stream-items').before($newCount);

	    $newCount.hide();
	    $newCount.fadeIn();
	    console.log(socket);
	    if(socket != null) {
	    
	        socket.send('message',{

	            type : "",
	            name : object.resultData.name,
	            subject : object.resultData.subject,	           
	            content : object.resultData.content

	        });
	        socket.on('message',function(data){


	        });
	    }
	};
	
	var hideNews = function(id) {
	    $('#bbs-article-comment-' + id + ' a').attr('href', '#');
	    $('#bbs-article-comment-' + id).fadeOut();
	};
	
	var removeNews= function(id) {
	    $('#bbs-article-comment-' + id + ' a').attr('href', '#');
	    $.post('${pageContext.request.contextPath}/bbs/comment/' + id + '/delete', {}, function(data) {
	        if (data === true) {
	            hideNews(id);
	        }
	    }, 'json');
	};
function addNews() {
	console.log(result);
	$('div.stream-item').remove();
        var $newNews = $(                       
                '<li class="js-stream-item stream-item stream-item expanding-stream-item" data-item-id="304775453590294528" id="stream-item-tweet-304775453590294528" data-item-type="tweet">'
                +'  <div class="expansion-container js-expansion-container" style="height: auto;">'
                +'      <div class="tweet original-tweet js-stream-tweet js-actionable-tweet js-profile-popup-actionable js-original-tweet with-social-proof">'
                +'          <div class="content">'
                +'              <div class="stream-item-header">'
                +'                  <small class="time">'
                +'                  <a href="" class="tweet-timestamp js-permalink js-nav" title="오전 11:11 - 2013년 2월 22일"><span class="_timestamp js-short-timestamp js-relative-timestamp" data-time="1361499105" data-long-form="true">2시간</span></a>'
                +'                  </small>'
                +'                  <a class="account-group js-account-group js-action-profile js-user-profile-link js-nav" href="#" data-user-id="791556422">'
                +'                  <img class="avatar js-action-profile-avatar" src="" alt="애니팡 for Kakao">'
                +'                  <strong class="fullname js-action-profile-name show-popup-with-id">${news.subject}</strong>'
                +'                  <span>?</span>'
                +'                  </a>'
                +'              </div>'
                +'              <p class="js-tweet-text">'                
                +'              </p>'
                +'              <div class="stream-item-footer">'
                +'                  <div class="context">'
                +'                  </div>'
                +'                  <a class="details with-icn js-details" href="">'
                +'                  <span class="details-icon js-icon-container">'
                +'                  </span>'
                +'                  <b>'
                +'                  <span class="expand-stream-item js-view-details">'
                +'                  <span class="expand-action-wrapper">'
                +'                  펼치기 </span>'
                +'                  </span>'
                +'                  </b>'
                +'                  </a>'
                +'              </div>'
                +'              <div class="expanded-content js-tweet-details-dropdown">'
                +'                              <div class="reply">'
                +'                                                  <img alt="Re" src="http://www.newsmate.kr/assets/re-28810bc7c398f8f28c600f0d22b4dfdd.png">'
                +'                                  <span style="font-size: 12px;"><a href="/articles/3602611">댓글</a></span>'
                +'                                  <fb:comments-count href="http://www.newsmate.kr/articles/3602611" fb-xfbml-state="rendered" class=" fb_comments_count_zero">'
                +'                                  <span class="fb_comments_count">0</span></fb:comments-count>'
                +'                              </div>'
                +'              </div>'
                +'          </div>'
                +'      </div>'
                +'  </div>'
                +'</li>'
            );     
        $('ol.stream-items li').first().before($newNews);
        $newNews.hide();
        $newNews.fadeIn();
}	
</script>

            <section>
                <div id="page-outer" class="main_container">                 
                    <div id="page-container" class="wrapper wrapper-profile white">
						<div class="content-top">
						    <div class="module">
						        <div class="flex-module profile-summary js-profile-summary">
						            <h2 class="js-timeline-title">뉴스</h2>
						        </div>
						    </div>
						</div>
						<!-- 
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
						 -->
                        <div class="content-right">
                            <div class="module">
								<div class="flex-module">
								    <div class="flex-module-header">
								        <h3>컨텐츠</h3>
								    </div>								
	                                <div class="stream-container">
									    <div class="stream home-stream">
									       <ul class="js-nav-links">
										        <li class="media-thumbnails top-videos media-videos hidden last-item" style="display: list-item;">
											        <div class="list-link">
														<div class="media-row">
														    <div class="media-row-content photo-list">
														        <a data-status-id="315381454987210752" data-url="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS9qUk5NdDl3ektFRS9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=uKfiwWkaDxiUS50m2FPgvtJoG_XoI7MGztW31WFyjFo" data-resolved-url-thumb="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS9qUk5NdDl3ektFRS9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=uKfiwWkaDxiUS50m2FPgvtJoG_XoI7MGztW31WFyjFo" data-resolved-url-small="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS9qUk5NdDl3ektFRS9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=uKfiwWkaDxiUS50m2FPgvtJoG_XoI7MGztW31WFyjFo" data-resolved-url-large="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS9qUk5NdDl3ektFRS9tYXhyZXNkZWZhdWx0LmpwZxQEFgASAA&amp;s=01Z-xQeM0HTevw4dIQozDaKUvB3rjZQ71ruW-uXeBDk" data-source-url="https://www.youtube.com/embed/jRNMt9wzKEE" data-height="244" data-width="435" class="media-thumbnail video" data-load-status="loaded">
														            <button type="button" class="icon play"><span class="visuallyhidden">재생</span></button><img src="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS9qUk5NdDl3ektFRS9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=uKfiwWkaDxiUS50m2FPgvtJoG_XoI7MGztW31WFyjFo" style="position: absolute; height: 66px; width: 117.66393442622952px; left: -25.83196721311476px; top: 0px;">
														        </a>
														        <a data-status-id="315378084213841920" data-url="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kyLnl0aW1nLmNvbS92aS9Jd1lTVVZmOFR2cy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=dWbSHaaM1TntYJOkFkdbXXdGNwMK2ZClsWX-zFg6H6w" data-resolved-url-thumb="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kyLnl0aW1nLmNvbS92aS9Jd1lTVVZmOFR2cy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=dWbSHaaM1TntYJOkFkdbXXdGNwMK2ZClsWX-zFg6H6w" data-resolved-url-small="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kyLnl0aW1nLmNvbS92aS9Jd1lTVVZmOFR2cy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=dWbSHaaM1TntYJOkFkdbXXdGNwMK2ZClsWX-zFg6H6w" data-resolved-url-large="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kyLnl0aW1nLmNvbS92aS9Jd1lTVVZmOFR2cy9tYXhyZXNkZWZhdWx0LmpwZxQEFgASAA&amp;s=Dxk4GEhHed-EMF7Zfu5Cvd4V9nwRLS-E_rjjcvwGmFc" data-source-url="https://www.youtube.com/embed/IwYSUVf8Tvs" data-height="244" data-width="435" class="media-thumbnail video" data-load-status="loaded">
														            <button type="button" class="icon play"><span class="visuallyhidden">재생</span></button><img src="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kyLnl0aW1nLmNvbS92aS9Jd1lTVVZmOFR2cy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=dWbSHaaM1TntYJOkFkdbXXdGNwMK2ZClsWX-zFg6H6w" style="position: absolute; height: 66px; width: 117.66393442622952px; left: -25.83196721311476px; top: 0px;">
				                                                </a>
														        <a data-status-id="315297862890172417" data-url="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS96ZTBKZHZVVV94Zy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=RgHcNlS2e0vu8-JDZDy1p5mRmDIYK1hwPzjAMJgj3HQ" data-resolved-url-thumb="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS96ZTBKZHZVVV94Zy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=RgHcNlS2e0vu8-JDZDy1p5mRmDIYK1hwPzjAMJgj3HQ" data-resolved-url-small="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS96ZTBKZHZVVV94Zy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=RgHcNlS2e0vu8-JDZDy1p5mRmDIYK1hwPzjAMJgj3HQ" data-resolved-url-large="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS96ZTBKZHZVVV94Zy9tYXhyZXNkZWZhdWx0LmpwZxQEFgASAA&amp;s=0fgwE4VAKsQKcvtVT0kM5EzxT16uFVfgbwG_vHmHhLE" data-source-url="https://www.youtube.com/embed/ze0JdvUU_xg" data-height="244" data-width="435" class="media-thumbnail video" data-load-status="loaded">
														            <button type="button" class="icon play"><span class="visuallyhidden">재생</span></button><img src="https://o.twimg.com/1/proxy.jpg?t=FQQVBBg0aHR0cDovL2kzLnl0aW1nLmNvbS92aS96ZTBKZHZVVV94Zy9tYXhyZXNkZWZhdWx0LmpwZxQCFgASAA&amp;s=RgHcNlS2e0vu8-JDZDy1p5mRmDIYK1hwPzjAMJgj3HQ" style="position: absolute; height: 66px; width: 117.66393442622952px; left: -25.83196721311476px; top: 0px;">
				                                                </a>
														        <a data-status-id="315148093538578433" data-url="https://o.twimg.com/1/proxy.jpg?t=FQQVBBgwaHR0cDovL2kzLnl0aW1nLmNvbS92aS96SU1kQks4eXJfZy9tcWRlZmF1bHQuanBnFAIWABIA&amp;s=1j0dn5nHO0pofVhuvLAY80W6au4sKr8HM3mMk-XFaGw" data-resolved-url-thumb="https://o.twimg.com/1/proxy.jpg?t=FQQVBBgwaHR0cDovL2kzLnl0aW1nLmNvbS92aS96SU1kQks4eXJfZy9tcWRlZmF1bHQuanBnFAIWABIA&amp;s=1j0dn5nHO0pofVhuvLAY80W6au4sKr8HM3mMk-XFaGw" data-resolved-url-small="https://o.twimg.com/1/proxy.jpg?t=FQQVBBgwaHR0cDovL2kzLnl0aW1nLmNvbS92aS96SU1kQks4eXJfZy9tcWRlZmF1bHQuanBnFAIWABIA&amp;s=1j0dn5nHO0pofVhuvLAY80W6au4sKr8HM3mMk-XFaGw" data-resolved-url-large="https://o.twimg.com/1/proxy.jpg?t=FQQVBBgwaHR0cDovL2kzLnl0aW1nLmNvbS92aS96SU1kQks4eXJfZy9tcWRlZmF1bHQuanBnFAQWABIA&amp;s=Lb_Hs6uIREsLOhFe-7KtgfPCxt5bJzSQfxf1vastKJU" data-source-url="https://www.youtube.com/embed/zIMdBK8yr_g" data-height="326" data-width="435" class="media-thumbnail video" data-load-status="loaded">
														            <button type="button" class="icon play"><span class="visuallyhidden">재생</span></button><img src="https://o.twimg.com/1/proxy.jpg?t=FQQVBBgwaHR0cDovL2kzLnl0aW1nLmNvbS92aS96SU1kQks4eXJfZy9tcWRlZmF1bHQuanBnFAIWABIA&amp;s=1j0dn5nHO0pofVhuvLAY80W6au4sKr8HM3mMk-XFaGw" style="position: absolute; height: 66px; width: 117.33333333333333px; left: -25.666666666666664px; top: 0px;">
				                                                </a>
														        <span class="thumbnail-placeholder first"></span>
														    </div>
														</div>
													</div>
												</li>
	                                       </ul>
									    </div>
	                                </div>
                                </div>
                            </div>
							<div class="module wtf-module js-wtf-module has-content">
							    <div class="flex-module">
							        <div class="flex-module-header">
							            <h3>인기선수</h3>
							            <small>· <a class="js-refresh-suggestions" href="javascript:add();">새로고침</a></small>
							            <small class="view-all">· <a class="js-view-all-link" href="/who_to_follow/suggestions" data-element-term="view_all_link">모두 보기</a></small>
							        </div>
							        <div class="js-recommended-followers dashboard-user-recommendations flex-module-inner" data-section-id="wtf" style="opacity: 1;">
							            <div class="js-account-summary account-summary js-actionable-user " data-user-id="448977819" data-feedback-token="110">
							                <div class="dismiss js-action-dismiss">
							                    <i class="close"></i>
							                </div>
							                <div class="content">
							                    <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/BlizzardCSEU_PT" data-user-id="448977819">
							                    <img class="avatar js-action-profile-avatar " src="https://si0.twimg.com/profile_images/2585919412/image_normal.jpg" alt="BlizzardCSEU_PT">
							                    <span class="account-group-inner js-action-profile-name" data-user-id="448977819">
							                    <b class="fullname">Wayne Rooney</b>
							                    <span>‏</span>
							                    <span class="username"><s>@</s><span class="js-username">WayneRooney</span></span>
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
							                    <img class="avatar js-action-profile-avatar " src="https://si0.twimg.com/profile_images/3304252295/b2f1d63d3dcdca40af1795fe692b12e7_normal.jpeg" alt="쉬즈엠디">
							                    <span class="account-group-inner js-action-profile-name" data-user-id="107021530">
							                    <b class="fullname">Ji Sung Park</b>
							                    <span>‏</span>
							                    <span class="username"><s>@</s><span class="js-username">RealParkJiSung</span></span>
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
							            <div class="js-account-summary account-summary js-actionable-user " data-user-id="107021530" data-feedback-token="109">
							                <div class="dismiss js-action-dismiss">
							                    <i class="close"></i>
							                </div>
							                <div class="content">
							                    <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/ShesMD" data-user-id="107021530">
							                    <img class="avatar js-action-profile-avatar " src="http://img2.esfoo.com/fm2011/faces2/5708178.jpg" alt="쉬즈엠디">
							                    <span class="account-group-inner js-action-profile-name" data-user-id="107021530">
							                    <b class="fullname">Chu Young Park</b>
							                    <span>‏</span>
							                    <span class="username"><s>@</s><span class="js-username">Chu Young Park</span></span>
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
                            <div class="module wtf-module js-wtf-module has-content">
                                <div class="flex-module">
                                    <div class="flex-module-header">
                                        <h3>인기클럽</h3>
                                        <small>· <a class="js-refresh-suggestions" href="javascript:add();">새로고침</a></small>
                                        <small class="view-all">· <a class="js-view-all-link" href="/who_to_follow/suggestions" data-element-term="view_all_link">모두 보기</a></small>
                                    </div>
                                    <div class="js-recommended-followers dashboard-user-recommendations flex-module-inner" data-section-id="wtf" style="opacity: 1;">
                                        <div class="js-account-summary account-summary js-actionable-user " data-user-id="448977819" data-feedback-token="110">
                                            <div class="dismiss js-action-dismiss">
                                                <i class="close"></i>
                                            </div>
                                            <div class="content">
                                                <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/BlizzardCSEU_PT" data-user-id="448977819">
                                                <img class="avatar js-action-profile-avatar " src="http://img2.esfoo.com/fm2011/clubs_large2/680.jpg" alt="BlizzardCSEU_PT">
                                                <span class="account-group-inner js-action-profile-name" data-user-id="448977819">
                                                <b class="fullname">Wayne Rooney</b>
                                                <span>‏</span>
                                                <span class="username"><s>@</s><span class="js-username">WayneRooney</span></span>
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
                                                <img class="avatar js-action-profile-avatar " src="http://img2.esfoo.com/fm2011/clubs_large2/1708.jpg" alt="쉬즈엠디">
                                                <span class="account-group-inner js-action-profile-name" data-user-id="107021530">
                                                <b class="fullname">Ji Sung Park</b>
                                                <span>‏</span>
                                                <span class="username"><s>@</s><span class="js-username">RealParkJiSung</span></span>
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
                                        <div class="js-account-summary account-summary js-actionable-user " data-user-id="107021530" data-feedback-token="109">
                                            <div class="dismiss js-action-dismiss">
                                                <i class="close"></i>
                                            </div>
                                            <div class="content">
                                                <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="/ShesMD" data-user-id="107021530">
                                                <img class="avatar js-action-profile-avatar " src="http://img2.esfoo.com/fm2011/clubs_large2/1736.jpg" alt="쉬즈엠디">
                                                <span class="account-group-inner js-action-profile-name" data-user-id="107021530">
                                                <b class="fullname">Chu Young Park</b>
                                                <span>‏</span>
                                                <span class="username"><s>@</s><span class="js-username">Chu Young Park</span></span>
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
						            <h3 class="js-timeline-title">최신뉴스</h3>
						        </div>
						    </div>
						    <div class="stream-container " data-max-id="302023254317608959" data-since-id="304214130078916608">
						        <div class="stream home-stream">
                                    <c:set var="newsList" value="${getNewsList}" />
						            <ol class="stream-items" id="stream-items-id" data-item-count="${fn:length(newsList)}">
                                        <c:set var="doneLoop" value="false"/> 
                                        <c:forEach var="news" items="${newsList}" varStatus="status">
                                        <c:if test="${not doneLoop}"> 
						                <li class="js-stream-item stream-item stream-item expanding-stream-item" data-item-id="304775453590294528" id="stream-item-tweet-304775453590294528" data-item-type="tweet">
							                <div class="expansion-container js-expansion-container" style="height: auto;">
							                    <div class="tweet original-tweet js-stream-tweet js-actionable-tweet js-profile-popup-actionable js-original-tweet with-social-proof">
							                        <div class="content">
							                            <div class="stream-item-header">
							                                <small class="time">
							                                <a href="" class="tweet-timestamp js-permalink js-nav" title="오전 11:11 - 2013년 2월 22일"><span class="_timestamp js-short-timestamp js-relative-timestamp" data-time="1361499105" data-long-form="true">2시간</span></a>
							                                </small>
							                                <a class="account-group js-account-group js-action-profile js-user-profile-link js-nav" href="#" data-user-id="791556422">
							                                <img class="avatar js-action-profile-avatar" src="" alt="애니팡 for Kakao">
							                                <strong class="fullname js-action-profile-name show-popup-with-id">${news.subject}</strong>
							                                <span>‏</span>
							                                </a>
							                            </div>
							                            <p class="js-tweet-text">
							                                 
							                            </p>
							                            <div class="stream-item-footer">
							                                <div class="context">
							                                </div>
							                                <a class="details with-icn js-details" href="">
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
															<div class="reply">
                                                                <img alt="Re" src="http://www.newsmate.kr/assets/re-28810bc7c398f8f28c600f0d22b4dfdd.png">
															    <span style="font-size: 12px;"><a href="/articles/3602611">댓글</a></span>
															    <fb:comments-count href="http://www.newsmate.kr/articles/3602611" fb-xfbml-state="rendered" class=" fb_comments_count_zero">
																<span class="fb_comments_count">0</span></fb:comments-count>
															</div>
							                            </div>
							                        </div>
							                    </div>
							                </div>
						                </li>						                
                                        <c:if test="${status.count == 10}">
    		                            <c:set var="doneLoop" value="true"/>
		                                </c:if>
		                                </c:if>
						                </c:forEach>					                
						            </ol>
                                    <script type="text/javascript">
                                    RealtimeWebClient.join('${m_id}', '${m_id}');
                                    RealtimeWebClient.setHandler('${m_id}', '${m_id}', 'new', addCount);
                                    RealtimeWebClient.setHandler('${m_id}', '${m_id}', 'remove', hideNews);
                                    </script>       
						            <div class="stream-footer" style="">
						                <div class="timeline-end has-items">
						                    <div class="stream-end">
						                        <div class="stream-end-inner" id="testDIV">
						                         <a class="btn primary-btn tweet-action" type="button" href="info/form">더보기</a>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
						    <div class="flex-module profile-summary js-profile-summary">
						    </div>
						</div>
						<!--  -->
                        <jsp:directive.include file="../include/footer.jspf"/>
                    </div>
                </div>
            </section>      
        </div>
    </body>
</html>
