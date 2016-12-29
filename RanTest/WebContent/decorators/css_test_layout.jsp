<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Welcome IMS</title>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/common/bootstrap-3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/common/bootstrap-3.3.7/css/bootstrap-theme.min.css"> -->

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- jquery-ui -->
<link rel="stylesheet" href="/common/css/jquery-1.11.4-ui.css">

<!-- normalize.css -->
<link rel="stylesheet" href="/common/css/normalize.css">

<!-- datepicker -->
<link rel="stylesheet" href="/study/css/bootstrap-datepicker-1.6.4/css/bootstrap-datepicker3.css">

<!-- select2 -->
<link rel="stylesheet" href="/study/css/select2-4.0.3/select2.min.css">

<!-- daterangepicker -->
<link rel="stylesheet" href="/study/css/bootstrap-daterangepicker/daterangepicker.css">

<!-- dataTable -->
<link rel="stylesheet"href="/study/css/DataTables-1.10.13/jquery.dataTables.min.css">

<!-- adminLTE(소스변경할것) -->
<link rel="stylesheet" href="/study/css/AdminLTE.min.css">

<!-- common.css -->
<link rel="stylesheet" href="/study/css/common.css">



<!-- jQuery 1.12.0 -->
<script src="/common/js/jquery-1.12.0.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="/common/js/jquery-1.11.4-ui.min.js"></script>

<!-- Bootstrap 3.3.6 -->
<script src="/common/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap datepicker -->
<script src="/study/css/bootstrap-datepicker-1.6.4/js/bootstrap-datepicker.min.js"></script>
<script src="/study/css/bootstrap-datepicker-1.6.4/locales/bootstrap-datepicker.kr.min.js" charset="UTF-8"></script>

<!-- select2 -->
<script src="/study/css/select2-4.0.3/select2.min.js"></script>

<!-- daterangerpicker -->
<script src="/study/css/bootstrap-daterangepicker/moment.min.js"></script>
<script src="/study/css/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- dataTable -->
<script src="/study/css/DataTables-1.10.13/jquery.dataTables.min.js"></script>

<!-- AdminLTE(소스변경할것) -->
<script src="/study/css/AdminLTE/dist/js/app.min.js"></script>

<!-- Common script -->
<script src="/study/css/common.js"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<decorator:head></decorator:head>
</head>
<body>
	<%@ include file="/study/css/top.jsp"%>
	<div class="container-fluid">
		<main><decorator:body /></main>
	</div>
	<footer class="container-fluid">
	  	<span class="pull-left"><img src="/common/images/mcomLogo.png" />서울 서초구 강남대로 479 (반포동748-2) POSCO SS&CC타워 6층  |  02-2058-2451</span>
		<span class="pull-right">COPYRIGHT@2016 BY MCOMPLUS All Rights Reserved</span>
	</footer>
	

</body>
</html>