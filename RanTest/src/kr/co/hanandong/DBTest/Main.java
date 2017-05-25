package kr.co.hanandong.DBTest;

import java.util.HashMap;
import java.util.List;

public class Main {
	// config를 JAVA Source로 설정
	public static void main(String[] args) {
		TestDao testDao2 = new TestDao();
		List<HashMap<String,Object>> list = testDao2.getList();
		
		for(HashMap<String,Object> map : list) {
			System.out.println(map.get("TITLE"));
		}
	}

}
