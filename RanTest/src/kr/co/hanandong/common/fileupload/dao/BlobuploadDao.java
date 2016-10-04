package kr.co.hanandong.common.fileupload.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.hanandong.common.dao.AbstractDAO;
import kr.co.hanandong.common.fileupload.dto.BlobuploadDto;

@Repository("blobuploadDao")
public class BlobuploadDao extends AbstractDAO {
	public Map<String, Object> selectFileList(Map<String, Object> map) {
		return (Map<String, Object>)selectPagingListForMysql("common.fileupload.blobupload.selectFileList", map, dataSource_mysql);
	}
	
	public int insertFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException {
		return dataSource_mysql.insert("common.fileupload.blobupload.insertFile", blobuploadDto);
	}
	
	public Map<String,Object> getThumnail(int idx) {
		return dataSource_mysql.selectOne("common.fileupload.blobupload.getThumnail", idx);
	}
	
	public BlobuploadDto getFileInfo(int idx) {
		return dataSource_mysql.selectOne("common.fileupload.blobupload.getFileInfo", idx);
	}
	
	public int updateFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException {
		return dataSource_mysql.insert("common.fileupload.blobupload.updateFile", blobuploadDto);
	}
	
	public int deleteFile(BlobuploadDto blobuploadDto) {
		return dataSource_mysql.update("common.fileupload.blobupload.deleteFile", blobuploadDto);
	}
}
