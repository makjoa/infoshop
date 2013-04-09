<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
    <script type="text/javascript" src='<%=request.getContextPath()%>/resources/js/node_modules/irc/lib/codes.js'></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/resources/js/node_modules/irc/lib/colors.js'></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/resources/js/node_modules/irc/lib/irc.js'></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/resources/js/bot.js'></script>
    <script type="text/javascript" src='http://localhost:8001/socket.io/socket.io.js'></script>
    <script type="text/javascript">

    $(function(){

        var nick_name = '';

        var socket = io.connect('http://makjoa.iptime.org:8001/');

        $("#enter").click(function(){

            nick_name = $('#uid').val();

            if(nick_name == "")

            {

                alert('아이디를 입력하세요');

            }

            else

            {

                socket.emit('systemIn',{

                    name : nick_name

                });




                $("#door").slideUp(200).delay(200,function(){

                    $("#chat").slideDown(200);

                });

            }

                

        });



        socket.on('systemList',function(data){

            $("#nick_lst").empty();

            $("#nick_lst").append('<option value="poblic">모두</option>');

            for (var i in data) {

                $("#nick_lst").append('<option value="'+data[i]+'">'+data[i]+'</option>');

            }

        });

        

        socket.on('systemIn',function(data){

            $('#msg').append('<dd>'+data.name+'님이 입장하셨습니다.</dd>');

            scrollDonw();

        });



        socket.on('systemOut',function(data){

            $('#msg').append('<dd>'+data.name+'님이 퇴장하셨습니다.</dd>');

            scrollDonw();

        });



        socket.on('message',function(data){

            $('#msg').append('<dt>'+data.name+' : </dt><dd>'+data.message+'</dd>');

            scrollDonw();

        });



        $("#txt").keypress(function(ent){

            if(ent.which == 13){

                $("#input").click();

            }

        });

        

        $("#input").bind('click',function(){

            socket.emit('message',{

                type : $("#nick_lst").val(),

                name : nick_name,

                message : $("#txt").val()

            });

            $("#txt").val('');

        });

    });

    function scrollDonw()

    {

        $("#msg").animate({'scrollTop':$("#msg")[0].scrollHeight},200);

    }
    </script>
            <section>
                <div id="page-outer" class="main_container">                
                    <div id="page-container" class="wrapper wrapper-profile white">
                        <jsp:directive.include file="../include/collapse.jspf"/>
                        <div class="content-top">
                            <div class="module">
                                <div class="flex-module profile-summary js-profile-summary">
                                    <h2 class="js-timeline-title">메인</h2>
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

        <div id="door">

            <p style='margin-top:50px;'>※닉네임을 설정하여 주십시오.</p>

            <p>

                <input type="text" name='uid' id="uid" value="" />

            </p>

            <p>

                <input type="button" id='enter' value="입장하기" /> 

            </p>

        </div>

        <div id="chat">

            <dl id="msg">

            </dl>

            <div id="edit">

                <select name="nick_lst" id="nick_lst">

                    <option value="poblic">모두</option>

                </select>

                <input type="text" name="txt" id="txt" />

                <button id="input">입력</button>

            </div>

        </div>
                                    
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
                        <!--  -->
                        <div class="content-custom js-timeline-from-cache" id="timeline">
                            <div class="module">
                                <div class="flex-module">
                                    <div class="flex-module-header">
                                        <h3 class="js-timeline-title">최신 컨텐츠</h3>                                
                                    </div>
                                    <div class="stream-container">
                                        <div class="stream home-stream">
                                           <ul class="js-nav-links">
                                                <li class="media-thumbnails top-images hidden" style="display: list-item;" data-loaded="true">
                                                    <div class="list-link">
                                                        <div class="media-header">
                                                             인기 사진 <i class="chev-right"></i>
                                                        </div>
                                                        <div class="media-row">
                                                            <div class="media-row-content photo-list">
                                                                <a href="#" data-status-id="315706574029066241" data-url="http://imgnews.naver.net/image/139/2013/03/24/SK007_20130324_190401_59_20130324130602.jpg:thumb" data-resolved-url-thumb="http://imgnews.naver.net/image/139/2013/03/24/SK007_20130324_190401_59_20130324130602.jpg:thumb" data-resolved-url-small="https://pbs.twimg.com/media/BGGddNbCEAAH-xS.jpg" data-resolved-url-large="http://imgnews.naver.net/image/139/2013/03/24/SK007_20130324_190401_59_20130324130602.jpg:large" data-height="315" data-width="500" class="media-thumbnail " data-load-status="loaded">
                                                                    <img src="http://imgnews.naver.net/image/139/2013/03/24/SK007_20130324_190401_59_20130324130602.jpg" style="position: absolute; height: 66px; width: 66px; left: 0px; top: 0px;"></a>
                                                                <a data-status-id="315667475180179456" data-url="https://pbs.twimg.com/media/BGF55W3CUAA-WsA.jpg:thumb" data-resolved-url-thumb="https://pbs.twimg.com/media/BGF55W3CUAA-WsA.jpg:thumb" data-resolved-url-small="https://pbs.twimg.com/media/BGF55W3CUAA-WsA.jpg" data-resolved-url-large="https://pbs.twimg.com/media/BGF55W3CUAA-WsA.jpg:large" data-height="1280" data-width="720" class="media-thumbnail " data-load-status="loaded">
                                                                    <img src="http://imgnews.naver.net/image/139/2013/03/24/SK007_20130324_720201_59_20130324163002.jpg" style="position: absolute; height: 66px; width: 66px; left: 0px; top: 0px;"></a>
                                                                <a data-status-id="315665188584046592" data-url="https://pbs.twimg.com/media/BGF30QoCQAAr2Yo.jpg:thumb" data-resolved-url-thumb="https://pbs.twimg.com/media/BGF30QoCQAAr2Yo.jpg:thumb" data-resolved-url-small="https://pbs.twimg.com/media/BGF30QoCQAAr2Yo.jpg" data-resolved-url-large="https://pbs.twimg.com/media/BGF30QoCQAAr2Yo.jpg:large" data-height="1365" data-width="1024" class="media-thumbnail " data-load-status="loaded">
                                                                    <img src="http://imgnews.naver.net/image/109/2013/03/24/201303241016771542_514e547bdd8cc_59_20130324102101.jpg" style="position: absolute; height: 66px; width: 66px; left: 0px; top: 0px;"></a>
                                                                <a data-status-id="315628036542324736" data-url="https://pbs.twimg.com/media/BGFWBueCYAIBy3I.jpg:thumb" data-resolved-url-thumb="https://pbs.twimg.com/media/BGFWBueCYAIBy3I.jpg:thumb" data-resolved-url-small="https://pbs.twimg.com/media/BGFWBueCYAIBy3I.jpg" data-resolved-url-large="https://pbs.twimg.com/media/BGFWBueCYAIBy3I.jpg:large" data-height="640" data-width="1024" class="media-thumbnail " data-load-status="loaded">
                                                                    <img src="http://imgnews.naver.net/image/139/2013/03/24/SK007_20130324_730101_59_20130324112702.jpg" style="position: absolute; height: 66px; width: 66px; left: 0px; top: 0px;"></a>                                                               
                                                                <span class="thumbnail-placeholder first"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media-thumbnails top-videos media-videos hidden last-item" style="display: list-item;">
                                                    <div class="list-link">
                                                        <div class="media-header">
                                                             인기 동영상 <i class="chev-right"></i>
                                                        </div>
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
                                    <div class="flex-module profile-summary js-profile-summary">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <jsp:directive.include file="../include/footer.jspf"/>                        
                    </div>
                </div>
            </section>      
        </div>
    </body>
</html>
