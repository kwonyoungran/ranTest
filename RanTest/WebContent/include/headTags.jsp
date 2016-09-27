<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="now" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Welcome to Hanandong</title>
<link href="/common/css/jquery-1.11.4-ui.css" rel="stylesheet">
<link href="/common/css/select2-4.0.1.css" rel="stylesheet">
<link href="/common/css/common.css" rel="stylesheet">
<link href="/common/css/font-awesome.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="/common/js/jquery-1.12.0.min.js"></script>
<script src="/common/js/jquery-1.11.4-ui.min.js"></script>
<script src="/common/js/jquery.validate-1.14.0.js"></script>
<script src="/common/js/select2-4.0.1.js"></script>
<script src="/common/js/common.js"></script>
<script type="text/javascript">
<!-- 메뉴생성 -->
var WEBVIEW = false;
if ("<c:out value="${webview}" />")	WEBVIEW = true;

(function(){
	
	//MENU_LIST 객체 생성
	var getDir = function(url){
		return url.replace(/\/([^\/]*)$/, "");
	};
	var current = getDir(location.pathname);
	 
	<c:if test="${not empty menuMapList}">
		<c:forEach items="${menuMapList}" var="topMenu">
			var topMenu = {
				title : "${topMenu.title}"  
			};	
			<c:if test="${not empty topMenu.url}">
				topMenu.url = "${topMenu.url}";
				if (current == getDir(topMenu.url)) topMenu.active = true;
			</c:if>
			<c:if test="${not empty topMenu.sub}">
				var sub = [];
				<c:forEach items="${topMenu.sub}" var="data">
					var menu = {
						title : "${data.title}"
					};
					<c:if test="${not empty data.url}">
						menu.url = "${data.url}";
						if (current == getDir(menu.url))
						{
							menu.active = true;
							topMenu.active = true;
						}
					</c:if>
					<c:if test="${not empty data.sub}">
						var sub2 = [];
						<c:forEach items="${data.sub}" var="data2">
							var menu2 = {
								title : "${data2.title}"	
							};
							<c:if test="${not empty data2.url}">
								menu2.url = "${data2.url}";
								if (current == getDir(menu2.url))
								{
									menu2.active = true;
									menu.active = true;
									topMenu.active = true;
								}
							</c:if>
							<c:if test="${not empty data2.sub}">
								var sub3 = [];
								<c:forEach items="${data2.sub}" var="data3">
									var menu3 = {
										title : "${data3.title}"
									};
									<c:if test="${not empty data3.url}">
										menu3.url = "${data3.url}";
										if (current == getDir(menu3.url))
										{
											menu3.active = true;
											menu2.active = true;
											menu.active = true;
											topMenu.active = true;
										}
									</c:if>
									<c:if test="${not empty data3.sub}">
										var sub4 = [];
										<c:forEach items="${data3.sub}" var="data4">
											var menu4 = {
												title : "${data4.title}"
											};
											<c:if test="${not empty data4.url}">
												menu4.url = "${data4.url}";
												if (current == getDir(menu4.url))
												{
													menu4.active = true;
													menu3.active = true;
													menu2.active = true;
													menu.active = true;
													topMenu.active = true;
												}
											</c:if>
											sub4.push(menu4);
										</c:forEach>
										menu3.sub = sub4;
									</c:if>
									sub3.push(menu3);
								</c:forEach>
								menu2.sub = sub3;
							</c:if>
							sub2.push(menu2);
						</c:forEach>
						menu.sub = sub2;
					</c:if>
					sub.push(menu);
				</c:forEach>
				topMenu.sub = sub;
			</c:if>
		MENU_LIST.push(topMenu);
		</c:forEach>
	</c:if>
})();
</script>