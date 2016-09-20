<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/include-header.jspf" %>
<script type="text/javascript">
"use strict"

//LEFT_MENU 설정
for(var k in MENU_LIST)
{
	var menu = MENU_LIST[k];
	if (menu.active)
	{
		LEFT_MENU = menu.sub;
		break;
	}
}
</script>