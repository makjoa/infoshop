// script for subject
var PeTitleEditor = {
	isCube: false,
	defaultFontSize: '9',
    init: function(el, initValue) {
		try {
			if (CAFEAPP.ISCUBE) {
				this.isCube = true;
			} else {
				this.isCube = false;
			}
	        if (CAFEAPP.DEFAULTFONTSIZE == undefined || CAFEAPP.DEFAULTFONTSIZE == null || CAFEAPP.DEFAULTFONTSIZE == "") {	        
	            this.defaultFontSize = '9';
	        } else {
				this.defaultFontSize = CAFEAPP.DEFAULTFONTSIZE;
	        }
		} catch(e) {
			this.isCube = false;
		}
        
		this.titleStyle = null;

        if (initValue == undefined) {
            titleStyle = {
                subj1:'', 
                subj2:'',
                subj3:''
            };
        } else {
            titleStyle = initValue;
        }
        var e = this.e = $(el);
        if(!this.e){
        	this.e = {};
        	this.e.style = {};
        }
        
        
        daum.Event.addEvent(e,'focus', this.hideSubjectLayer.bindAsEventListener(this))
        daum.Event.addEvent(e,'blur', this.showSubjectLayer.bindAsEventListener(this));

        // 글자크기
        if (daum.$('tx_titleFontSize')) {
            this.fontSizeId = 'tx_titleFontSize';
            this.createFontSizeSelector(titleStyle.subj3);
            e.style.fontSize = this.getFontPT(titleStyle.subj3);
            daum.$('subj3').value = titleStyle.subj3;
        }
        
        // 굵기
        if (daum.$('tx_titleFontBold')) {
            this.fontBoldId = 'tx_titleFontBold';
            this.createBoldButton(titleStyle.subj1);
            daum.$('subj1').value = titleStyle.subj1;
            e.style.fontWeight = (titleStyle.subj1 == '1') ? "bold" : "normal";
        }
        
        // 글자색
        if (daum.$('tx_titleFontColor')) {
            this.fontColorId = 'tx_titleFontColor';
            this.createColorPalleteButton(titleStyle.subj2);
            e.style.color = titleStyle.subj2;
            daum.$('subj2').value = titleStyle.subj2;
        }
        
        // 초기화
        if (daum.$('tx_titleFontReset')) {
            this.fontResetId = 'tx_titleFontReset';
            this.resetColor = powerEditorEnv.fontColor; 
            this.createResetButton();
        }
        /* 저장 버튼 클릭 후 에러 있어서 history.back 한 경우 에디터 초기화할 수 없어 이 곳에 넣음.. */

        if(!window.isAutoLoad){
            var folder = daum.$('folder');
            if(folder && folder.value && folder.selectedIndex > 0){
                changeBBS(folder.value);
            }
        }
        else
        {
            window.isAutoLoad = false;
        }
        this.setFocus(); /* 타이틀에 배경 없애기 위해 호출*/
    }, 
    getFontPT:  function(size) {
        var fontSize = null;
        switch (parseInt(size)) {
        case 1 : 
            fontSize = "8pt";
            break;
        case 2 : 
            fontSize = "10pt";
            break;
        case 3 : 
            fontSize = "12pt";
            break;
        case 5 : 
            fontSize = "18pt";
            break;
        default : 
            if(this.isCube && this.defaultFontSize == "9") fontSize = "9pt";
            else fontSize = "10pt";
        }
        
        return fontSize;
    },
    getFontNum: function(size) {
        var fontSize = null;
        switch (size) {
        case '8pt' : 
            fontSize = 1;
            break;
        case '9pt' : 
            fontSize = '';
            break;
        case '10pt' : 
            fontSize = 2;
            break;
        case '12pt' : 
            fontSize = 3;
            break;
        case '18pt' : 
            fontSize = 5;
            break;
        }
        return fontSize;
    },
    showSubjectLayer: function(){
        if(this.e.value==""){
            if(this.e.style.removeProperty){ this.e.style.removeProperty("background-image"); }
            else { this.e.style.backgroundImage = ""; }
        }
    },
    hideSubjectLayer: function() {
        this.e.style.backgroundImage = 'none';
    },  
    createFontSizeSelector: function(initVal) {
        var state = initVal ? initVal : "";
        daum.$('tx_fontsize_text').innerHTML = '<span>' + this.getFontPT(state) + '</span>'; 

        var options = [];
        options[0] = { label: '가나다라마바사 (8pt)', title: '8pt', data: '8pt', klass: 'tx-8pt' };
        
    	if (this.isCube && this.defaultFontSize == "9") { 
        	options[1] = { label: '가나다라마바사 (9pt)', title: '9pt', data: '9pt', klass: 'tx-9pt' };
        	options[2] = { label: '가나다라마바사 (10pt)', title: '10pt', data: '10pt', klass: 'tx-10pt' };
        	options[3] = { label: '가나다라마바사 (12pt)', title: '12pt', data: '12pt', klass: 'tx-12pt' };
            options[4] = { label: '가나다라마바사 (18pt)', title: '18pt', data: '18pt', klass: 'tx-18pt' };
        } else {
        	options[1] = { label: '가나다라마바사 (10pt)', title: '10pt', data: '10pt', klass: 'tx-10pt' };
        	options[2] = { label: '가나다라마바사 (12pt)', title: '12pt', data: '12pt', klass: 'tx-12pt' };
            options[3] = { label: '가나다라마바사 (18pt)', title: '18pt', data: '18pt', klass: 'tx-18pt' };
        }

        createSelectMenu('titleFontSize', function(size){ PeTitleEditor.applyFontSize(size); }, options);
    },
    applyFontSize: function(size) {
        daum.$('tx_fontsize_text').innerHTML = '<span>' + size + '</span>';
        this.setFocus();
        this.e.style.fontSize = size;
        daum.$('subj3').value = this.getFontNum(size);
    },  
    createBoldButton: function(initVal) {
        var state = initVal ? true : false;

        if (state) $(this.fontBoldId).className = "tx-titleFontBold tx-btn-lbg-pushed";
        createSingleMenu('titleFontBold', function(){PeTitleEditor.applyFontBold();}, {selectedValue: state});
    },
    applyFontBold: function() {
        this.setFocus();
        var fontstyle = this.e.style.fontWeight;
        if (fontstyle=='' || fontstyle=='normal' || fontstyle==400) {
            this.e.style.fontWeight = "bold";
            daum.$('subj1').value = 1;
        } else {
            this.e.style.fontWeight = "normal";
            daum.$('subj1').value = '';
        }
    },
    createColorPalleteButton: function(initVal) {
        var state = initVal ? initVal : "#5c7fb0";
        $(this.fontColorId).style.backgroundColor = state;
        
        createPalleteMenu('titleFontColor', function(color){PeTitleEditor.applyFontColor(color);});
        tx_titletools['titleFontColor'].button.setValue('#5c7fb0');
    },
    applyFontColor: function(color) {
        $(this.fontColorId).style.backgroundColor = color;
        this.setFocus();
        this.e.style.color = color;
        daum.$('subj2').value = color;
    },
    createResetButton: function() {
        createSingleMenu('titleFontReset', function(){PeTitleEditor.applyFontReset();}, {status: false});
    },
    applyFontReset: function() {
    	if (this.isCube && this.defaultFontSize == "9") { 
    		var baseFont = '9pt';
    	} else {
    		var baseFont = '10pt';
    	}
    	try{
	        this.e.style.fontSize = baseFont;
	        this.e.style.fontWeight = 'normal';
	        this.e.style.color = this.resetColor;
	        this.setFocus();
	        
	        daum.$('subj1').value = '';
	        daum.$('subj2').value = this.resetColor;
	        daum.$('subj3').value = '';
	        
	        daum.$('tx_fontsize_text').innerHTML = '<span>' + baseFont + '</span>';
	        tx_titletools['titleFontBold'].button.setState(false);
	        tx_titletools['titleFontColor'].button.elButton.style.backgroundColor = this.resetColor;
	        tx_titletools['titleFontColor'].button.setValue(this.resetColor);
    	}catch(e){}
    },
    overOutResetButton: function() {
        if ($E(this.fontResetId).hasClassName('over')) {
            $(this.fontResetId).className = "";
        } else {
            $(this.fontResetId).className = "over";
        }
    },
    closeIcon: function() {
        $E('wideIcon').hide();
    },
    setFocus: function() {
    	try{
    		this.e.focus();
    	}catch(e){}
    }
};