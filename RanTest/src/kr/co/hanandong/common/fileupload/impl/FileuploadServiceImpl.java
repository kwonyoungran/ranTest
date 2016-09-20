package kr.co.hanandong.common.fileupload.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.hanandong.common.CommandMap;
import kr.co.hanandong.common.utils.FileUtils;
import kr.co.hanandong.common.fileupload.dao.FileuploadDAO;
import kr.co.hanandong.common.fileupload.service.FileuploadService;

@Service("fileuploadService")
public class FileuploadServiceImpl implements FileuploadService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="fileuploadDAO")
	private FileuploadDAO fileuploadDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap map) throws Exception {
		return fileuploadDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		fileuploadDAO.insertBoard(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0; i<list.size(); i++) {
			fileuploadDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		fileuploadDAO.updateHitCnt(map);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> tempMap = fileuploadDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = fileuploadDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		fileuploadDAO.updateBoard(map);
		fileuploadDAO.deleteFileList(map);
		
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0; i<list.size(); i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				fileuploadDAO.insertFile(tempMap);
			}else {
				fileuploadDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		fileuploadDAO.deleteBoard(map);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return fileuploadDAO.selectFileInfo(map);
	}
}
