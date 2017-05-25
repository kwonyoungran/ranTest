package kr.co.hanandong.DBTest;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

public class DataSourceFactory {
	private static BasicDataSource basicDataSource = new BasicDataSource();
	
	static {
		basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
		basicDataSource.setUrl("jdbc:mysql://localhost:3306/my_database");
		basicDataSource.setUsername("root");
		basicDataSource.setPassword("eodfks09");
	}
	
	public static DataSource getDataSource() {
		return basicDataSource;
	}
	
}
