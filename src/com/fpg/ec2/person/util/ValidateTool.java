package com.fpg.ec2.person.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidateTool {
	public static boolean checkIdFormat(String str){
		Pattern pattern = Pattern.compile("[A-Za-z]{1}[0-9]{9}");
		Matcher m = pattern.matcher(str);		
		return m.matches();
	}
	public static String checkLength(String str, Integer length){
		if(str == null || str.length() == 0){
			return "請勿為空";
		}
		else if( length != null && str.length() > length ){
			return "長度過長";
		}
		else{
			return null;			
		}
	}
}
