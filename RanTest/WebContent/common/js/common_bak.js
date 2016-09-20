"use strict"

//전역 변수들

var LEFT_MENU = [];
var TOP_MENU = {};
var INVALID_FORMS = [];
var MENU_LIST = [];
var DEPTHS = [];
var AJAX_ARRAY = [];

$.ajaxSetup({
	beforeSend : function(){
		AJAX_ARRAY.push(setTimeout(function(){
			showLoading();
		}, 2000));
	},
	complete : function(){
		if (AJAX_ARRAY.length)
		{
			clearTimeout(AJAX_ARRAY.pop());
		}
		hideLoading();
	},
	error : function(res, status, error){
		console.error("code : " + res.status + "\r\nmessage : " + res.responseText + "\r\error : " + error);
		if (res.status == 401) {
			// unauthorized
			location.href = '/exception/reject.do';
		}
	}
});

$(function(){	
	var resetSlider = function(){
		var $slider = $("#topBar .slider");
		var $ul = $slider.children("ul").first();
		$ul.siblings().remove();
		$slider.css({
			left : 0,
			height : $ul.children("li").length * 60
		});
		DEPTHS = [];
	};
	
	//아이폰, 아이패드, 안드로이드일 경우
	if (/iPhone|iPad|iPod|Android/i.test(navigator.userAgent))
	{
		$("body").click(function(){
			if ($(window).width() < 680)
			{
				$("#topBar").slideUp(100);
				resetSlider();
			}
		});
	}
	
	$(window).on("resize", function() {
		if ($(window).width() >= 680)
		{
			$("#topBar").show().width("initial");
			$(".slider").width("initial");
			resetSlider();
		}	     
	});
	
	//numberOnly
	$(document).on("keydown", ".numberOnly, [numberonly]", function(e) {
		var v = e.which;
		if (!((v >= 48 && v <= 57) || (v >= 96 && v <= 105) || v == 8 || v == 9)) e.preventDefault();
	});
	
	//페이지 스크롤
	TOP_MENU.position = "relative";
	$(window).scroll(function(){
		var scrollY = window.scrollY || window.pageYOffset;
		if (scrollY >= 30)
		{
			if (TOP_MENU.position == "relative")
			{
				$("body").addClass("compact");				
				TOP_MENU.position = "fixed";

			}
		}
		else if (TOP_MENU.position == "fixed")
		{
			$("body").removeClass("compact");
			TOP_MENU.position = "relative";
		}
	});
	
	//경로 만들기
	if (TOP_MENU.title)
	{
		var path = [TOP_MENU.title];
		for(var i in LEFT_MENU)
		{
			if (LEFT_MENU[i].active)
			{
				path.push(LEFT_MENU[i].title);
			}
			
			for(var ii in LEFT_MENU[i].sub)
			{
				if (LEFT_MENU[i].sub[ii].active)
				{
					path.push(LEFT_MENU[i].sub[ii].title);
					break;
				}
				
				for(var iii in LEFT_MENU[i].sub[ii].sub)
				{
					if (LEFT_MENU[i].sub[ii].sub[iii].active)
					{
						path.push(LEFT_MENU[i].sub[ii].sub[iii].title);
						break;
					}
				}
			}
		}

		i = 0;
		$("main").prepend("<div id=\"pwd\"></div>");
		for(var i in path)
		{
			$("#pwd").append("<span>" + path[i] + "</span>");
		}
	}
	
	//왼쪽 메뉴 만들기 from LEFT_MENU
	$("nav").append("<div id=\"topMenuTitle\" class=\"fa " + TOP_MENU.className + "\">" + TOP_MENU.title + "</div>");
	if (!$("nav").children("ul").length) $("nav").append("<ul />");
	var $ul = $("nav ul");
	
	for(var i in LEFT_MENU)
	{
		var menu = LEFT_MENU[i];
		var $li = $("<li />");		
		if (menu.url)
		{
			$li.html("<a href=\"" + menu.url + "\">" + menu.title + "</a>");
		}
		else
		{
			$li.text(menu.title);
		}
		
		//$li.text(menu.title);
		if (menu.active) $li.addClass("on");
		$li.addClass("main");
		$ul.append($li);
		
		for (var ii in menu.sub)
		{
			$li = $("<li />");		
			if (menu.sub[ii].url)
			{
				$li.html("<a href=\"" + menu.sub[ii].url + "\">" + menu.sub[ii].title + "</a>");
			}
			else
			{
				$li.text(menu.sub[ii].title);
			}
			
			if (menu.sub[ii].active) $li.addClass("on");
			$li.addClass("sub");
			$ul.append($li);
			for(var iii in menu.sub[ii].sub)
			{
				console.log(iii);
				$li = $("<li />");		
				if (menu.sub[ii].sub[iii].url)
				{
					$li.html("<a href=\"" + menu.sub[ii].sub[iii].url + "\">" + menu.sub[ii].sub[iii].title + "</a>");
				}
				else
				{
					$li.text(menu.sub[ii].sub[iii].title);
				}
				
				if (menu.sub[ii].sub[iii].active) $li.addClass("on");
				$li.addClass("sub2");
				$ul.append($li);
			}
		}
	}
	
	//왼쪽 메뉴 열고 닫기
	/* $("nav li.fa:not([class*='sub'])").click(function(){
		var $target = $(this).nextUntil("li:not([class*='sub'])");
		if ($(this).next("[class*='sub']").css("display") == "none")
		{
			$(this).removeClass("fa-plus");
			$(this).addClass("fa-minus");			
		}
		else
		{
			$(this).removeClass("fa-minus");
			$(this).addClass("fa-plus");
		}
		
		$target.slideToggle();
	}); */
	
	//select2
	var $select2 = $("select").select2();
	
	//select2 + validation
	$select2.on("change", function(e){
		var $form = $(this).closest("form");
		if ($form.length && $form.data("validator"))
		{
			checkValidHandler(e, $form);
		}
	});
	
	//웹뷰
	if (WEBVIEW)
	{
		$("header, nav").remove();
		$("body").css("background", "#eeeff3");
		$("main").css("margin", 0);
	}
	
	//컴팩트용 로그아웃 버튼
	$("#logoutButton").click(function(e){
		e.stopPropagation();
		if (confirm("로그아웃 하시겠습니까?"))
		{
			location.href = "/login/logout.do";
		}
	});

	//컴팩트용 메뉴 버튼
	$("#navButton").click(function(e){
		e.stopPropagation();
		
		$("#topBar").slideToggle(100);
	});
	
	//탑메뉴 이동
	$("#topBar .slider").height($(".slider li").length * 60);

	//왼쪽메뉴 링크 바인딩
	$("#topBar .slider").on("click", "li", function(e){
		e.stopPropagation();
		var url = undefined;
		if ($(this).css("display") != "block")
		{
			url = $(this).data("href");
		}
		else
		{
			$(this).closest("ul").find("button.on").removeClass("on");
			$(this).children("button").addClass("on");
		
			if (DEPTHS.length !== 0 && $(this).attr("data-href"))
			{
				url = $(this).data("href");
			}
			else
			{	
				var idx = $(this).index();
				DEPTHS.push(idx);
				var unit = $("#topBar").width();

				$("#topBar").width(unit);
				
				var ary = MENU_LIST;
				for(var i = 0, n = DEPTHS.length; i < n; i++)
				{
					ary = ary[DEPTHS[i]].sub;
				}
	
				var $ul = $("<ul />");
				for(var i in ary)
				{
					var $li = $("<li><button type=\"button\">" + ary[i].title + "</button></li>");
					var link = undefined;
					if (ary[i].active) $li.children("button").addClass("on");
					if (ary[i].url) link = ary[i].url;
					if (link) $li.attr("data-href", link);
					
					$ul.append($li);
				}
				
				$ul.appendTo("#topBar .slider");
				var width = $(".slider").width() + $ul.width();
				var $before = $(".slider").children("ul").eq(DEPTHS.length - 1);
				var left = ($before.position().left + $before.width()) * -1;
				$(".slider").css({
					left : left,
					width : width + 1,
					height : $ul.height()
				});
			}
		}

		if (url) location.href = url;
	});
});


