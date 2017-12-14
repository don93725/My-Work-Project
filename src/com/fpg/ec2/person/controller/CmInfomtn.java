package com.fpg.ec2.person.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpg.ec2.person.bo.InformationBOImpl;
import com.fpg.ec2.person.model.Information;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
@WebServlet("/info_mtn_lis.do")
public class CmInfomtn extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String db = req.getParameter("db");
System.out.println("Action = " + action + " , db = " + db);
		InformationBOImpl informationBO = null;		
		if("oracle".equals(db)){
			informationBO = new InformationBOImpl();
		}else{
			informationBO = new InformationBOImpl(1);
		}		
		

		if(action == null){
			List<Information> listInfomation;
			try {
				listInfomation = informationBO.findAllInformations(null);
				req.setAttribute("listInfomation", listInfomation);
				req.getRequestDispatcher("/info_mtn_lis.jsp").forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				res.sendRedirect(req.getContextPath() + "/info_mtn_lis.jsp?db="+db);
			}
			return;
		}
		
		if("delete".equals(action)){
			String id = req.getParameter("id");
			System.out.println("--------刪除 id = " + id + " 的資料-------");
			informationBO.deleteInformationByID(id);
			return;
		}
		
		if("update".equals(action)){
			String objToJSON = req.getParameter("objToJSON");
	        Gson gson = new Gson();
	        Type listType = new TypeToken<ArrayList<Information>>() {}.getType();
	        ArrayList<Information> voList = gson.fromJson(objToJSON, listType);
	        System.out.println("--------更新資料-------");
	        for(Information informations : voList){
	        	System.out.println(informations);
	        }
	        informationBO.updateInformations(voList);
			return;
		}
		
		if("insert".equals(action)){
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
			return;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
