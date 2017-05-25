package kr.co.hanandong.DBTest;

import java.util.HashMap;
import java.util.List;

public class TestDaoForXml extends CommonDaoForXml {
	private static final String namespace = "hanandong.mapper.";
	
	public List<HashMap<String,Object>> getList() {
		return session.selectList(namespace + "selectBoardList");
	}
}