//for validation
function checkValidHandler(e, validator)
{
	if (validator.currentTarget)
	{
		var $form = $(validator.currentTarget).closest("form");
	}
	else
	{
		var $form = validator;
	}
	//var $form = $(validator.currentTarget ? validator.currentTarget.closest("form") : validator);
	
	if ($form.length)
	{
		var id = getSetId($form);
		if (INVALID_FORMS.indexOf(id) > -1)
		{
			var $button = $form.data("validator").settings.submitButton;
			if ($form.valid())
			{
				$button.removeAttr("disabled")
			}
			else
			{
				$button.attr("disabled", "disabled");				
			}
		}
	}
}

//for validation
function invalidHandler (e, validator)
{
	var $form = $(validator.currentForm);
	var id = getSetId($form);
	var inHere = false;
	
	if (INVALID_FORMS.indexOf(id) > -1) inHere = true;
	
	if (!inHere)
	{
		INVALID_FORMS.push(id);
		var $button = $form.data("validator").settings.submitButton;
		$button.attr("disabled", "disabled");
	}
}

//get or set id
function getSetId(element)
{
	if (!$(element).length) return;
	element = $(element).eq(0);
	if (!$(element).attr("id"))
	{
		var tagName = $(element).get(0).tagName.toLowerCase();
		var id = id = tagName + "_" + getRandomId() + getRandomId();
		while ($(id).length)
		{
			id = tagName + "_" + getRandomId() + getRandomId();
		}
		$(element).attr("id", id);
		return id;
	}
	else
	{
		return $(element).attr("id");
	}
	
	function getRandomId()
	{
		return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	}
}

