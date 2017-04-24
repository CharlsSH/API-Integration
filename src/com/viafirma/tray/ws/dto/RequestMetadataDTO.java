package com.viafirma.tray.ws.dto;

public class RequestMetadataDTO {
	
	private String key;
	private String value;
	private String description;

	public RequestMetadataDTO() {
		key = "";
		value = "";
		description = "";
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
