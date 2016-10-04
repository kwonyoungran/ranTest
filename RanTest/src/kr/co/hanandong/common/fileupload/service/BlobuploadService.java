package kr.co.hanandong.common.fileupload.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import kr.co.hanandong.common.fileupload.dto.BlobuploadDto;

public interface BlobuploadService {
	Map<String, Object> selectFileList(Map<String,Object> map);
	
	int insertFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException;
	
	Map<String, Object> getThumnail(int idx);
	
	BlobuploadDto getFileInfo(int idx);
	
	int updateFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException;
	
	int deleteFile(BlobuploadDto blobuploadDto);
	
}
