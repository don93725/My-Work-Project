package com.fpg.ec2.person.datasource.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.Transactional;

import com.fpg.ec2.person.model.Information;

@Repository
public class InformationDAO implements InformationDAOInterf {
	
	@Override
	public void insertInformation(Information informations) {
		String sql = "insert into informations values(?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {informations.getId(),informations.getName(),informations.getPhone(),informations.getSex(),informations.getAge(),informations.getJob(),informations.getCell_phone(),informations.getAddress()};
		jdbcTemplate.update(sql, params);
	}

	@Override
	public void updateInformation(Information informations) {
		String sql = "update informations set name = ?, phone = ?, sex = ?, age = ?, job = ?, cell_phone = ?, address = ? where id = ?";
		Object[] params = {informations.getName(),informations.getPhone(),informations.getSex(),informations.getAge(),informations.getJob(), informations.getCell_phone(), informations.getAddress(), informations.getId()};
		jdbcTemplate.update(sql, params);
	}

	@Override
	public void deleteInformationByID(String id) {
		String sql = "delete from informations where id = ?";
		Object[] params = {id};
		jdbcTemplate.update(sql, params);
	}

	@Override
	public Information selectInformationByID(String id) {
		List<Information> informationsList = selectAllInformations(id);
		if(informationsList.size() == 1){
			return informationsList.get(0);
		}else {
			throw new RuntimeException("can't find");
		}
	}

	@Override
	public List<Information> selectAllInformations(String id) {
		String sql = "select * from informations";
		Object[] params = null;
		if(id != null){
			sql += " where id = ?";
			params = new Object[]{id};
		}		
		List<Information> tempList = new ArrayList<>();
		jdbcTemplate.query(sql, params , new RowCallbackHandler(){
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				Information informations= new Information();
				informations.setAddress(rs.getString("address"));
				informations.setAge(rs.getInt("age"));
				informations.setCell_phone(rs.getString("cell_phone"));
				informations.setId(rs.getString("id"));
				informations.setJob(rs.getString("job"));
				informations.setName(rs.getString("name"));
				informations.setPhone(rs.getString("phone"));
				informations.setSex(rs.getInt("sex"));
				tempList.add(informations);
			}
		});
			
			
		return tempList;
	}
	
	
	@Override
	public void updateInformations(ArrayList<Information> voList) {
		txManager.getTransaction(TransactionDefinition.ISOLATION_DEFAULT);
		String sql = "update informations set name = ?, phone = ?, sex = ?, age = ?, job = ?, cell_phone = ?, address = ? where id = ?";
		int result = 0;
			
		for(int i = 0 ; i < voList.size() ; i++){
			Information informations = voList.get(i);
			Object[] params = {informations.getName(),informations.getPhone(),informations.getSex(),informations.getAge(),informations.getJob(), informations.getCell_phone(), informations.getAddress(), informations.getId()};
			if(params != null){					
				jdbcTemplate.update(sql, params);					
			}
		}
	}
	/**
	 * 變數「db」為資料庫選擇器，"oracle" = oracle, "sql" = sql server
	 */
	public void setDb(String db) {
		if("oracle".equals(db)){
			jdbcTemplate = jdbcTemplateForOracle;
			txManager = txManagerForOracle;
		}else{
			jdbcTemplate = jdbcTemplateForSqlServer;	
			txManager = txManagerForSqlServer;
		}
	}
	private DataSourceTransactionManager txManager;
	@Autowired
	@Qualifier("txManagerForSqlServer")
	private DataSourceTransactionManager txManagerForSqlServer;
	@Autowired
	@Qualifier("txManagerForOracle")
	private DataSourceTransactionManager txManagerForOracle;
	private JdbcTemplate jdbcTemplate;
	@Autowired
	@Qualifier("jdbcTemplateForSqlServer")
	private JdbcTemplate jdbcTemplateForSqlServer;
	@Autowired
	@Qualifier("jdbcTemplateForOracle")
	private JdbcTemplate jdbcTemplateForOracle;
	
}
