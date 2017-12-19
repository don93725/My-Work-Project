package com.fpg.ec2.person.bo;

import java.util.ArrayList;
import java.util.List;

import com.fpg.ec2.person.model.Information;

public interface InformationBO {
	public void saveInformation(Information informationVO);
	public void updateInformation(Information informationVO);
	public void updateInformations(ArrayList<Information> voList);
	public void deleteInformationByID(String id);
	public Information findInformationByID(String id);
	public List<Information> findAllInformations(String id);
	public void setDb(String db);
}
