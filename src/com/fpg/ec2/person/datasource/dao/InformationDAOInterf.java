package com.fpg.ec2.person.datasource.dao;

import java.util.ArrayList;
import java.util.List;

import com.fpg.ec2.person.model.Information;

public interface InformationDAOInterf {
	public int insertInformation(Information informationVO);
	public int updateInformation(Information informationVO);
	public int updateInformations(ArrayList<Information> voList);
	public int deleteInformationByID(String id);
	public Information selectInformationByID(String id);
	public List<Information> selectAllInformations(String id);
	
}
