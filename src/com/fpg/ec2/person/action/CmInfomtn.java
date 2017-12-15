package com.fpg.ec2.person.action;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fpg.ec2.person.bo.InformationBOImpl;
import com.fpg.ec2.person.model.Information;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping(value = "/CmInfomtn")
public class CmInfomtn {
	@RequestMapping(value = "/select.do")
	public String select(@RequestParam("db") String db, ModelMap map) throws Exception{
		InformationBOImpl informationBO = null;		
		if("oracle".equals(db)){
			informationBO = new InformationBOImpl();
		}else{
			informationBO = new InformationBOImpl(1);
		}	
		List<Information> listInfomation = informationBO.findAllInformations(null);
		map.addAttribute("listInfomation", listInfomation);
		return "info_mtn_lis";
	}
	@RequestMapping(value = "/delete.do")
	public void delete(HttpServletRequest req, @RequestParam("db") String db, @RequestParam("id") String id) throws Exception{
		InformationBOImpl informationBO = null;		
		if("oracle".equals(db)){
			informationBO = new InformationBOImpl();
		}else{
			informationBO = new InformationBOImpl(1);
		}	
		System.out.println("--------刪除 id = " + id + " 的資料-------");
		informationBO.deleteInformationByID(id);
	}
	@RequestMapping(value = "/update.do")
	public void update(@RequestParam("db") String db, @RequestParam("objToJSON") String objToJSON) throws Exception{
		InformationBOImpl informationBO = null;		
		if("oracle".equals(db)){
			informationBO = new InformationBOImpl();
		}else{
			informationBO = new InformationBOImpl(1);
		}
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<Information>>() {}.getType();
        ArrayList<Information> voList = gson.fromJson(objToJSON, listType);
        System.out.println("--------更新資料-------");
        for(Information informations : voList){
        	System.out.println(informations);
        }
        informationBO.updateInformations(voList);		
	}
	@RequestMapping(value = "/insert.do")
	public void insert(HttpServletRequest req, @RequestParam("db") String db) throws Exception{
		req.setCharacterEncoding("utf-8");
		InformationBOImpl informationBO = null;		
		if("oracle".equals(db)){
			informationBO = new InformationBOImpl();
		}else{
			informationBO = new InformationBOImpl(1);
		}	
		Information informations= new Information();
		informations.setAddress(req.getParameter("address"));
		informations.setAge(new Integer(req.getParameter("age")));
		informations.setCell_phone(req.getParameter("cell_phone"));
		informations.setId(req.getParameter("id"));
		informations.setJob(req.getParameter("job"));
		informations.setName(req.getParameter("name"));
		informations.setPhone(req.getParameter("phone"));
		informations.setSex(new Integer(req.getParameter("sex")));
		System.out.println("--------新增資料-------");
		System.out.println(informations);		
		informationBO.saveInformation(informations);
	}
	
}
