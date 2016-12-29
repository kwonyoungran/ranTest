<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/include-header.jspf" %>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<style type="text/css">


  p {
    color: blue;
    margin: 8px;
  }
 

</style>

<script>

$(document).ready(function() {
	
	$( "input" )
	  .keyup(function() {
	    var value = $( this ).val();
	    $( "p" ).text( value );
	  })
	  .keyup();
	
});

</script>

</head>
<body>

<input type="text" value="some text">
<p></p>

<%@ include file="/include/include-body.jspf" %>
</body>
</html>