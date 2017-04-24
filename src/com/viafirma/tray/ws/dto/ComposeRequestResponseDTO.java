package com.viafirma.tray.ws.dto;

public class ComposeRequestResponseDTO extends WSInformationDTO {
	
	private String redirectUrl;

	public ComposeRequestResponseDTO() {
		super();
		redirectUrl = "";
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
}
