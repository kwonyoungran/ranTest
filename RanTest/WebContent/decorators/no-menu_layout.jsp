<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ include file="/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/include/headTags.jsp" %>
	<decorator:head></decorator:head>
	<style type="text/css">
	body { background-image:none; background-color:#ffffff }
	main { max-width:none }
	</style>
</head>
<body>
	<main><decorator:body /></main>
</body>
</html>