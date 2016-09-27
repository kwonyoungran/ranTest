package kr.co.hanandong.common.fileupload.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import kr.co.hanandong.common.fileupload.dto.BlobuploadDto;

public interface BlobuploadService {
//	List<BlobuploadDto> selectFileList();
	Map<String, Object> selectFileList(Map<String,Object> map);
	
	int insertFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException;
}
