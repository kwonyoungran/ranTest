package kr.co.hanandong.common.fileupload.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.hanandong.common.fileupload.dao.BlobuploadDao;
import kr.co.hanandong.common.fileupload.dto.BlobuploadDto;
import kr.co.hanandong.common.fileupload.service.BlobuploadService;

@Service("blobuploadService")
public class BlobuploadServiceImpl implements BlobuploadService {

	@Resource(name="blobuploadDao")
	BlobuploadDao blobuploadDao;
	
//	@Override
//	public List<BlobuploadDto> selectFileList() {
//		// TODO Auto-generated method stub
//		return blobuploadDao.selectFileList();
//	}
	
	@Override
	public Map<String, Object> selectFileList(Map<String,Object> map) {
		return blobuploadDao.selectFileList(map);
	}

	@Override
	public int insertFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		return blobuploadDao.insertFile(blobuploadDto);
	}
}
