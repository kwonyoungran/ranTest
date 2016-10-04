<%@ page pageEncoding="utf-8" %>
<%@ include file="/include/include-header.jspf" %>
<head>
<script>

<c:if test="${not empty alertSaved}">
alert('${alertSaved}');
</c:if>

$(document).ready(function() {
	
	$("#write").on('click', function(e) {
		e.preventDefault();
		fn_goWrite('0');
	});
	$("#delete").on('click', function(e) {
		e.preventDefault();
		fn_goDelete();
	});
	
});

function fn_goWrite(obj) {
	
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/write.do' />");
	comSubmit.addParam("idx", obj);
	comSubmit.addParam("currentPageNo", $("#currentPageNo").val())
	comSubmit.submit();
}	

function fn_goList() {
	var comSubmit = new ComSubmit('frm');
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/list.do' />");
	comSubmit.submit();
}

function fn_paging(pageNum) {
	$("#currentPageNo").val(pageNum);
	fn_goList();
}

function fn_goDelete() {
	var idx = '';
	$("input[name='idx']").each(function(e) {
		if($(this).is(":checked")) {
			idx = $(this).val();
		} 
	});
	
	if(idx == '') {
		alert("삭제할 파일을 선택해주세요!")
		return;
	}
	
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("/common/fileupload/blobupload/deleteFile.do");
	comSubmit.addParam("idx", idx);
	comSubmit.submit();
}

</script>
</head>
<body>
<nav class="navbar navbar-default">
<div class="container">
<form id="frm" name="frm">
	<div class="panel panel-default">
		<div class="panel-heading">File List</div>
		<table id="tb_fileList" class="table table-striped table-bordered table-hover center">
		    <thead>
		        <tr>
		        	<th>선택</th>
		            <th>번호</th>
		            <th>파일명</th>
		            <th>미리보기</th>
		            <th>작성자</th>
		            <th>작성일</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:choose>
		            <c:when test="${fn:length(list) > 0}">
		                <c:forEach items="${list }" var="row">
		                    <tr>
		                    	<td>
		                        	<input type="radio" name="idx" id="idx" value="${row.idx}" />
		                    	</td>
		                        <td>
		                        	${row.idx}
		                        </td>
		                        <td class="pointer" onclick="fn_goWrite('${row.idx}')">
		                        	${row.file_name}
		                        </td>
		                        <td>
		                        	<c:set var="imageExt" value="${fn:substringAfter(row.file_name,'.')}"/>
		                        	<c:choose>
			                        	<c:when test="${(imageExt eq 'png') or (imageExt eq 'gif') or (imageExt eq 'bmp') or (imageExt eq 'jpg')}">
					                        <div style="width:100px; height:100px;">
					                        	<img class="thumnail" src="thumnail.do?idx=${row.idx}" style="width:100%; height:100%;" />
					                        </div>
			                        	</c:when>
			                        	<c:otherwise>
											미리보기 제공없음		                        	
			                        	</c:otherwise>
		                        	</c:choose>
		                        </td>	
		                        <td>${row.reg_name}</td>
		                        <td>${row.reg_date}</td>
		                    </tr>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                <tr>
		                    <td colspan="4">조회된 결과가 없습니다.</td>
		                </tr>
		            </c:otherwise>
		        </c:choose>
		        
		    </tbody>
		</table>
	</div>
	
	<div class="pull-right">
		<a class="btn btn-primary" id="write">입력</a>
		<a class="btn btn-primary" id="delete">삭제</a>
	</div>
	
	<div class="paging">
		<c:if test="${not empty paginationInfo}">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_paging" />
		<input type="hidden" id="currentPageNo" name="currentPageNo" value="${currentPageNo}"/>	
		</c:if>
	</div>
</form>	
</div>
</nav>	
<%@ include file="/include/include-body.jspf" %>
</body>
