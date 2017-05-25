package kr.co.hanandong.DBTest;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {
	
	@Select("SELECT IDX, TITLE, HIT_CNT, CREA_DTM FROM TB_BOARD WHERE DEL_GB = 'N' ORDER BY IDX DESC")
	public List<HashMap<String,Object>> getList();
}
