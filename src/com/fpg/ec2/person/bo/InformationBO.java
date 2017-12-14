package com.fpg.ec2.person.bo;

import java.util.ArrayList;
import java.util.List;

import com.fpg.ec2.person.model.Information;

public interface InformationBO {
	public int saveInformation(Information informationVO);
	public int updateInformation(Information informationVO);
	public int updateInformations(ArrayList<Information> voList);
	public int deleteInformationByID(String id);
	public Information findInformationByID(String id);
	public List<Information> findAllInformations(String id);
}
