package com.fpg.ec2.person.action;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
	@Autowired
	InformationBOImpl informationBO;
	@RequestMapping(value = "/select")
	public String select(@RequestParam("db") String db, ModelMap map) throws Exception{
		try {
			informationBO.setDb(db);
			List<Information> listInfomation = informationBO.findAllInformations(null);
			map.addAttribute("listInfomation", listInfomation);
			return "info_mtn_lis";
		} catch (Exception e) {
			e.printStackTrace();
			return "info_mtn_lis";
		}
	}
	@RequestMapping(value = "/delete")
	public void delete(HttpServletResponse res, @RequestParam("db") String db, @RequestParam("id") String id) throws Exception{
		informationBO.setDb(db);
		System.out.println("--------刪除 id = " + id + " 的資料-------");
		res.getWriter().print("go");
		informationBO.deleteInformationByID(id);
	}
	@RequestMapping(value = "/update")
	public void update(@RequestParam("db") String db, @RequestParam("objToJSON") String objToJSON) throws Exception{
		informationBO.setDb(db);
		Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<Information>>() {}.getType();
        ArrayList<Information> voList = gson.fromJson(objToJSON, listType);
        System.out.println("--------更新資料-------");
        for(Information informations : voList){
        	System.out.println(informations);
        }
        informationBO.updateInformations(voList);		
	}
	@RequestMapping(value = "/insert")
	public void insert(HttpServletResponse res,	 Information informations, BindingResult bindingResult, @RequestParam("db") String db) throws Exception{
		informationBO.setDb(db);
		System.out.println("--------新增資料-------");
		System.out.println(informations);		
		informationBO.saveInformation(informations);
		res.getWriter().print("go");
		System.out.println("result = "+bindingResult);
		if(bindingResult.hasErrors()){
			System.out.println("錯");
		}else{
			System.out.println("沒錯");			
		}
	}
	
}
