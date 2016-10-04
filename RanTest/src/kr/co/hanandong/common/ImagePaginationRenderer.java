package kr.co.hanandong.common;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class ImagePaginationRenderer extends AbstractPaginationRenderer {
	public ImagePaginationRenderer() {
		firstPageLabel = "<a class=\"firstPage fa fa-step-backward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";	//처을
		previousPageLabel = "<a class=\"prevPage fa fa-backward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";		//이전
		currentPageLabel = "<span class=\"currentPage\">{0}</span>";														//현재페이지
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>";										//현재페이지를 제외한 다른페이지
		nextPageLabel = "<a class=\"nextPage fa fa-forward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";			//다음
		lastPageLabel = "<a class=\"lastPage fa fa-step-forward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";		//마지막
	}
}
