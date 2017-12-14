package com.fpg.ec2.person.bo;

import java.util.ArrayList;
import java.util.List;

import com.fpg.ec2.person.datasource.dao.InformationDAO;
import com.fpg.ec2.person.datasource.dao.InformationDAOInterf;
import com.fpg.ec2.person.model.Information;

public class InformationBOImpl implements InformationBO {
	public InformationBOImpl(){		
		dao = new InformationDAO();
	}
	public InformationBOImpl(int i){		
		dao = new InformationDAO(i);
	}
	public int saveInformation(Information informationVO){
		return dao.insertInformation(informationVO);
	}
	public int updateInformation(Information informationVO){
		return dao.updateInformation(informationVO);
	}
	public int updateInformations(ArrayList<Information> voList){
		return dao.updateInformations(voList);
	}
	public int deleteInformationByID(String id){
		return dao.deleteInformationByID(id);
	}
	public Information findInformationByID(String id){
		return dao.selectInformationByID(id);
	}
	public List<Information> findAllInformations(String id){
		return dao.selectAllInformations(id);
	}
	private InformationDAOInterf dao;
	
}
