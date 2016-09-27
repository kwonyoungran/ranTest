<%@ page pageEncoding="utf-8" %>
<%@ include file="/include/include-header.jspf" %>
<head>
<script>
$(document).ready(function() {
	$("#title").on('click', function(e) {
		e.preventDefault();
		fn_goWrite($(this));
	});
	
	$("#write").on('click', function(e) {
		e.preventDefault();
		fn_goWrite('0');
	});
});

function fn_goWrite(obj) {
	var idx = 0;
	if(obj != 0) {
		idx = obj.parent().find("idx").val();
	}
	
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/common/fileupload/blobupload/write.do' />");
	comSubmit.addParam("idx", idx);
	comSubmit.submit();
}	
</script>
</head>
<body>
<nav class="navbar navbar-default">
<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">File List</div>
<!-- 		<div class="panel-body">
			* 첨부파일 리스트
		</div> -->
	
		<table class="table table-striped table-hover">
		    <colgroup>
		        <col width="10%"/>
		        <col width="*"/>
		        <col width="20%"/>
		        <col width="20%"/>
		    </colgroup>
		    <thead>
		        <tr>
		            <th scope="col">번호</th>
		            <th scope="col">파일명</th>
		            <th scope="col">작성자</th>
		            <th scope="col">작성일</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<form:form id="frm" name="frm">
		        <c:choose>
		            <c:when test="${fn:length(list) > 0}">
		                <c:forEach items="${list }" var="row">
		                    <tr>
		                        <td>${row.idx}</td>
		                        <td class="title">
		                        	<a href="#this" id="title">${row.file_name}</a>
		                        	<input type="hidden" id="idx" value="${row.idx}">
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
		        </form:form>
		    </tbody>
		</table>
	</div>
	
	<div class="pull-right">
		<a class="btn btn-primary" id="write" >입력</a>
	</div>
	
	<div class="paging">
		<c:if test="${not empty paginationInfo}">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_paging" />
		<input type="hidden" id="currentPageNo" name="currentPageNo" value="${currentPageNo}"/>	
		</c:if>
	</div>
</div>
</nav>	
<%@ include file="/include/include-body.jspf" %>
</body>
