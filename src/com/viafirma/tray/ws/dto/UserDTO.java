package com.viafirma.tray.ws.dto;

public class UserDTO {
	
	private String nif;
	private String name;
	private String surname1;
	private String surname2;
	private String email;
	private String phone;
	
	public UserDTO() {
		nif = "";
		name = "";
		surname1 = "";
		surname2 = "";
		email = "";
		phone = "";
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public String getNif() {
		return nif;
	}
	public void setNif(String nif) {
		this.nif = nif;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname1() {
		return surname1;
	}
	public void setSurname1(String surname1) {
		this.surname1 = surname1;
	}
	public String getSurname2() {
		return surname2;
	}
	public void setSurname2(String surname2) {
		this.surname2 = surname2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
