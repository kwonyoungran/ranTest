package kr.co.hanandong.common.fileupload.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.hanandong.common.CommandMap;
import kr.co.hanandong.common.fileupload.dao.FileuploadDao;
import kr.co.hanandong.common.fileupload.service.FileuploadService;
import kr.co.hanandong.common.utils.FileUtils;

@Service("fileuploadService")
public class FileuploadServiceImpl implements FileuploadService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="fileuploadDao")
	private FileuploadDao fileuploadDao;
	
	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap map) throws Exception {
		return fileuploadDao.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		fileuploadDao.insertBoard(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0; i<list.size(); i++) {
			fileuploadDao.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		fileuploadDao.updateHitCnt(map);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> tempMap = fileuploadDao.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = fileuploadDao.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		fileuploadDao.updateBoard(map);
		fileuploadDao.deleteFileList(map);
		
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0; i<list.size(); i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				fileuploadDao.insertFile(tempMap);
			}else {
				fileuploadDao.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		fileuploadDao.deleteBoard(map);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return fileuploadDao.selectFileInfo(map);
	}
}
