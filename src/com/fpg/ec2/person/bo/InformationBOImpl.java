package com.fpg.ec2.person.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpg.ec2.person.datasource.dao.InformationDAO;
import com.fpg.ec2.person.datasource.dao.InformationDAOInterf;
import com.fpg.ec2.person.model.Information;
@Service
public class InformationBOImpl implements InformationBO {

	public void saveInformation(Information informationVO){
		dao.insertInformation(informationVO);
	}
	public void updateInformation(Information informationVO){
		dao.updateInformation(informationVO);
	}
	public void updateInformations(ArrayList<Information> voList){
		dao.updateInformations(voList);
	}
	public void deleteInformationByID(String id){
		dao.deleteInformationByID(id);
	}
	public Information findInformationByID(String id){
		return dao.selectInformationByID(id);
	}
	public List<Information> findAllInformations(String id){
		return dao.selectAllInformations(id);
	}
	public void setDb(String db){
		dao.setDb(db);
	}
	@Autowired
	private InformationDAOInterf dao;
	
}
