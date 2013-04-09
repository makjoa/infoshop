<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="../include/includes.jspf"/>
<jsp:directive.include file="../include/header.jspf"/>
      <div id="page-outer" class="main_container">
              <!-- 컨텐츠 시작 -->   
        <div id="page-container" class="wrapper wrapper-profile white">
		<div class="dashboard" style="width: 302px; float:left;">
		  <div class="module mini-profile">
		  
		    <div class="flex-module profile-summary js-profile-summary">
		        
		      
		      <a href="/mouse208" class="account-summary account-summary-small js-nav" data-nav="profile">
		        <div class="content">
		          <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
		            <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
		            <b class="fullname">최중섭</b>
		            <small class="metadata">
		                
		                내 프로필 페이지 보기
		            </small>
		          </div>
		        </div>
		      </a>  </div>
		  
		  </div>
		
		  <div class="module">
		    <ul class="js-nav-links">
              <li class=""><a class="list-link js-nav" href="/user/account" data-nav="account">계정 <i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="/settings/password" data-nav="password">비밀번호<i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="/settings/devices" data-nav="devices">모바일 <i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="/settings/notifications" data-nav="notifications">이메일 알림 <i class="chev-right"></i></a></li>
              <li class="active"><a class="list-link js-nav" href="/user/profile" data-nav="profile">프로필 <i class="chev-right"></i></a></li>
		
		
		      <li class=""><a class="list-link js-nav" href="/settings/design" data-nav="design">디자인 <i class="chev-right"></i></a></li>
		      <li class=""><a class="list-link js-nav" href="/settings/applications" data-nav="connections">애플리케이션<i class="chev-right"></i></a></li>
		
		        <li class=""><a class="list-link" href="/settings/widgets" data-nav="widgets">위젯 <i class="chev-right"></i></a></li>
		    </ul>
		  </div>
		
		  <div class="module site-footer ">
		    <div class="flex-module">
		      <div class="flex-module-inner js-items-container">
		        <ul class="clearfix">
		          <li class="copyright">© 2013 Twitter</li>
		          <li><a href="/about">회사소개</a></li>
		          <li><a href="//support.twitter.com">도움말</a></li>
		          <li><a href="/tos">이용약관</a></li>
		          <li><a href="/privacy">개인정보취급정책</a></li>
		          <li><a href="http://blog.kr.twitter.com">블로그</a></li>
		          <li><a href="http://status.twitter.com">시스템 현황</a></li>
		          <li><a href="/download">애플리케이션</a></li>
		          <li><a href="/about/resources">자료실</a></li>
		          <li><a href="/jobs">인재채용</a></li>
		          <li><a href="https://business.twitter.com/start-advertising">광고주</a></li>
		          <li><a href="https://business.twitter.com">비즈니스</a></li>
		          <li><a href="http://media.twitter.com">미디어</a></li>
		          <li><a href="//dev.twitter.com">개발자</a></li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</div>       

