package kr.co.hanandong.DBTest;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnectorFactoryForXml {
	
	private static SqlSessionFactory sqlSessionFactory = null;
	
	// config를 xml로 설정
	static {
		try {
			String resource = "kr/co/hanandong/DBTest/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
			

			
			
			
			
}
