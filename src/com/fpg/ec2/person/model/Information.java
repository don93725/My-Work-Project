package com.fpg.ec2.person.model;

public class Information {
	
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCell_phone() {
		return cell_phone;
	}
	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String toString(){
		System.out.println("身分證：" + this.getId());
		System.out.println("姓　名：" + this.getName());
		System.out.println("電　話：" + this.getPhone());
		System.out.println("性　別：" + this.getSex());
		System.out.println("年　齡：" + this.getAge());
		System.out.println("職　業：" + this.getJob());
		System.out.println("手　機：" + this.getCell_phone());
		System.out.println("居住地：" + this.getAddress());
		return "---------------";	
	}
	private Integer sex,age;
	private String id,name,phone,job,cell_phone,address;
	
}
