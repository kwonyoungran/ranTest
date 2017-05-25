package kr.co.hanandong.DBTest;

import java.util.HashMap;
import java.util.List;

public class MainForXml {
	// config를 xml로 설정
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestDaoForXml testDaoForXml = new TestDaoForXml();
		List<HashMap<String,Object>> list = testDaoForXml.getList();
		
		for(HashMap<String,Object> map : list) {
			System.out.println(map.get("TITLE"));
		}
	}
}
