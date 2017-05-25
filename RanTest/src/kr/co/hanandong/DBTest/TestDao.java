package kr.co.hanandong.DBTest;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TestDao {
	private SqlSessionFactory sqlSessionFactory = MyBatisConnectorFactory.getSqlSessionFactory();
	
	public List<HashMap<String,Object>> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			
			List<HashMap<String,Object>> list = mapper.getList();
			
			return list;
			
		} finally {
			sqlSession.close();
		}
	}

}