/* 콤마찍기 */
var comma = function(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
};

/* 콤마해제 */
var uncomma = function(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
};

/* 달력생성_onlyOneDate */
var setDate = function(id, maxDate){
	if (/iPhone|iPad|Android/.test(navigator.userAgent))
	{
		$("#" + id).attr("type", "date");
	}
	else
	{
	    $("#" + id).datepicker({
			dateFormat			:'yy-mm-dd'
			,buttonText			: "Show Calendar"
			,buttonImageOnly	: true
			,showOn				: "focus"
			,showMonthAfterYear : true	
			/*,buttonImage		: "/common/images/calBg.gif"*/
			,monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
	    	,yearSuffix: "년"
	    	,maxDate : maxDate
		})
		.addClass("calIcon");	    
	}
};

/* 달력생성_startDate & endDate */
var setStartEndDate = function(startId, endId, maxDate){
	
	if (/iPhone|iPad|Android/.test(navigator.userAgent))
	{
		$("#" + startId).attr("type", "date");
		$("#" + endId).attr("type", "date");
	}
	else
	{
		
	    $("#"+startId).datepicker({
			dateFormat			:'yy-mm-dd'
			,buttonText			: "Show Calendar"
			,buttonImageOnly	: true
			,showOn				: "focus"
	//		,buttonImage		: "/images/common/btn/icon_calendar.png"
			,showMonthAfterYear : true	
	    	,yearSuffix: "년"
			,monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
	    	,maxDate : maxDate
			,onClose:function(selectedDate){
				$("#"+endId).datepicker("option", "minDate", selectedDate);
				$("img.ui-datepicker-trigger").attr("style", "margin-top:-2px; margin-left:1px; vertical-align:middle; cursor: Pointer;");
			}
		})	
		.addClass("calIcon");

	
		$("#"+endId).datepicker({
				dateFormat			:'yy-mm-dd'
				,buttonText			: "Show Calendar"
				,buttonImageOnly	: true
				,showOn				: "focus"
	//			,buttonImage		: "/console/image/btn/icon_calendar.png"
				,showMonthAfterYear : true	
		    	,yearSuffix: "년"
				,monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]	
				,maxDate : maxDate
				,onClose:function(selectedDate){
					$("#"+startId).datepicker("option", "maxDate", selectedDate);
					$("img.ui-datepicker-trigger").attr("style", "margin-top:-2px; margin-left:1px; vertical-align:middle; cursor: Pointer;");
				}
		})  
		.addClass("calIcon");
	}
	//$("img.ui-datepicker-trigger").attr("style", "margin-top:-2px; margin-left:1px; vertical-align:middle; cursor: Pointer;");
};

