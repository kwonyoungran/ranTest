package kr.co.hanandong.DBTest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class CommonDaoForXml {
	private SqlSessionFactory factory = null;
	protected SqlSession session = null;
	
	public CommonDaoForXml() {
		factory = MyBatisConnectorFactoryForXml.getSqlSessionFactory();
		session = factory.openSession();
		
	}
			
}