<div class="content-main" style="width: 681px;">
          <div class="content-header">
            <div class="header-inner">
              <h2>프로필</h2>
              <p class="subheader">나의 공개 프로필, 검색 결과 등에 나타나는 정보를 설정합니다.</p>
            </div>
          </div>
          <div class="content-inner no-stream-end">
            <form id="profile-form" class="form-horizontal" enctype="multipart/form-data" method="POST" action="https://twitter.com/settings/profile">
              <div id="settings-alert-box" class="alert hidden">
                <i id="settings-alert-close" class="close"></i>
              </div>
              <input type="hidden" name="authenticity_token" value="cdd155aef5662bd245af7fb56a404d39f577346a">
              <input type="hidden" value="PUT" name="_method">
              <fieldset id="profile-image-controls" class="control-group">
                <label class="control-label" for="profile_image_uploaded_data">사진</label>
                <div class="controls">
                  <div class="uploader-avatar clearfix">
                    <img class="avatar size73" id="avatar_preview" src="https://si0.twimg.com/profile_images/1157074264/38_4_bigger.jpg">
                      <div class="uploader-tools">
                        <div id="duckface-uploader" class="hidden" style="display: block;">
                            <div id="choose-photo" class="dropdown">
                <button class="btn choose-photo-button" id="profile_image_upload" type="button" style="">
                  사진 변경
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li class="dropdown-caret">
                    <span class="caret-outer"></span>
                    <span class="caret-inner"></span>
                  </li>
                  <li id="photo-choose-existing" class="photo-choose-existing pretty-link dropdown-link">
                    Upload photo
                    
    <div class="photo-selector">
        <button class="btn" type="button">
            사진 변경
          </button>
        <span class="photo-file-name">선택한 파일이 없습니다</span>
        <div class="image-selector">
          <input type="hidden" name="media_file_name" class="file-name">
          <input type="hidden" name="media_data[]" class="file-data">
          <input type="file" name="media[]" class="file-input">
          <div class="swf-container"></div>
        </div>
      </div></li>
                  <li id="photo-choose-webcam" class="pretty-link dropdown-link " style="">사진 찍기</li>
                  <li id="photo-delete-image" class="pretty-link dropdown-link ">삭제</li>
                </ul>
                <div class="webcam-detect swf-container" style="width: 0px; height: 0px; overflow: hidden;"><object data="/flash/WebcamDetector.swf" type="application/x-shockwave-flash" id="flash_71713443" width="1" height="1"><param name="wmode" value="transparent"><param name="AllowScriptAccess" value="sameDomain"><param name="movie" value="/flash/WebcamDetector.swf"></object></div>
                <img src="https://abs.twimg.com/a/1364948424/images/spinner_center_72.gif" class="preview-spinner" style="display: none">
              </div>
            <p>이 사진은 트윗과 항상 함께 따라다니는 나만의 자기 표현이 됩니다.</p>
                        </div>
                        <div class="hidden" id="legacy-uploader">
                          <div class="photo-selector">
              <button class="btn" type="button" disabled="">
                  파일 선택
                </button>
              <span class="photo-file-name">선택한 파일이 없습니다</span>
              <div class="image-selector">
                <input type="hidden" name="media_file_name" class="file-name">
                <input type="hidden" name="media_data_empty" class="file-data">
                <input type="file" name="media_empty" class="file-input">
                <div class="swf-container"></div>
              </div>
            </div>
            <p>
                            최대 용량 700kb의 JPG, GIF, PNG.<br>
                            프로필 사진을 올리는 데 도움이 필요하신가요? <a href="https://support.twitter.com/articles/127871" target="_blank" id="profile_image_help">더 알아보기</a>.<br>
                              <a href="#" id="delete-image" class="delete-image btn-link">이 사진 삭제</a>
                          </p>
                        </div>
                    </div>
                  </div>
                </div>
              </fieldset>
              <fieldset class="control-group">
                <label class="control-label">헤더</label>
                <div class="controls header-settings">
                  <div class="uploader-image uploader-header clearfix">
                    <span id="header_image_preview" class="image-preview bg-preview" style="background-image: url(https://abs.twimg.com/a/1364948424/t1/img/grey_header_web.png)"></span>
                    <div class="uploader-tools">
                        <div id="choose-header" class="dropdown">
            <button class="btn choose-photo-button" id="profile_header_upload" type="button" style="display: none;">
              헤더 변경
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
              <li class="dropdown-caret">
                <span class="caret-outer"></span>
                <span class="caret-inner"></span>
              </li>
              <li id="header-choose-existing" class="header-choose-existing pretty-link dropdown-link">
                Upload photo
                
    </li>
              <li id="header-choose-webcam" class="pretty-link dropdown-link no-webcam hidden" style="display:none"></li>
              <li id="header-delete-image" class="pretty-link dropdown-link hidden" style="display:none">삭제</li>
            </ul>
            <div class="webcam-detect swf-container" style="width: 0px; height: 0px; overflow: hidden;"><object data="/flash/WebcamDetector.swf" type="application/x-shockwave-flash" id="flash_71787099" width="1" height="1"><param name="wmode" value="transparent"><param name="AllowScriptAccess" value="sameDomain"><param name="movie" value="/flash/WebcamDetector.swf"></object></div>
            <img src="https://abs.twimg.com/a/1364948424/images/spinner_center_72.gif" class="preview-spinner" style="display: none">
          <div class="photo-selector">
        <button class="btn" type="button">
            헤더 변경
          </button>
        <span class="photo-file-name">선택한 파일이 없습니다</span>
        <div class="image-selector">
          <input type="hidden" name="user[profile_header_image_name]" class="file-name">
          <input type="hidden" name="user[profile_header_image]" class="file-data">
          <input type="file" name="user[profile_header_image]" class="file-input">
          <div class="swf-container"></div>
        </div>
      </div></div>
        <p>
                        권장 크기 1252×626<br>
                        최대 파일 크기 5MB
                      </p>
                      <p class="profile-settings-help">도움이 필요하세요? <a href="https://support.twitter.com/articles/127871" target="_blank" id="profile_image_help">더 알아보기</a>.</p>
                    </div>
                  </div>
                </div>
              </fieldset>
              <hr>
              <fieldset class="control-group">
                <label class="control-label" for="user_name">이름</label>
                <div class="controls">
                  <input id="user_name" maxlength="20" type="text" name="user[name]" value="최중섭">
                  <p>실명을 입력하면, 다른 사람들이 찾기가 쉬워집니다.</p>
                </div>
              </fieldset>
              <fieldset class="control-group">
                <label class="control-label" for="user_location">위치</label>
                <div class="controls">
                  <input id="user_location" name="user[location]" type="text" value="Suwon City, Korea Rep">
                  <p>어디에 살고 계신가요?</p>
                </div>
              </fieldset>
              <fieldset id="user_web_fieldset" class="control-group">
                <label class="control-label" for="user_url">웹사이트</label>
                <div class="controls">
                  <input id="user_url" name="user[url]" rel="http://" size="30" type="text" value="http://">
                  <p>홈페이지나 블로그가 있나요? 여기에 주소를 적으세요.</p>
                </div>
              </fieldset>
              <fieldset class="control-group">
                <label class="control-label" for="user_description">자기소개</label>
                <div id="user_description_box" class="controls">
                  <textarea class="input-xlarge" id="user_description" name="user[description]"></textarea>
                  <p class="bio-label"><strong>160</strong>자 이내로 자신을 표현해보세요. <span class="user_description_count">160</span></p>
                </div>
              </fieldset>
              
              <hr>
              
              <label class="control-label" for="">Facebook</label>
              <div class="controls">
                <iframe id="fb-iframe" scrolling="no" frameborder="0" src="/settings/facebook/frame" style="height: 68px;" data-facebook-frame-loaded="true"></iframe>
                <p><a href="#" id="fb-anchor" class="btn" style="display: none;"><span>내 트윗을 Facebook에도 올리기</span></a></p>
                <p>문제가 있나요? <a href="https://support.twitter.com/articles/31113" target="_blank">더 알아보기</a></p>
              </div>
                            <hr>
              <div class="form-actions">
                <button id="settings_save" class="btn primary-btn" type="submit" disabled="disabled">변경사항 저장하기</button>
              </div>
            </form>

            <div id="in_product_help_dialog" class="modal-container modal-in-product-help">
              <div class="close-modal-background-target"></div>
              <div class="modal modal-small draggable">
                <div class="modal-content">
                  <button class="modal-btn modal-close"><i class="close-medium"></i></button>
                  <div class="modal-header">
                    <h3 class="modal-title">프로필 사진 올리기</h3>
                  </div>
                  <div class="modal-body">
                    <p>프로필 사진을 업로드하거나 변경하는 방법:</p>
                    <ol>
                      <li><strong>파일 선택</strong>버튼을 클릭해주세요.</li>
                      <li><strong>파일을 선택해서</strong> 프로필 사진을 올리세요. 파일의 용량은 700k보다 작아야 하며 JPG, GIF 또는 PNG 파일이어야 합니다. (움직이는 GIF는 안 됩니다)</li>
                      <li>섬네일을 보려면 페이지 아래에 <strong>변경사항 저장하기</strong>를 클릭하세요.</li>
                    </ol>
                  </div>
                  <div class="modal-footer">
                    <span class="satisfaction-prompt">
                      <span id="satisfaction_question">도움이 되었나요?</span>
                      <span id="satisfaction_feedback" style="display: none;">소중한 의견 감사합니다!</span>
                    </span>
                    <div id="satisfaction_buttons">
                      <button id="helpful_button" class="btn">예</button>
                      <button id="not_helpful_button" class="btn">아니오</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>

              <div id="profile_image_upload_dialog" class="modal-container image-upload-dialog">
                <div class="close-modal-background-target"></div>
                <div class="modal draggable profile-avatar-modal">
                  <div class="modal-content">
                    <button class="modal-btn modal-close"><i class="close-medium"></i></button>
                    <div class="modal-header">
                      <h3 class="modal-title">Position and size your photo</h3>
                    </div>
                    <div class="modal-body">
                      <div class="alert profile-image-alert message" style="display: none;"><div><span id="profile-image-alert-message"></span><a class="dismiss" href="#">×</a></div></div>
                      <div class="upload-frame image-upload-webcam" style="display: none">
                        <div class="webcam-container"></div>
                        <canvas class="webcam-canvas" height="240" width="320" style="display:none"></canvas>
                      </div>
                      <div class="upload-frame clearfix image-upload-crop" style="display: none">
                        <span class="spinner-bigger crop-spinner" style="display: none"></span>
                        <div class="crop-zone cropper-avatar-size">
                          <div class="cropper-mask">
                          <div class="cropper-overlay"></div>
                            <img class="crop-image">
                          </div>
                          <div class="cropper-slider-outer">
                            <i class="image-gray"></i>
                            <div class="cropper-slider"></div>
                            <i class="image-gray-large"></i>
                          </div>
                        </div>
                      </div>
                      <div style="display: none;">
                        <canvas class="drawsurface"></canvas>
                      </div>
                      <div class="upload-frame clearfix image-upload-spinner"></div>
                    </div>
              
                    <div class="modal-footer">
                      <button type="button" class="btn profile-image-cancel">취소하기</button>
                      <button type="button" class="btn profile-image-previous" style="display: none">이전</button>
                      <button type="button" class="btn primary-btn profile-image-capture-webcam" disabled="" style="display: none">사진 찍기</button>
                      <button type="button" class="btn primary-btn profile-image-save" style="display: none">적용</button>
                    </div>
                  </div>
                </div>
              </div>
              <div id="header_image_upload_dialog" class="modal-container image-upload-dialog">
                <div class="close-modal-background-target"></div>
                <div class="modal draggable profile-header-modal">
                  <div class="modal-content">
                    <button class="modal-btn modal-close"><i class="close-medium"></i></button>
                    <div class="modal-header">
                      <h3 class="modal-title">Position and size your photo</h3>
                    </div>
                    <div class="modal-body">
                      <div class="alert profile-image-alert message" style="display: none;"><div><span id="profile-image-alert-message"></span><a class="dismiss" href="#">×</a></div></div>
                      <div class="upload-frame image-upload-webcam" style="display: none">
                        <div class="webcam-container"></div>
                        <canvas class="webcam-canvas" height="240" width="320" style="display:none"></canvas>
                      </div>
                      <div class="upload-frame clearfix image-upload-crop" style="display: none">
                        <span class="spinner-bigger crop-spinner" style="display: none"></span>
                        <div class="crop-zone cropper-header-size">
                          <div class="cropper-mask">
                              <div class="module profile-card component profile-header" data-component-term="profile_follow_card">
                  <div class="profile-header-inner flex-module clearfix " data-background-image="url('')">
                    <div class="profile-header-inner-overlay"></div>
                
                
                      <a href="https://si0.twimg.com/profile_images/1157074264/38_4.jpg" class="profile-picture media-thumbnail" data-resolved-url-large="https://si0.twimg.com/profile_images/1157074264/38_4.jpg" data-url="https://si0.twimg.com/profile_images/1157074264/38_4.jpg" target="_blank">
                
                        <img src="https://si0.twimg.com/profile_images/1157074264/38_4_bigger.jpg" alt="최중섭" class="avatar size73">
                      </a>
                
                
                    <div class="profile-card-inner" data-screen-name="mouse208" data-user-id="129483340">
                      <h1 class="fullname editable-group">
                          <span class="profile-field">최중섭</span>
                
                
                
                      </h1>
                
                      <h2 class="username">
                            <span class="screen-name"><s>@</s>mouse208</span>
                      </h2>
                      <div class="bio-container editable-group">
                        <p class="bio profile-field"></p>
                      </div>
                      <p class="location-and-url">
                        <span class="location-container editable-group">
                          <span class="location profile-field">
                            Suwon City, Korea Rep
                          </span>
                        </span>
                        <span class="divider hidden">·</span>
                        <span class="url editable-group">
                          <span class="profile-field">
                            
            <a target="_blank" rel="me nofollow" href="">
              
            </a>
                      </span>
                        </span>
                      </p>
                    </div>
                  </div>
                  <div class="flex-module profile-banner-footer clearfix">
                    <div class="default-footer">
                
                        <button class="btn dm-button" type="button" title="쪽지">
                          <i class="dm-envelope"><span class="dm-new"></span></i>
                        </button>
                  </div>
                  </div>
                </div>
                
                
                            <div class="cropper-overlay"></div>
                            <img class="crop-image">
                          </div>
                          <div class="cropper-slider-outer">
                            <i class="image-gray"></i>
                            <div class="cropper-slider"></div>
                            <i class="image-gray-large"></i>
                          </div>
                        </div>
                      </div>
                      <div style="display: none;">
                        <canvas class="drawsurface"></canvas>
                      </div>
                      <div class="upload-frame clearfix image-upload-spinner"></div>
                    </div>
              
                    <div class="modal-footer">
                      <button type="button" class="btn profile-image-cancel">취소하기</button>
                      <button type="button" class="btn profile-image-previous" style="display: none">이전</button>
                      <button type="button" class="btn primary-btn profile-image-capture-webcam" disabled="" style="display: none">사진 찍기</button>
                      <button type="button" class="btn primary-btn profile-image-save" style="display: none">적용</button>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
        <!--
        
        <jsp:directive.include file="../include/footer.jspf"/>
        -->
</div>
</div>
    </div>
</body>
</html>
