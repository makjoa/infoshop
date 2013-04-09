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
		      <li class="active"><a class="list-link js-nav" href="/user/account" data-nav="account">계정 <i class="chev-right"></i></a></li>
		      <li class=""><a class="list-link js-nav" href="/settings/password" data-nav="password">비밀번호<i class="chev-right"></i></a></li>
		      <li class=""><a class="list-link js-nav" href="/settings/devices" data-nav="devices">모바일 <i class="chev-right"></i></a></li>
		      <li class=""><a class="list-link js-nav" href="/settings/notifications" data-nav="notifications">이메일 알림 <i class="chev-right"></i></a></li>
		      <li class=""><a class="list-link js-nav" href="/user/profile" data-nav="profile">프로필 <i class="chev-right"></i></a></li>
		
		
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
      <h2>계정</h2>
      <p class="subheader">기본 계정, 언어, 트윗 공개여부, 위치 설정을 변경하세요</p>
    </div>
  </div>
  <div class="content-inner no-stream-end">
    <form id="account-form" class="form-horizontal requires-password" method="POST" action="https://twitter.com/settings/accounts/update">
      <div id="settings-alert-box" class="alert hidden">
        <i id="settings-alert-close" class="close"></i>
      </div>
      <input type="hidden" value="PUT" name="_method">
      <input type="hidden" name="authenticity_token" value="3de72e532e970593bfcf51b79314249709683455">
      <fieldset id="username_fieldset" class="control-group">
        <label for="user_screen_name" class="control-label">사용자 아이디</label>
        <div class="controls">
          <p id="username_notification" class="notification"></p>
          <input id="user_screen_name" maxlength="15" name="user[screen_name]" type="text" value="${userInfo.username}">
          <p class="notification">https://twitter.com/<span id="username_path">"${userInfo.username}</span></p>
        </div>
      </fieldset>


      <fieldset id="email_fieldset" class="control-group">
        <label for="user_email" class="control-label">이메일 주소</label>
        <div class="controls">
          <p id="email_notification" class="notification"></p>
          <input id="user_email" class="email-input" name="user[email]" type="text" value="${userInfo.email}">
          <p>이메일은 <a href="https://support.twitter.com/articles/15356" target="_blank">공개되지 않습니다.</a></p>
          <label class="checkbox">
            <input id="user_discoverable_by_email" name="user[discoverable_by_email]" type="checkbox" value="1" checked="">
            다른 사용자들이 이메일 주소로 나를 찾을 수 있게 합니다
          </label>
          <input type="hidden" value="0" name="user[discoverable_by_email]">
        </div>
      </fieldset>

      <hr>

      <fieldset class="control-group">
        <label for="user_lang" class="control-label">언어</label>
        <div class="controls">
          <select id="user_lang" name="user[lang]">
             <option>언어 선택하기...</option>
               <option value="xx-lc">Lolcat - LOLCATZ (베타)</option>
               <option value="gl">갈리시아어 - Galego (베타)</option>
               <option value="el">그리스어 - Ελληνικά (베타)</option>
               <option value="nl">네덜란드어 - Nederlands</option>
               <option value="no">노르웨이어 - Norsk</option>
               <option value="da">덴마크어 - Dansk</option>
               <option value="de">독일어 - Deutsch</option>
               <option value="ru">러시아어 - Русский</option>
               <option value="ro">루마니아어 - română (베타)</option>
               <option value="msa">말레이어 - Bahasa Melayu</option>
               <option value="eu">바스크어 - Euskara (베타)</option>
               <option value="fr">불어 - français</option>
               <option value="sv">스웨덴어 - Svenska</option>
               <option value="es">스페인어 - Español</option>
               <option value="ar">아랍어 - العربية</option>
               <option value="en">영어 - English</option>
               <option value="ur">우르두어 - اردو</option>
               <option value="uk">우크라이나어 - Українська мова (베타)</option>
               <option value="it">이탈리아어 - Italiano</option>
               <option value="id">인도네시아어 - Bahasa Indonesia</option>
               <option value="ja">일본어 - 日本語</option>
               <option value="zh-cn">중국어 간체 - 简体中文</option>
               <option value="zh-tw">중국어 번체 - 繁體中文</option>
               <option value="cs">체코어 - Čeština (베타)</option>
               <option value="ca">카탈로니아어 - català (베타)</option>
               <option value="th">타이어 - ภาษาไทย</option>
               <option value="tr">터키어 - Türkçe</option>
               <option value="fa">파르시어 - فارسی</option>
               <option value="pt">포르투갈어 - Português</option>
               <option value="pl">폴란드어 - Polski</option>
               <option value="fi">핀란드어 - Suomi</option>
               <option value="fil">필리핀어 - Filipino</option>
               <option value="ko" selected="">한국어</option>
               <option value="hu">헝가리어 - Magyar</option>
               <option value="he">히브리어 - עִבְרִית</option>
               <option value="hi">힌디어 - हिन्दी</option>
                       </select>
          <p>트위터 번역에 관심 있으세요? <a href="http://translate.twttr.com">번역 센터</a>를 방문해보세요.</p>
        </div>
      </fieldset>
      <fieldset class="control-group">
        <label for="user_time_zone" class="control-label">시간대</label>
        <div class="controls">
          <select id="user_time_zone" name="user[time_zone]">
              <option data-offset="-36000" value="Hawaii">(GMT-10:00) Hawaii</option>
              <option data-offset="-32400" value="Alaska">(GMT-09:00) Alaska</option>
              <option data-offset="-28800" value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
              <option data-offset="-25200" value="Arizona">(GMT-07:00) Arizona</option>
              <option data-offset="-25200" value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
              <option data-offset="-21600" value="Central Time (US &amp; Canada)">(GMT-06:00) Central Time (US &amp; Canada)</option>
              <option data-offset="-18000" value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
              <option data-offset="-18000" value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
              <option data-offset="" value="">-------------</option>
              <option data-offset="-39600" value="International Date Line West">(GMT-11:00) International Date Line West</option>
              <option data-offset="-39600" value="Midway Island">(GMT-11:00) Midway Island</option>
              <option data-offset="-39600" value="Samoa">(GMT-11:00) Samoa</option>
              <option data-offset="-28800" value="Tijuana">(GMT-08:00) Tijuana</option>
              <option data-offset="-25200" value="Chihuahua">(GMT-07:00) Chihuahua</option>
              <option data-offset="-25200" value="Mazatlan">(GMT-07:00) Mazatlan</option>
              <option data-offset="-21600" value="Central America">(GMT-06:00) Central America</option>
              <option data-offset="-21600" value="Guadalajara">(GMT-06:00) Guadalajara</option>
              <option data-offset="-21600" value="Mexico City">(GMT-06:00) Mexico City</option>
              <option data-offset="-21600" value="Monterrey">(GMT-06:00) Monterrey</option>
              <option data-offset="-21600" value="Saskatchewan">(GMT-06:00) Saskatchewan</option>
              <option data-offset="-18000" value="Bogota">(GMT-05:00) Bogota</option>
              <option data-offset="-18000" value="Lima">(GMT-05:00) Lima</option>
              <option data-offset="-18000" value="Quito">(GMT-05:00) Quito</option>
              <option data-offset="-16200" value="Caracas">(GMT-04:30) Caracas</option>
              <option data-offset="-14400" value="Atlantic Time (Canada)">(GMT-04:00) Atlantic Time (Canada)</option>
              <option data-offset="-14400" value="La Paz">(GMT-04:00) La Paz</option>
              <option data-offset="-14400" value="Santiago">(GMT-04:00) Santiago</option>
              <option data-offset="-12600" value="Newfoundland">(GMT-03:30) Newfoundland</option>
              <option data-offset="-10800" value="Brasilia">(GMT-03:00) Brasilia</option>
              <option data-offset="-10800" value="Buenos Aires">(GMT-03:00) Buenos Aires</option>
              <option data-offset="-10800" value="Georgetown">(GMT-03:00) Georgetown</option>
              <option data-offset="-10800" value="Greenland">(GMT-03:00) Greenland</option>
              <option data-offset="-7200" value="Mid-Atlantic">(GMT-02:00) Mid-Atlantic</option>
              <option data-offset="-3600" value="Azores">(GMT-01:00) Azores</option>
              <option data-offset="-3600" value="Cape Verde Is.">(GMT-01:00) Cape Verde Is.</option>
              <option data-offset="0" value="Casablanca">(GMT) Casablanca</option>
              <option data-offset="0" value="Dublin">(GMT) Dublin</option>
              <option data-offset="0" value="Edinburgh">(GMT) Edinburgh</option>
              <option data-offset="0" value="Lisbon">(GMT) Lisbon</option>
              <option data-offset="0" value="London">(GMT) London</option>
              <option data-offset="0" value="Monrovia">(GMT) Monrovia</option>
              <option data-offset="3600" value="Amsterdam">(GMT+01:00) Amsterdam</option>
              <option data-offset="3600" value="Belgrade">(GMT+01:00) Belgrade</option>
              <option data-offset="3600" value="Berlin">(GMT+01:00) Berlin</option>
              <option data-offset="3600" value="Bern">(GMT+01:00) Bern</option>
              <option data-offset="3600" value="Bratislava">(GMT+01:00) Bratislava</option>
              <option data-offset="3600" value="Brussels">(GMT+01:00) Brussels</option>
              <option data-offset="3600" value="Budapest">(GMT+01:00) Budapest</option>
              <option data-offset="3600" value="Copenhagen">(GMT+01:00) Copenhagen</option>
              <option data-offset="3600" value="Ljubljana">(GMT+01:00) Ljubljana</option>
              <option data-offset="3600" value="Madrid">(GMT+01:00) Madrid</option>
              <option data-offset="3600" value="Paris">(GMT+01:00) Paris</option>
              <option data-offset="3600" value="Prague">(GMT+01:00) Prague</option>
              <option data-offset="3600" value="Rome">(GMT+01:00) Rome</option>
              <option data-offset="3600" value="Sarajevo">(GMT+01:00) Sarajevo</option>
              <option data-offset="3600" value="Skopje">(GMT+01:00) Skopje</option>
              <option data-offset="3600" value="Stockholm">(GMT+01:00) Stockholm</option>
              <option data-offset="3600" value="Vienna">(GMT+01:00) Vienna</option>
              <option data-offset="3600" value="Warsaw">(GMT+01:00) Warsaw</option>
              <option data-offset="3600" value="West Central Africa">(GMT+01:00) West Central Africa</option>
              <option data-offset="3600" value="Zagreb">(GMT+01:00) Zagreb</option>
              <option data-offset="7200" value="Athens">(GMT+02:00) Athens</option>
              <option data-offset="7200" value="Bucharest">(GMT+02:00) Bucharest</option>
              <option data-offset="7200" value="Cairo">(GMT+02:00) Cairo</option>
              <option data-offset="7200" value="Harare">(GMT+02:00) Harare</option>
              <option data-offset="7200" value="Helsinki">(GMT+02:00) Helsinki</option>
              <option data-offset="7200" value="Istanbul">(GMT+02:00) Istanbul</option>
              <option data-offset="7200" value="Jerusalem">(GMT+02:00) Jerusalem</option>
              <option data-offset="7200" value="Kyiv">(GMT+02:00) Kyiv</option>
              <option data-offset="7200" value="Pretoria">(GMT+02:00) Pretoria</option>
              <option data-offset="7200" value="Riga">(GMT+02:00) Riga</option>
              <option data-offset="7200" value="Sofia">(GMT+02:00) Sofia</option>
              <option data-offset="7200" value="Tallinn">(GMT+02:00) Tallinn</option>
              <option data-offset="7200" value="Vilnius">(GMT+02:00) Vilnius</option>
              <option data-offset="10800" value="Baghdad">(GMT+03:00) Baghdad</option>
              <option data-offset="10800" value="Kuwait">(GMT+03:00) Kuwait</option>
              <option data-offset="10800" value="Minsk">(GMT+03:00) Minsk</option>
              <option data-offset="10800" value="Nairobi">(GMT+03:00) Nairobi</option>
              <option data-offset="10800" value="Riyadh">(GMT+03:00) Riyadh</option>
              <option data-offset="12600" value="Tehran">(GMT+03:30) Tehran</option>
              <option data-offset="14400" value="Abu Dhabi">(GMT+04:00) Abu Dhabi</option>
              <option data-offset="14400" value="Baku">(GMT+04:00) Baku</option>
              <option data-offset="14400" value="Moscow">(GMT+04:00) Moscow</option>
              <option data-offset="14400" value="Muscat">(GMT+04:00) Muscat</option>
              <option data-offset="14400" value="St. Petersburg">(GMT+04:00) St. Petersburg</option>
              <option data-offset="14400" value="Tbilisi">(GMT+04:00) Tbilisi</option>
              <option data-offset="14400" value="Volgograd">(GMT+04:00) Volgograd</option>
              <option data-offset="14400" value="Yerevan">(GMT+04:00) Yerevan</option>
              <option data-offset="16200" value="Kabul">(GMT+04:30) Kabul</option>
              <option data-offset="18000" value="Islamabad">(GMT+05:00) Islamabad</option>
              <option data-offset="18000" value="Karachi">(GMT+05:00) Karachi</option>
              <option data-offset="18000" value="Tashkent">(GMT+05:00) Tashkent</option>
              <option data-offset="19800" value="Chennai">(GMT+05:30) Chennai</option>
              <option data-offset="19800" value="Kolkata">(GMT+05:30) Kolkata</option>
              <option data-offset="19800" value="Mumbai">(GMT+05:30) Mumbai</option>
              <option data-offset="19800" value="New Delhi">(GMT+05:30) New Delhi</option>
              <option data-offset="20700" value="Kathmandu">(GMT+05:45) Kathmandu</option>
              <option data-offset="21600" value="Almaty">(GMT+06:00) Almaty</option>
              <option data-offset="21600" value="Astana">(GMT+06:00) Astana</option>
              <option data-offset="21600" value="Dhaka">(GMT+06:00) Dhaka</option>
              <option data-offset="21600" value="Ekaterinburg">(GMT+06:00) Ekaterinburg</option>
              <option data-offset="21600" value="Sri Jayawardenepura">(GMT+06:00) Sri Jayawardenepura</option>
              <option data-offset="23400" value="Rangoon">(GMT+06:30) Rangoon</option>
              <option data-offset="25200" value="Bangkok">(GMT+07:00) Bangkok</option>
              <option data-offset="25200" value="Hanoi">(GMT+07:00) Hanoi</option>
              <option data-offset="25200" value="Jakarta">(GMT+07:00) Jakarta</option>
              <option data-offset="25200" value="Novosibirsk">(GMT+07:00) Novosibirsk</option>
              <option data-offset="28800" value="Beijing">(GMT+08:00) Beijing</option>
              <option data-offset="28800" value="Chongqing">(GMT+08:00) Chongqing</option>
              <option data-offset="28800" value="Hong Kong">(GMT+08:00) Hong Kong</option>
              <option data-offset="28800" value="Krasnoyarsk">(GMT+08:00) Krasnoyarsk</option>
              <option data-offset="28800" value="Kuala Lumpur">(GMT+08:00) Kuala Lumpur</option>
              <option data-offset="28800" value="Perth">(GMT+08:00) Perth</option>
              <option data-offset="28800" value="Singapore">(GMT+08:00) Singapore</option>
              <option data-offset="28800" value="Taipei">(GMT+08:00) Taipei</option>
              <option data-offset="28800" value="Ulaan Bataar">(GMT+08:00) Ulaan Bataar</option>
              <option data-offset="28800" value="Urumqi">(GMT+08:00) Urumqi</option>
              <option data-offset="32400" value="Irkutsk">(GMT+09:00) Irkutsk</option>
              <option data-offset="32400" value="Osaka">(GMT+09:00) Osaka</option>
              <option data-offset="32400" value="Sapporo">(GMT+09:00) Sapporo</option>
              <option data-offset="32400" value="Seoul" selected="">(GMT+09:00) Seoul</option>
              <option data-offset="32400" value="Tokyo">(GMT+09:00) Tokyo</option>
              <option data-offset="34200" value="Adelaide">(GMT+09:30) Adelaide</option>
              <option data-offset="34200" value="Darwin">(GMT+09:30) Darwin</option>
              <option data-offset="36000" value="Brisbane">(GMT+10:00) Brisbane</option>
              <option data-offset="36000" value="Canberra">(GMT+10:00) Canberra</option>
              <option data-offset="36000" value="Guam">(GMT+10:00) Guam</option>
              <option data-offset="36000" value="Hobart">(GMT+10:00) Hobart</option>
              <option data-offset="36000" value="Melbourne">(GMT+10:00) Melbourne</option>
              <option data-offset="36000" value="Port Moresby">(GMT+10:00) Port Moresby</option>
              <option data-offset="36000" value="Sydney">(GMT+10:00) Sydney</option>
              <option data-offset="36000" value="Yakutsk">(GMT+10:00) Yakutsk</option>
              <option data-offset="39600" value="New Caledonia">(GMT+11:00) New Caledonia</option>
              <option data-offset="39600" value="Solomon Is.">(GMT+11:00) Solomon Is.</option>
              <option data-offset="39600" value="Vladivostok">(GMT+11:00) Vladivostok</option>
              <option data-offset="43200" value="Auckland">(GMT+12:00) Auckland</option>
              <option data-offset="43200" value="Fiji">(GMT+12:00) Fiji</option>
              <option data-offset="43200" value="Kamchatka">(GMT+12:00) Kamchatka</option>
              <option data-offset="43200" value="Magadan">(GMT+12:00) Magadan</option>
              <option data-offset="43200" value="Marshall Is.">(GMT+12:00) Marshall Is.</option>
              <option data-offset="43200" value="Wellington">(GMT+12:00) Wellington</option>
              <option data-offset="46800" value="Nuku'alofa">(GMT+13:00) Nuku'alofa</option>
          </select>
        </div>
      </fieldset>

      <hr>

      <fieldset class="control-group">
        <label for="user_geo_enabled" class="control-label">위치 트윗하기</label>
        <div class="controls">
          <label class="checkbox">
            <input checked="" id="user_geo_enabled" name="user[geo_enabled]" type="checkbox" value="1">트윗에 위치 정보 추가하기
          </label>
          <input type="hidden" value="0" name="user[geo_enabled]">
          <p>현재 위치 정보를 제공해 주시면 트위터는 이를 저장합니다. 표시 여부는 매 트윗을 하기 전에 결정할 수 있습니다. <a href="https://support.twitter.com/articles/78525" target="_blank">자세히 보기</a></p>
          <div id="delete_geo_data">
            <p><a class="delete-info btn" id="geo_button" href="#">모든 위치 정보 삭제하기</a></p>
            <p id="delete_geo_info">지난 모든 트윗의 위치 정보를 삭제합니다. 최대 30분 정도 소요됩니다.</p>
            <p id="deleting_geo_data" style="display: none;">이전 트윗에 기록된 모든 위치 정보를 삭제하고 있습니다. 최대 30분 정도 소요됩니다. 다른 페이지로 이동하셔도 계속 진행됩니다.</p>
          </div>
        </div>
      </fieldset>
      <fieldset class="control-group">
        <label for="user_nsfw_view" class="control-label">미디어 트윗하기</label>
        <div class="controls">
          <label class="checkbox">
            <input id="user_nsfw_view" name="user[nsfw_view]" type="checkbox" value="1"> 민감한 내용의 미디어 표시하기
          </label>
          <input type="hidden" value="0" name="user[nsfw_view]">
            <label class="checkbox">
              <input id="user_nsfw_user" name="user[nsfw_user]" type="checkbox" value="1"> 내 미디어를 민감한 내용의 콘텐츠로 표시하기
            </label>
            <input type="hidden" value="0" name="user[nsfw_user]">
          <p>민감할 수 있는 내용을 포함한 사진 혹은 동영상을 트윗하신다면 다른 사용자가 주의할 수 있도록 이 박스를 체크해 주세요. <a href="https://support.twitter.com/articles/20169200" target="_blank">자세히 알아보기</a>.</p>
        </div>
      </fieldset>

      <fieldset id="user_protected_fieldset" class="control-group">
        <div id="protected_verified_dialog" class="modal-container">
          <div class="close-modal-background-target"></div>
          <div class="modal modal-small draggable">
            <div class="modal-content">
              <button type="button" class="modal-btn modal-close js-close"><i class="close-medium"><span class="visuallyhidden">닫기</span></i></button>      <div class="modal-header">
                <h3 class="modal-title">경고!</h3>
              </div>
              <div class="modal-body">
                <p>죄송합니다. 트위터는 공개 계정만 인증할 수 있습니다. 비공개 계정으로 변경할 경우, 인증 표시가 없어집니다.</p>
              </div>
              <div class="modal-footer">
                <button id="stay_verified_link" class="btn" type="button">인증 유지</button>
                <button id="protect_my_tweets_link" class="btn primary-btn" type="button">내 트윗을 비공개</button>
              </div>
            </div>
          </div>
        </div>
        
        
        <label for="user_protected" class="control-label">트윗 비공개</label>
        <div class="controls">
          <label class="checkbox">
            <input id="user_protected" name="user[protected]" type="checkbox" value="1"> 내 트윗을 비공개
          </label>
          <input type="hidden" value="0" name="user[protected]">
            <p>선택한 일부 사람들에 한해 내 트윗을 볼 수 있게 합니다. 다만 이전에 올린 트윗은 일부 플랫폼에서 누구나 볼 수 있습니다. <a href="https://support.twitter.com/articles/14016" target="_blank">더 알아보기</a></p>
        </div>
      </fieldset>

        <fieldset class="control-group">
          <label class="control-label ">맞춤형 서비스</label>
          <div class="controls">

              <label class="checkbox">
                <input checked="" id="use_cookie_personalization" name="user[use_cookie_personalization]" type="checkbox" value="1">
                최근 인터넷 사이트 방문 기록을 바탕으로 나만의 트위터 서비스 즐기기
                <input type="hidden" value="0" name="user[use_cookie_personalization]">
                <input type="hidden" name="asked_cookie_personalization_setting" value="1">
              </label>
              <p>맞춤형 추천 목록을 보고 싶으시면 <a class="personalization-preview-link" href="/#!/who_to_follow/web_personalized" target="_blank">미리보기</a>를 클릭하시고, 이 기능의 원리와 추가 개인정보 보호 기능에 대해 알아보시려면 <a class="personalization-support-link" href="https://support.twitter.com/articles/20169421" target="_blank">자세히 보기</a>를 확인해보세요.</p>


          </div>
        </fieldset>


      <fieldset class="control-group">
        <label for="user_no_username_only_password_reset" class="control-label">비밀번호 재설정</label>
        <div class="controls">
          <div class="control-list">
            <label class="checkbox">
              <input id="user_no_username_only_password_reset" name="user[no_username_only_password_reset]" type="checkbox" value="1">비밀번호를 재설정할 때 내 정보를 확인하기
            </label>
            <input name="user[no_username_only_password_reset]" type="hidden" value="0">
          </div>
          <p>원래는 @아이디만 입력하시면 비밀번호를 찾을 수 있지만, 만약 이 항목에 체크하시면 이메일 주소나 전화번호를 입력해야만 가능합니다.</p>
        </div>
      </fieldset>

      <hr>


        <fieldset class="control-group">
          <label for="user_country" class="control-label">국가</label>
          <div class="controls">
            <select id="user_country" name="user[country]">
                <option value="xx">전세계</option>
                <option value="dz">Algeria</option>
                <option value="et">Ethiopia</option>
                <option value="gh">Ghana</option>
                <option value="ma">Morocco</option>
                <option value="mz">Mozambique</option>
                <option value="np">Nepal</option>
                <option value="tw">Taiwan</option>
                <option value="ug">Uganda</option>
                <option value="vn">Vietnam</option>
                <option value="gr">그리스</option>
                <option value="ng">나이지리아</option>
                <option value="za">남아프리카 공화국</option>
                <option value="nl">네덜란드</option>
                <option value="nz">뉴질랜드</option>
                <option value="kr" selected="">대한민국</option>
                <option value="dk">덴마크</option>
                <option value="de">독일</option>
                <option value="ru">러시아</option>
                <option value="ro">루마니아</option>
                <option value="mg">마다가스카르</option>
                <option value="my">말레이시아</option>
                <option value="mx">멕시코</option>
                <option value="us">미국</option>
                <option value="bd">방글라데시</option>
                <option value="ve">베네수엘라</option>
                <option value="br">브라질</option>
                <option value="sa">사우디 아라비아</option>
                <option value="lk">스리랑카</option>
                <option value="se">스웨덴</option>
                <option value="ch">스위스</option>
                <option value="es">스페인</option>
                <option value="sg">싱가포르</option>
                <option value="ar">아르헨티나</option>
                <option value="ie">아일랜드</option>
                <option value="af">아프가니스탄</option>
                <option value="gb">영국</option>
                <option value="ye">예멘</option>
                <option value="uz">우즈베키스탄</option>
                <option value="ua">우크라이나</option>
                <option value="iq">이라크</option>
                <option value="il">이스라엘</option>
                <option value="eg">이집트</option>
                <option value="it">이탈리아</option>
                <option value="in">인도</option>
                <option value="id">인도네시아</option>
                <option value="jp">일본</option>
                <option value="cm">카메룬</option>
                <option value="ca">캐나다</option>
                <option value="ke">케냐</option>
                <option value="co">콜롬비아</option>
                <option value="tz">탄자니아</option>
                <option value="th">태국</option>
                <option value="tr">터키</option>
                <option value="pk">파키스탄</option>
                <option value="pe">페루</option>
                <option value="pl">폴란드</option>
                <option value="fr">프랑스</option>
                <option value="ph">필리핀</option>
                <option value="au">호주</option>
                          </select>
            <p>국가를 선택하세요. 이 설정은 현재 사용중인 브라우저에 저장됩니다.</p>
          </div>
        </fieldset>
        <hr>

        <fieldset class="control-group">
          <label for="tweet_export" class="control-label">내 트위터 기록</label>
          <div class="controls">
            <div id="tweet_export">
                <div id="export_request">
                  <p><button type="button" class="btn" id="export_button">내 기록 요청하기</button></p>
                  <p id="export_ready">첫 트윗을 포함한 내 정보를 볼 수 있는 파일을 요청할 수 있습니다. 파일이 준비되면 이메일로 다운로드 링크를 보내드립니다.</p>
                  <p id="export_in_queue" class="hidden">이미 다운로드를 요청했습니다. 다른 다운로드를 요청하기 전에 잠시만 기다려주세요.</p>
                  <p id="export_not_available" class="hidden">계정이 정지된 상태에서 다운로드를 요청할 수 없습니다.</p>
                </div>

                <div id="export_resend" class="hidden">
                  <p><button type="button" class="btn" id="export_resend_button">이메일 다시 보내기</button></p>
                  <p id="export_resend_instructions">파일을 내려받을 수 있습니다. 만약 링크가 포함된 이메일을 받지 못하셨다면, 위 링크를 눌러 이메일을 다시 요청하세요.</p>
                  <p id="export_resend_success" class="hidden">다운로드 안내를 보려면 이메일을 확인하세요.</p>
                </div>
            </div>
          </div>
        </fieldset>
        <div id="tweet_export_dialog" class="modal-container">
          <div class="close-modal-background-target"></div>
          <div class="modal modal-small draggable">
            <div class="modal-content">
              <button class="modal-btn modal-close"><i class="close-medium"></i></button>
              <div class="modal-header">
                <h3 class="modal-title">
                  <div class="tweet-export-success reset-hide hidden">요청이 접수 되었습니다!</div>
                  <div class="tweet-export-unavailable tweet-export-request-in-queue tweet-export-suspended-user reset-hide hidden">죄송합니다, 처리되지 않았습니다</div>
                  <div class="tweet-export-confirm-email-request tweet-export-confirm-email-error reset-hide hidden">이메일 주소 확인</div>
                  <div class="tweet-export-request-already-sent reset-hide hidden">이메일을 확인하세요</div>
                </h3>
              </div>
              <div class="modal-body">
                <p class="modal-body-text">
                  </p><div class="tweet-export-success reset-hide hidden">다운로드가 준비되면 이메일로 링크를 보내드립니다. 준비하는 데 다소 시간이 걸릴 수 있으므로 조금만 기다려 주세요.</div>
                  <div class="tweet-export-unavailable reset-hide hidden">관심에 감사드립니다. 지금은 요청이 많이 들어오고 있습니다. 나중에 다시 시도해 주세요.</div>
                  <div class="tweet-export-confirm-email-request reset-hide hidden">이 절차를 완료하기 전에 귀하의 이메일 주소를 확인해야 합니다. 아래 버튼을 클릭하면 진행 안내가 포함된 확인 이메일을 받게 됩니다. 완료하시면 여기로 돌아오셔서 다시 요청하세요.</div>
                  <div class="tweet-export-confirm-email-error reset-hide hidden">확인 이메일을 보내는 중 오류가 발생했습니다. 다시 시도해주세요.</div>
                  <div class="tweet-export-request-in-queue reset-hide hidden">이미 다운로드를 요청했습니다. 다른 다운로드를 요청하기 전에 잠시만 기다려주세요.</div>
                  <div class="tweet-export-request-already-sent reset-hide hidden">다운로드가 준비되었습니다. 이메일을 확인하시고 안내에 따라주세요.</div>
                  <div class="tweet-export-suspended-user reset-hide hidden">계정이 정지된 상태에서 다운로드를 요청할 수 없습니다.</div>
                <p></p>
              </div>
        
              <div class="modal-footer">
                <a class="btn tweet-export-confirm-email-request reset-hide hidden" id="resend_confirmation_button">확인 이메일 보내기</a>
                <a class="btn tweet-export-success reset-hide hidden" id="thanks_button">닫기</a>
                <a class="btn tweet-export-unavailable tweet-export-request-in-queue tweet-export-request-already-sent reset-hide hidden" id="okay_button">동의</a>
                <div class="reset-hide hidden" id="email_sending_spinner"><span class="spinner-small loading-spinner"></span></div>
                <p style="color:#390;" class="reset-hide hidden" id="email_sent_text"><i class="checkmark"></i> 이메일을 보냈습니다</p>
              </div>
            </div>
          </div>
        </div>
        <hr>

      <div class="form-actions">
        <button id="settings_save" class="btn primary-btn" type="submit" disabled="disabled">변경사항 저장하기</button>
      </div>
      <div id="password_dialog" class="modal-container">
        <div class="close-modal-background-target"></div>
        <div class="modal modal-small draggable">
          <div class="modal-content">
            <button type="button" class="modal-btn modal-close js-close"><i class="close-medium"><span class="visuallyhidden">닫기</span></i></button>      <div class="modal-header">
              <h3 class="modal-title">계정 변경사항 저장하기</h3>
            </div>
            <div class="modal-body">
              <p>계정 변경사항을 저장하려면 비밀번호를 입력하세요.</p>
              <div class="input-wrapper password-wrapper">
                <input class="input-block" id="auth_password" name="auth_password" type="password" placeholder="비밀번호">
                <small>
                  <a href="/account/resend_password" id="forgot_password">비밀번호를 잊으셨나요?</a>
                  <span id="reminder_sent" style="visibility: hidden">메일을 보냈습니다!</span>
                </small>
              </div>
            </div>
            <div class="modal-footer">
              <button class="btn" id="cancel_password_button">취소하기</button>
              <button type="submit" id="save_password" class="btn primary-btn modal-submit" disabled="disabled">변경사항 저장하기</button>
            </div>
          </div>
        </div>
      </div>

      <hr>

      <fieldset class="control-group">
        <div class="controls">
          <p><a id="account_deactivate_link" href="/settings/accounts/confirm_deactivation">트위터 회원 탈퇴하기</a></p>
        </div>
      </fieldset>
    </form>
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
