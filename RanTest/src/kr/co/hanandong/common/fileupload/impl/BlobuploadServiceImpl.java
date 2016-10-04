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
	
	@Override
	public Map<String, Object> selectFileList(Map<String,Object> map) {
		return blobuploadDao.selectFileList(map);
	}

	@Override
	public int insertFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		return blobuploadDao.insertFile(blobuploadDto);
	}

	@Override
	public Map<String, Object> getThumnail(int idx) {
		// TODO Auto-generated method stub
		return blobuploadDao.getThumnail(idx);
	}

	@Override
	public BlobuploadDto getFileInfo(int idx) {
		// TODO Auto-generated method stub
		return blobuploadDao.getFileInfo(idx);
	}
	
	@Override
	public int updateFile(BlobuploadDto blobuploadDto) throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		return blobuploadDao.updateFile(blobuploadDto);
	}

	@Override
	public int deleteFile(BlobuploadDto blobuploadDto) {
		// TODO Auto-generated method stub
		return blobuploadDao.deleteFile(blobuploadDto);
	}
}
