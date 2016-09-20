package kr.co.hanandong.common;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class ImagePaginationRenderer extends AbstractPaginationRenderer{
	public ImagePaginationRenderer() {
		firstPageLabel = "<a class=\"firstPage fa fa-step-backward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";
		previousPageLabel = "<a class=\"prevPage fa fa-backward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";
		currentPageLabel = "<span class=\"currentPage\">{0}</span>";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>";
		nextPageLabel = "<a class=\"nextPage fa fa-forward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";
		lastPageLabel = "<a class=\"lastPage fa fa-step-forward\" href=\"#\" onclick=\"{0}({1}); return false;\"></a>";
	}
}
