<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/include-header.jspf" %>
<c:choose>
	<c:when test="${sessionScope.IMS_ROLE_CODE eq '5000'}"><div id="logo_1"></div></c:when>
	<c:otherwise><a href="/main/main.do" id="logo"></a></c:otherwise>
</c:choose>


<section id="topBar">
	<div class="slider">
		<ul>
		</ul>
	</div>
</section>
<script type="text/javascript">
"use strict"

//TOP_MENU 와 #topBar 엘리먼트 생성
var $ul = $("#topBar .slider ul");
$ul.empty();
for(var i in MENU_LIST)
{
	var data = MENU_LIST[i];
	var $li = $("<li />");
	var $button = $("<button type=\"button\" class=\"fa\">" + data.title + "</button>");
	
	var className = undefined;
	switch (data.title)
	{
		case "통계":
			className = "fa-bar-chart";
			break;
		case "관리/환경설정":			
			className = "fa-gear";
			break;
		default:
			className = "fa-list-alt";
			break;
	}	

	if (data.active)
	{
		$button.addClass("on");
		TOP_MENU.title = data.title;
		TOP_MENU.className = className;
	}
	
	$button.addClass(className);
	$li.attr("data-href", data.url)
	.append($button)
	.appendTo($ul);
}

$(function(){
<c:if test="${sessionScope.IMS_ROLE_CODE eq '5000'}">
	$("#pwd").prepend("<i class='fa fa-home'/></div>");
</c:if>
<c:if test="${sessionScope.IMS_ROLE_CODE ne '5000'}">
	$("#pwd").prepend("<a href='/main/main.do'><i class='fa fa-home'/></a>");
</c:if>
});
</script>
<section id="infoBox">
<c:if test="${not empty sessionScope.IMS_ID }">
	<span class="fa fa-user">${sessionScope.IMS_USER_NAME} 님 환영합니다.</span>
	<c:choose>
		<c:when test="${sessionScope.IMS_ROLE_CODE eq '5000'}"><span><a href="" style="cursor:default">개인정보수정</a><a href="/login/logout.do" target="_top" class="hover">로그아웃</a></span></c:when>
		<c:otherwise><span><a href="javascript:changeUserInfo()" class="hover">개인정보수정</a><a href="/login/logout.do" target="_top" class="hover">로그아웃</a></span></c:otherwise>	
	</c:choose>      
</c:if>
</section>
<div id="logoutButton" class="fa fa-power-off"></div>
<div id="navButton" class="fa fa-navicon"></div>