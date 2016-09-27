<%@ page pageEncoding="utf-8" %>
<%@ include file="/include/include-header.jspf" %>
<head>
<script>
$(document).ready(function() {
	$("#write").on('click', function(e) {
		e.preventDefault();
		fn_insertFile();
	});
});

function fn_insertFile() {
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/insertFile.do' />");
	comSubmit.submit();
}
</script>
</head>
<body>
<nav class="navbar navbar-default">
<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">File 입력</div>
		<div class="panel-body">
			<form name="frm" id="frm" enctype="multipart/form-data">
				<table>
					<tr>
						<td><input type="file" name="file"></td>
					</tr>
				</table>
			</form>
		</div>
	
		
	</div>
	<div class="pull-right">
		<a class="btn btn-primary" id="write" >입력</a>
	</div>
</div>
</nav>	
<%@ include file="/include/include-body.jspf" %>
</body>
