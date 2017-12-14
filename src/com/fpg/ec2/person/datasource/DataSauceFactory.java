package com.fpg.ec2.person.datasource;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class DataSauceFactory {
	private static DataSource dsForOracle,dsForSqlServer;
	static {
		Context ctx;
		try {
			ctx = new InitialContext();
			dsForOracle =  (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	static {
		Context ctx;
		try {
			ctx = new InitialContext();
			dsForSqlServer = (DataSource) ctx.lookup("java:comp/env/jdbc/sqlserv");				
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static DataSource getOracleDS(){
		return dsForOracle;
	}
	public static DataSource getSqlServerDS(){
		return dsForSqlServer;
	}
}