/*공통 스크립트*/

/*  
 * 같은 값이 있는 열을 병합함
 * 사용법 : $('#테이블 ID').rowspan(0);
 */    
$.fn.rowspan = function(colIdx, isStats) {       
    return this.each(function(){      
        var that;     
        $('tr', this).each(function(row) {      
            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
                 
                if ($(this).html() == $(that).html()
                    && (!isStats 
                            || isStats && $(this).prev().html() == $(that).prev().html()
                            )
                    ) {            
                    var rowspan = $(that).attr("rowspan") || 1;
                    rowspan = Number(rowspan)+1;
 
                    $(that).attr("rowspan",rowspan);
                     
                    // do your action for the colspan cell here            
                    $(this).hide();
                     
                    //$(this).remove(); 
                    // do your action for the old cell here
                     
                } else {            
                    that = this;         
                }          
                 
                // set the that if not already set
                that = (that == null) ? this : that;      
            });     
        });    
    });  
}; 
 
/* 
 * 같은 값이 있는 행을 병합함
 * 사용법 : $('#테이블 ID').colspan (0);
 */  
$.fn.colspan = function(rowIdx) {
    return this.each(function(){
        var that;
        $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
            $(this).find('th').filter(':visible').each(function(col) {
                if ($(this).html() == $(that).html()) {
                    var colspan = $(that).attr("colSpan") || 1;
                    colspan = Number(colspan)+1;
                     
                    $(that).attr("colSpan",colspan);
                    $(this).hide(); // .remove();
                } else {
                    that = this;
                }
                 
                // set the that if not already set
                that = (that == null) ? this : that;
                 
            });
        });
    });
};


function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	this.reset = function reset() {
		$("#"+this.formId).empty();
	};
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.addParam = function addParam(key, value) {
		var $key = $("#" + key, '#' + this.formId);
		if ($key.length == 0) {
			$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
		} else {
			$key.val(value);
		}
	};
	
	this.submit = function submit() {
		var frm = $("#"+this.formId)[0];
		frm.action = this.url || frm.action;
		frm.method = "post";
		frm.submit();
	};
}

//쿠키읽기
function getCookie(search)
{	
	var array = document.cookie.split(";");
	var cookie = {};
	for(var i in array)
	{
		var a = array[i].split("=").map(function(value){
			 return value.trim();
		});
		cookie[a[0]] = a[1];
	}
	
	if (search)
	{
		return cookie[search];		
	}
	else
	{
		return cookie;
	}
}

//쿠키쓰기
function setCookie(name, value, expires)
{	
	var cookie = [name, "=", escape(value), "; expires=Thu, 01 Jan 9999 00:00:01 GMT; path=/"];
//	if (expires) cookie.push("; expires=", expires);
	document.cookie = cookie.join("");
}

/* 쿠키- 화면에 쿠키에 저장된 값들 display 하기 (각 화면의 number 값은 fn_setCookie의 number 값과 일치해야 함) */
function fn_displayCookie(number) {
	var nameArray = getCookie(number + "nameArray");
	if(nameArray != undefined) {
		nameArray = nameArray.split("%2C");
	} else {
		return;
	}
  
	//쿠키 저장하지 않기
	$("#remember-value").click(function(){
		if(!$(this).prop("checked")){			
			setCookie(number + "remember-value" + "=; expires=Thu, 01 Jan 1970 00:00:01 GMT;");
			for(var i in nameArray){
				$("#" + nameArray[i].substring(1)).val("");
			}
			$("select").change();
		}	
	});
	
	var remeberValue = getCookie(number + "remember-value");
	if(remeberValue){	
		 $("#remember-value").prop("checked", true);		 
		for(var j in nameArray){
			var data = getCookie(nameArray[j]); //쿠키 값
			$("#" + nameArray[j].substring(1)).val(unescape(data));
		}
   	 $("select").change();
	}
}
	
