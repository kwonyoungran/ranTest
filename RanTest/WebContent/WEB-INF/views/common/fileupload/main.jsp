<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<script>
	$(function() {
	  $( "input[type=submit], a, button" )
	    .button()
	    .click(function() {
	    	var index = $("button").index(this);
	    	
	    	switch(index) {
	    	case 0 :
	    		location.href = "/common/fileupload/openBoardList.do";
	    		break;
	    	case 1 :
	    		location.href = "/common/fileupload/blobupload/list.do";
	    		break;
	    	default : 
	    		alert("잘못된 경로 입니다.");
	    	}
	    });
	});
</script>
</head>
<body>
	<button>파일업로드</button>
	<button>파일업로드_BLOB</button>
	<button>엑셀업로드</button>
</body>
