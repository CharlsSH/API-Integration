package com.viafirma.tray.ws.dto;

public class ActionTypeDTO {
	
	private String name;
	private String shortName;
	
	public ActionTypeDTO() {
		name = "";
		shortName = "";
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
}
