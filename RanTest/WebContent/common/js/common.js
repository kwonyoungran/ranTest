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
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
}

//Cookie 설정
function writeCookie(name, value, days) {
	var expires = "";
	
	if(days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		expires = "; expires=" + date.toGMTString();
	}
	
	document.cookie = name + "=" + value + expires + "; path=/";
}

//Cookie 읽기
function readCookie(name) {
	var searchName = name + "=";
	var cookies = document.cookie.split(';');
	for(var i = 0; i < cookies.length; i++) {
		var c = cookies[i];
		while(c.charAt(0) == ' ') {
			c = c.substring(1, c.length);
		
			if(c.indexOf(searchName) == 0) {
				return c.substring(searchName.length, c.length);
			}
		}
	}
	return null;
}

//Cookie 삭제
function eraseCookie(name) {
	writeCookie(name, "", -1);
}

//파일사이즈체크
function checkFileSize(obj, limit) {
	var limitSize = limit * 1024 * 1024;
	var fileLength = obj.length;
	
	for(var i = 0; i < fileLength; i++) {
		if($(obj).val() != '') {
			var fileSize = $(obj).get(i).files[0].size;
			if(fileSize > limitSize) {
				alert("파일사이즈는 " +limit+ "MByte 까지 가능합니다.");
				return false;
			}
		}
	}
	return true;
}










