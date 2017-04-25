package com.viafirma.tray.ws.dto;

public class MetadataDTO {
	
	private String key;
	private String defaultValue;
	private String description;

	public MetadataDTO() {
		key = "";
		defaultValue = "";
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
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
