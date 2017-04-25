package com.viafirma.tray.ws.dto;

public class GroupDTO {
	
	private String name;
	private String publicAccessId;

	public GroupDTO() {
		name = "";
		publicAccessId = "";
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
	public String getPublicAccessId() {
		return publicAccessId;
	}
	public void setPublicAccessId(String publicAccessId) {
		this.publicAccessId = publicAccessId;
	}
}
