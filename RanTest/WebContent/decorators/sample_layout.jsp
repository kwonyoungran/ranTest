<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ include file="/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/include/headTags.jsp" %>
	<decorator:head></decorator:head>
	<style type="text/css">
	main { margin-left:181px }
	</style>
</head>
<body>
	<main><decorator:body></decorator:body></main>
	<nav><%@ include file="/include/leftMenu.jsp" %></nav>
	<header><%@ include file="/include/topMenu.jsp" %></header>
	<footer><%@ include file="/include/footer.jsp" %></footer>
</body>
</html>