/*쿠키 - 화면 전체 값 쿠키에 저장하기 (각 화면의 number 값은 fn_displayCookie의 number 값과 일치해야 함) */
function fn_setCookie(form, number){   	
	var obj = $("#"+form).serializeArray();
	if($("#remember-value").prop("checked")){
		setCookie(number + "remember-value", "Y");
		var nameArray = [];
		for (var i in obj){
			setCookie(number + obj[i].name, obj[i].value);	
			nameArray.push(number + obj[i].name);
		}
		setCookie(number + "nameArray", nameArray);
	}
};

function showDim()
{
	if (!$("#dim").length) $("body").append("<div id=\"dim\" />");
	$("#dim").fadeIn();
}

function showLoading()
{
	showDim();
	if (!$("#progress").length) $("body").append("<div id=\"progress\" />");
	if (!$("#progress #pBar").length) $("#progress").append("<div id=\"pBar\" />");
	$("#progress").fadeIn();
}

function hideLoading()
{
	$("#dim").fadeOut();
	$("#progress").fadeOut();
}

/**앞뒤 공백 제거 - trim*/
function fn_trim(id){	
	for(var i in $("#" + id).serializeArray()){
		$("#" +	$("#" + id).serializeArray()[i].name).val( $("#" + id).serializeArray()[i].value.trim()); 	
	}
}

