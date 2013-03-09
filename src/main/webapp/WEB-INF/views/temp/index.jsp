<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

          <div id="page-outer" class="main_container">
              <!-- 컨텐츠 시작 -->   
              <div id="content-inner" class="wrapper wrapper-profile white">
                <div id="page-container">        
                  <div id="panel-top" style="display: none;">
                    <div class="section">
                      <p class="message">
                        <a href="https://dev.twitter.com/start">Getting Started</a> with the Twitter Platform is easy. Jump right into the <a href="/docs/api">API resource documentation</a>, explore the <a href="https://dev.twitter.com/console">developer console</a>, or <a href="/apps">manage your apps</a>. Have a question? Read the <a href="https://dev.twitter.com/docs/faq">FAQ</a>. Don't know what to build? Check out our <a href="https://dev.twitter.com/case-studies">Case Studies</a>.
                      </p>
                    </div>
                    <div class="panel-region-separator">
                    </div>
                    <div class="section">
                      <div class="view platform-objects pocket">
                        <div class="header">
                          <h2><a href="/docs/platform-objects">A field guide to Twitter Platform objects</a></h2>
                        </div>
                        <div class="content">
                          <a href="https://dev.twitter.com/docs/platform-objects/tweets">
                          <img class="imagefield imagefield-field_content_images" width="235" height="277" alt="" src="https://dev.twitter.com/sites/default/files/images_platform_object/arctic-blue-bird.jpg?1334604325">
                          <span>Tweets</span>
                          </a><a href="https://dev.twitter.com/docs/platform-objects/users">
                          <img class="imagefield imagefield-field_content_images" width="235" height="277" alt="" src="https://dev.twitter.com/sites/default/files/images_platform_object/missouri_meadow_lark.jpg?1334604578">
                          <span>Users</span>
                          </a><a href="https://dev.twitter.com/docs/platform-objects/entities">
                          <img class="imagefield imagefield-field_content_images" width="235" height="277" alt="" src="https://dev.twitter.com/sites/default/files/images_platform_object/yellow_flycatcher.jpg?1334605975">
                          <span>Entities</span>
                          </a><a href="https://dev.twitter.com/docs/platform-objects/places">
                          <img class="imagefield imagefield-field_content_images" width="235" height="277" alt="" src="https://dev.twitter.com/sites/default/files/images_platform_object/robin.jpg?1334606317">
                          <span>Places</span>
                          </a>
                        </div>
                        <div class="footer">
                          <div style="clear:both;">
                          </div>
                          <p>
                             Explore the Twitter platform's variety of flora and fauna with this field guide to the most frequently observed wild objects.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="panel-left">         
                    <!-- 실시간 업데이트 -->
                    <h2></h2>
                    <div id="news" class="box #news">
                    <ul class="imgtxt #up" style="list-style:none">
                    <c:forEach var="info" items="${getBoardList}" begin="0" end="4">
                    <li class="txt"><a href="" class="@2-1"><strong>${info.subject}</strong></a></li>                   
                    <li class="img"><a href="" class="img_link @2-6"><img src="http://icon.daumcdn.net/w/c/13/02/18146628727312703.jpeg" width="113" height="68" alt="[토픽] 달리는 기차 옆에서 사진을" class="img_thumb">[토픽] 달리는 기차<br>옆에서 사진을</a></li>
                    </c:forEach>
                    </ul>
                    </div>
                    <div class="paging" style="display: none;">
                      <strong id="newsIndex" class="index">1</strong> <span class="slash">/</span> 7
                      <button type="button" title="이전" id="newsPrev" class="btn prev">뉴스 이전 내용</button>
                      <button type="button" title="다음" id="newsNext" class="btn next">뉴스 다음 내용</button>
                    </div>                                      
                  </div>
                  <div id="panel-right">         
                    <!-- Right -->
										<div class="module mini-profile">
										  <div class="flex-module profile-summary js-profile-summary">
										    <a href="/mouse208" class="account-summary account-summary-small js-nav" data-nav="profile">
										    <div class="content">
										      <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
										        <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
										        <b class="fullname">최중섭</b>
										        <small class="metadata">
										        View my profile page </small>
										      </div>
										    </div>
										    </a>
										  </div>
										  <div class="js-mini-profile-stats-container">
										    <ul class="stats js-mini-profile-stats" data-user-id="129483340">
										      <li><a class="js-nav" href="/mouse208" data-element-term="tweet_stats" data-nav="profile">
										      <strong>24</strong> Tweets </a></li>
										      <li><a class="js-nav" href="/following" data-element-term="following_stats" data-nav="following">
										      <strong>10</strong> Following </a></li>
										      <li><a class="js-nav" href="/followers" data-element-term="follower_stats" data-nav="followers">
										      <strong>7</strong> Followers </a></li>
										    </ul>
										  </div>										  
										</div>
                  </div>
                  <div id="panel-left">         
											<ul class="media-list">
											  <li class="media">
											    <a class="pull-left" href="#">
											      <img class="media-object" data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg">
											    </a>
											    <div class="media-body">
											      <h4 class="media-heading">Media heading</h4>
											      ...
											    </div>
											  </li>
                        <li class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg">
                          </a>
                          <div class="media-body">
                            <h4 class="media-heading">Media heading</h4>
                            ...
                          </div>
                        </li>
                        <li class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg">
                          </a>
                          <div class="media-body">
                            <h4 class="media-heading">Media heading</h4>
                            ...
                          </div>
                        </li>
                        <li class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg">
                          </a>
                          <div class="media-body">
                            <h4 class="media-heading">Media heading</h4>
                            ...
                          </div>
                        </li>
                        <li class="media">
                          <a class="pull-left" href="#">
                            <img class="media-object" data-src="holder.js/64x64" alt="64x64" style="width: 64px; height: 64px;" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg">
                          </a>
                          <div class="media-body">
                            <h4 class="media-heading">Media heading</h4>
                            ...
                          </div>
                        </li>                                                                        											  
											</ul>                                     
                  </div>
                  <div id="panel-right">         
                    <!-- Right -->
                        <div id="myCarousel" class="carousel slide">
                        <ol class="carousel-indicators">
                          <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                          <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                          <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                        </ol>
                        <div class="carousel-inner">
                          <div class="active item"  style="height: 229px">
                            <img src="http://twitter.github.com/bootstrap/assets/img/bootstrap-mdo-sfmoma-01.jpg" alt="">
                            <div class="carousel-caption">
                              <h4>First Thumbnail label</h4>
                              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                          </div>
                          <div class="item"  style="height: 229px">
                            <img src="http://twitter.github.com/bootstrap/assets/img/bootstrap-mdo-sfmoma-02.jpg" alt="">
                            <div class="carousel-caption">
                              <h4>Second Thumbnail label</h4>
                              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                          </div>
                          <div class="item"  style="height: 229px">
                            <img src="http://twitter.github.com/bootstrap/assets/img/bootstrap-mdo-sfmoma-03.jpg" alt="">
                            <div class="carousel-caption">
                              <h4>Third Thumbnail label</h4>
                              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                          </div>
                        </div>
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                      </div>                            
                  </div>  
			</div>
    </div>
    </div>
     
</div>
</body>
</html>
