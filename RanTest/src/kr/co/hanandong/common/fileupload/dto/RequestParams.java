package kr.co.hanandong.common.fileupload.dto;

public class RequestParams {
	private int idx;
	private String isSaved;
	private String mode;
	private String currentPageNo;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getIsSaved() {
		return isSaved;
	}
	public void setIsSaved(String isSaved) {
		this.isSaved = isSaved;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(String currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	
	public String toString() {
        return "RequestParams [idx=" + idx + ", isSaved=" + isSaved + ", mode=" + mode + ", currentPageNo=" + currentPageNo + "]";
    }
	
}
