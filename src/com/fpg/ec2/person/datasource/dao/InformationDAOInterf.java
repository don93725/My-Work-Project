package com.fpg.ec2.person.datasource.dao;

import java.util.ArrayList;
import java.util.List;

import com.fpg.ec2.person.model.Information;

public interface InformationDAOInterf {
	public void insertInformation(Information informationVO);
	public void updateInformation(Information informationVO);
	public void updateInformations(ArrayList<Information> voList);
	public void deleteInformationByID(String id);
	public Information selectInformationByID(String id);
	public List<Information> selectAllInformations(String id);
	public void setDb(String db);
	
}
