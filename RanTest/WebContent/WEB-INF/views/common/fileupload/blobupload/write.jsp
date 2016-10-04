<%@ page pageEncoding="utf-8" %>
<%@ include file="/include/include-header.jspf" %>
<head>
<script>
$(document).ready(function() {
	
	$("#write").on('click', function(e) {
		e.preventDefault();
		fn_insertFile();
	});
	
	$("#update").on('click', function(e) {
		e.preventDefault();
		fn_updateFile();
	});
	
	$("#list").on('click', function(e) {
		e.preventDefault();
		fn_goList();
	});
	
});

function fn_insertFile() {
	if($("#file").val() == '') {
		alert("파일을 선택해주세요!");
		return;
	}
	
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/insertFile.do' />");
	comSubmit.submit();
}

function fn_updateFile() {
	if($("#file").val() == '') {
		alert("파일을 선택해주세요!");
		return;
	}
	
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/updateFile.do' />");
	comSubmit.submit();
}

function fn_goList() {
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/list.do' />");
	comSubmit.submit();
}

function previewImage(obj, previewer) {
	if(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(obj.value)) {
		alert("이미지 파일만 업로드 할 수 있습니다.");
		return;
	}
	
	if(window.FileReader) {
		if(obj.files && obj.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$('#'+previewer).attr('src', e.target.result);
				$('#'+previewer).css('width','100px');
				$('#'+previewer).css('height','100px');
			}
			
			reader.readAsDataURL(obj.files[0]);
		}
	}else {
		var img = $('#'+previewer);
		alert(img.src);
		img.src = ("file:///") + encodeURI(obj.value.replace(/\\/g, "/"));
		alert(img.src);
	}
}

function fn_fileDownload(idx) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("/common/fileupload/blobupload/downloadFile.do");
	comSubmit.addParam("idx", idx);
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
				<c:if test="${mode eq 'update'}">
				<input type="hidden" name="idx" id="idx" value="${fileInfo.idx}">
				</c:if>
				<input type="hidden" name="currentPageNo" id="currentPageNo" value="${currentPageNo}" />				
				
				<table class="table table-striped table-bordered table-hover center">
					<tr>
						<td style="width:30%;">IDX</td>
						<td>${fileInfo.idx}</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<div class="col-xs-6 col-md-3">
								<c:if test="${!empty fileInfo.idx}">
									<a href="#" class="thumbnail"><img src="thumnail.do?idx=${fileInfo.idx}" /></a>
								</c:if>
								${fileInfo.file_name}
								<button type="button" name="fileDown" id="fileDown" onclick="fn_fileDownload('${fileInfo.idx}')">파일다운로드</button>
							</div>
						</td>
						
					</tr>
					<tr>
						<td>첨부파일 변경</td>
						<td>
							<span><input type="file" name="file" id="file" onchange="previewImage(this,'previewer')"/></span>
							<span>
								미리보기
								<img id="previewer" />
							</span>
						</td>
					</tr>
					<tr>
						<td>작성자(작성시간)</td>
						<td>
							<c:choose>
								<c:when test="${empty fileInfo.reg_name}"></c:when>
								<c:otherwise>
									${fileInfo.reg_name}(${fileInfo.reg_date})
								</c:otherwise>	
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>수정자(수정시간)</td>
						<td>
							<c:choose>
								<c:when test="${empty fileInfo.update_name}"></c:when>
								<c:otherwise>
									${fileInfo.update_name}(${fileInfo.update_date})
								</c:otherwise>	
							</c:choose>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<div class="pull-right">
		<c:if test="${mode eq 'insert'}">
			<button type="button" class="btn btn-primary" id="write" onclick="fn_insertFile()">입력</button>
		</c:if>
		<c:if test="${mode eq 'update'}">
			<button type="button" class="btn btn-primary" id="update" >수정</button>
		</c:if>
		<button type="button" class="btn btn-primary" id="list">뒤로</button>
	</div>
	
	<template>
	
	</template>

</div>
</nav>	
<%@ include file="/include/include-body.jspf" %>
</body>
