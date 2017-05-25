<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<!-- jQuery 1.12.0 -->
<script src="/common/js/jquery-1.12.0.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/common/js/jquery-1.11.4-ui.min.js"></script>
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
	    	case 2 : 
	    		location.href = "/common/fileupload/excelupload/list.do";
	    		break;
	    	case 3 :
	    		location.href = "/study/jquery/main.do";
	    		break;
	    	case 4 :
	    		location.href = "/study/css/index.jsp";
	    		break;
	    	case 5 : 
	    		location.href = "/study/vue/main.jsp";
	    		break;
	    	default : 
	    		alert("잘못된 경로 입니다.");
	    	}
	    });
	});
	
	//쿠키를 사용할수 있는지
	if(navigator.cookieEnabled) {
		console.log("hi");
	}
</script>
</head>
<body>
	<button>파일업로드</button>
	<button>파일업로드_BLOB</button>
	<button>엑셀업로드</button>
	<button>STUDY &gt; jQuery</button>
	<button>STUDY &gt; CSS</button>
	<button>STUDY &gt; Vue.js</button>
</body>
