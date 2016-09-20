<%@ page pageEncoding="utf-8"%>
<head>
<%@ include file="/include/include-header.jspf" %>
<script type="text/javascript">
$(document).ready(function() {

	$("#write").on("click", function(e) {
		e.preventDefault();
		fn_openBoardWrite();
	});
	
	$("a[name='title']").on("click", function(e) {
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
});

function fn_openBoardWrite() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/common/fileupload/openBoardWrite.do' />");
	comSubmit.submit();
}

function fn_openBoardDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/common/fileupload/openBoardDetail.do' />");
	comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
	comSubmit.submit(); 
}
</script>
</head>
<body>
	<h2>게시판 목록</h2>
	<table class="board_list">
	    <colgroup>
	        <col width="10%"/>
	        <col width="*"/>
	        <col width="15%"/>
	        <col width="20%"/>
	    </colgroup>
	    <thead>
	        <tr>
	            <th scope="col">글번호</th>
	            <th scope="col">제목</th>
	            <th scope="col">조회수</th>
	            <th scope="col">작성일</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:choose>
	            <c:when test="${fn:length(list) > 0}">
	                <c:forEach items="${list }" var="row">
	                    <tr>
	                        <td>${row.IDX }</td>
	                        <td class="title">
	                        	<a href="#this" name="title">${row.TITLE }</a>
	                        	<input type="hidden" id="IDX" value="${row.IDX}">
	                        </td>
	                        <td>${row.HIT_CNT }</td>
	                        <td>${row.CREA_DTM }</td>
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
	<br/>
	<a href="#this" class="btn" id="write" >글쓰기</a>
	<%@ include file="/include/include-body.jspf" %>
</body>