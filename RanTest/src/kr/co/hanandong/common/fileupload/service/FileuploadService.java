package kr.co.hanandong.common.fileupload.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.hanandong.common.CommandMap;

public interface FileuploadService {
	
	List<Map<String,Object>> selectBoardList(CommandMap map) throws Exception;
	
	void insertBoard(Map<String,Object> map, HttpServletRequest request) throws Exception;
	
	Map<String,Object> selectBoardDetail(Map<String,Object> map) throws Exception;

	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;
	
	Map<String,Object> selectFileInfo(Map<String,Object> map) throws Exception;
}