function getStringByteLength(str) {
	var b, i, c;
	for(b=i=0;c=str.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	return b;
}

function isNumber(val) {
	return /^\d*$/.test(val);
}

// 에러 메시지 추가
$.fn.error = function(msg) {

	var $error = this.nextAll().filter('.error');
	
	// 에러 메시지 추가
	if ($error.length == 0) {
		this.parent().append("<span class='error' style='display:none;'></span>");
		$error = this.parent().children().last();
	}
	
	if (msg) {
		// 메시지가 있을 경우 메시지를 보여주고
		$error.text(msg);
		$error.show();
	} else {
		$error.hide();
	}
	
	return this;
};

//Whenever CKEditor get focus. We will show the toolbar span.
function showToolBarDiv(event) {
    //'event.editor.id' returns the id of the spans used in ckeditr.
    $('#'+event.editor.id+'_top').show();
}

function hideToolBarDiv(event) {                    
    //'event.editor.id' returns the id of the spans used in ckeditr.
    $('#'+event.editor.id+'_top').hide();
}

//개인정보 수정
function changeUserInfo(){
	window.open('/login/modify.do', '','width=682, height=750');	
}

//숫자 천단위 마다 쉼표 찍기
function fn_numberComma(val){
	return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");	
}

//digit format "00" 으로 변환하기
function nFormat(n){
	return n > 9? "" + n: "0" + n;
}

//"00" digit를 자연수로 변환하기 (예 : "02" => "2" )
function naturalFormat(n){
	return n > 9? "" + n: n%10;
}

//월별 검색기간 유효성 검사
function yyyymmValidation(startYearMonth, endYearMonth, e){

	//현재 날짜- yyyyMM
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	if(month < 10){
		month = "0" + month;
	}
	var todayYearMonth = year + month;
	
	if(startYearMonth > todayYearMonth){
		alert("검색 시작일을 확인 해주세요!");
		return false;
	}
	
	if(endYearMonth > todayYearMonth){
		alert("검색 종료을 확인 해주세요!");
		return false;
	}
	
	if(startYearMonth > endYearMonth){
		alert("검색 기간을 확인 해주세요!");
		return false;
	}
	return true;
}
//옵션값 가져오기
function getOption(){ 
	$("#channel_code").val($("#sel_channel_code").val());
	$("#membership_code").val($("#sel_membership_code").val());
	$("#client_code").val($("#sel_client_code").val());
	$.ajax({
		url : "/common/getOption.do",
		data : $("#frmMain").serialize(),
		type : "post",
		datatype : "json",
		error : function (data){
			alert("처리 중 오류가 발생하였습니다.");
		},
		success : function (data){
			setOption(data);
		}
	});
}
//옵션값 셋팅
function setOption(data){
	var jsonData = JSON.parse(data);
 	var channelList = jsonData.channelList;
 	var clientList = jsonData.clientList; 	
 	var membershipList = jsonData.membershipList;
 	var channel_code = jsonData.channel_code;
 	var client_code = jsonData.client_code; 	
 	var membership_code = jsonData.membership_code;
 	 
 	if($("#sel_channel_code option").size() > 0){
 		$("#sel_channel_code option").remove();
 	}
 	
	if($("#sel_client_code option").size() > 0){
 		$("#sel_client_code option").remove();
 	} 	
 	
 	if($("#sel_membership_code option").size() > 0){
		$("#sel_membership_code option").remove();
	}

	for(var i = 0; i < channelList.length; i++){
		var channelOption = channelList[i];
		$("#sel_channel_code").append("<option value='"+channelOption.channel_code+"'>"+channelOption.channel_name+"</option>");
	}
	
	for(var i = 0; i < clientList.length; i++){
		var clientOption = clientList[i];
		$("#sel_client_code").append("<option value='"+clientOption.client_code+"'>"+clientOption.client_name+"</option>");
	}	
	
	for(var i = 0; i < membershipList.length; i++){
		var membershipOption = membershipList[i];
		$("#sel_membership_code").append("<option value='"+membershipOption.membership_code+"'>"+membershipOption.membership_name+"</option>");
	}	

	$("#sel_channel_code").prepend("<option value=''></option>");
	$("#sel_client_code").prepend("<option value=''></option>");	
	$("#sel_membership_code").prepend("<option value=''></option>");
	
	$("#sel_channel_code").val(channel_code).attr("selected", "selected");
	$("#sel_client_code").val(client_code).attr("selected", "selected");	
	$("#sel_membership_code").val(membership_code).attr("selected", "selected");	
}

//jquery popup 센터 잡기
$.fn.center = function(ani)
{
	var _H = $(window).height();
	var _W = $(window).width();
	
	if ($(this).offset().top < $(window).scrollTop() + 10) $(this).css("top", $(window).scrollTop() + 10);
	if ($(this).outerHeight() >= $(window).height())
	{
		var padding = parseInt($(this).css("paddingTop")) + parseInt($(this).css("paddingBottom"));
		var border = parseInt($(this).css("borderTopWidth")) + parseInt($(this).css("borderBottomWidth"));
		$(this).height($(window).height() - padding - border - 40);
		//$(this).css("overflow-y", "auto");
	}

	if ($(this).width() >= $(window).width())
	{
		var padding = parseInt($(this).css("paddingLeft")) + parseInt($(this).css("paddingRight"));
		var border = parseInt($(this).css("borderTopLeft")) + parseInt($(this).css("borderBottomRight"));
		$(this).width($(window).width() - padding - border - 40);
		$(this).css("overflow-x", "auto");
	}
	
	$(this).each(function(){
		var h = Math.floor((_H/2) - ($(this).outerHeight(false)/2) + $(window).scrollTop());
		var w = Math.floor((_W/2) - ($(this).outerWidth(false)/2) + $(window).scrollLeft());
		if($(this).css("position") == "fixed")
		{
			h -= $(window).scrollTop();
			w -= $(window).scrollLeft();
		}
		else
		{
			$(this).css("position", "absolute");			
		}
		
		if (ani)
		{
			$(this).animate({ top : h, left : w });
		}
		else
		{
			$(this).css({ top : h, left : w });
		}
	});
	return this;
};