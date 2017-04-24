package com.viafirma.tray.ws.dto;

public class RejectTypeDTO {
	
	private String name;
	private String description;

	public RejectTypeDTO() {
		name = "";
		description = "";
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
