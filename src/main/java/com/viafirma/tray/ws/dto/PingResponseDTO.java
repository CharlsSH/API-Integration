package com.viafirma.tray.ws.dto;

public class PingResponseDTO extends WSInformationDTO {

	private String result;

	public PingResponseDTO() {
		super();
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
}
