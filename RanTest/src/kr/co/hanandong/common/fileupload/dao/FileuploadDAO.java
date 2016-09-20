package kr.co.hanandong.common.fileupload.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.hanandong.common.CommandMap;
import kr.co.hanandong.common.dao.AbstractDAO;

@Repository("fileuploadDAO")
public class FileuploadDAO extends AbstractDAO {
	public List<Map<String, Object>> selectBoardList(CommandMap map) throws Exception {
		return dataSource_mysql.selectList("common.fileupload.selectBoardList", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception {
		dataSource_mysql.insert("common.fileupload.insertBoard", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		dataSource_mysql.update("common.fileupload.updateHitCnt", map);
	}

	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return dataSource_mysql.selectOne("common.fileupload.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		dataSource_mysql.update("common.fileupload.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		dataSource_mysql.update("common.fileupload.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		dataSource_mysql.insert("common.fileupload.insertFile", map);
	}

	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return dataSource_mysql.selectList("common.fileupload.selectFileList",map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception {
		dataSource_mysql.update("common.fileupload.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception {
		dataSource_mysql.update("common.fileupload.updateFile", map);
	}
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dataSource_mysql.selectOne("common.fileupload.selectFileInfo", map);
	}
}
