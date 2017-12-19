package com.fpg.ec2.person.datasource.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.fpg.ec2.person.datasource.DataSauceFactory;
import com.fpg.ec2.person.model.Information;

public class InformationDAO2 implements InformationDAOInterf {
	public InformationDAO2(){
		ds= DataSauceFactory.getOracleDS();					
	}
	public InformationDAO2(int tips){
		if(tips == 0){
			ds= DataSauceFactory.getOracleDS();			
		}else {
			ds = DataSauceFactory.getSqlServerDS();			
		}
	}
	
	@Override
	public int insertInformation(Information informations) {
		String sql = "insert into informations values(?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {informations.getId(),informations.getName(),informations.getPhone(),informations.getSex(),informations.getAge(),informations.getJob(),informations.getCell_phone(),informations.getAddress()};
		return executeUpdate(sql, params);
	}

	@Override
	public int updateInformation(Information informations) {
		String sql = "update informations set name = ?, phone = ?, sex = ?, age = ?, job = ?, cell_phone = ?, address = ? where id = ?";
		Object[] params = {informations.getName(),informations.getPhone(),informations.getSex(),informations.getAge(),informations.getJob(), informations.getCell_phone(), informations.getAddress(), informations.getId()};
		return executeUpdate(sql, params);
	}

	@Override
	public int deleteInformationByID(String id) {
		String sql = "delete from informations where id = ?";
		Object[] params = {id};
		return executeUpdate(sql, params);
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
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		String sql = "select * from informations";
		if(id != null){
			sql += " where id = '" + id + "'";
		}
		List<Information> tempList = new ArrayList<Information>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			
			while(rs.next()){
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("DB error");
		} finally {
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return tempList;
	}
	public int executeUpdate(String sql, Object[] params){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			if(params != null){
				
				for(int i = 0 ; i < params.length ; i++){
					pstmt.setObject(i+1, params[i]);
				}
				
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("DB error");
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}
		return result;
	}
	@Override
	public int updateInformations(ArrayList<Information> voList) {
		
		String sql = "update informations set name = ?, phone = ?, sex = ?, age = ?, job = ?, cell_phone = ?, address = ? where id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0 ; i < voList.size() ; i++){
				Information informations = voList.get(i);
				Object[] params = {informations.getName(),informations.getPhone(),informations.getSex(),informations.getAge(),informations.getJob(), informations.getCell_phone(), informations.getAddress(), informations.getId()};
				if(params != null){
					
					for(int j = 0 ; j < params.length ; j++){
						pstmt.setObject(j+1, params[j]);
					}		
					
				}
				result = pstmt.executeUpdate();
			}
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			throw new RuntimeException("DB error");
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}
		return result;
	}

	private static DataSource ds;

	
}
