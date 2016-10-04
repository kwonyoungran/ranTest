package kr.co.hanandong.common.fileupload.dto;

import java.io.IOException;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BlobuploadDto {
	private int idx;
	private String file_name;
	private MultipartFile file;
	private Date reg_date;
	private String reg_name;
	private String update_date;
	private String update_name;
	private byte[] fileBytes;
	private String del_yn;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) throws IOException {
		this.file = file;
		this.fileBytes = file.getBytes();
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getUpdate_name() {
		return update_name;
	}
	public void setUpdate_name(String update_name) {
		this.update_name = update_name;
	}
	public byte[] getFileBytes() {
		return fileBytes;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String toString() {
        return "BlobuploadDto [idx=" + idx + ", file_name=" + file_name + ", file=" + file 
        		+ ", reg_date=" + reg_date + ", reg_name=" + reg_name + ", fileBytes=" + fileBytes
        		+ ", update_date=" + update_date + ", update_name=" + update_name + "]";
    }
}
