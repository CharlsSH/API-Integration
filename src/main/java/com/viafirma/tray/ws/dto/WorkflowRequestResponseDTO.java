package com.viafirma.tray.ws.dto;

public class WorkflowRequestResponseDTO extends WSInformationDTO {
	
	private String redirectUrl;

	public WorkflowRequestResponseDTO() {
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
