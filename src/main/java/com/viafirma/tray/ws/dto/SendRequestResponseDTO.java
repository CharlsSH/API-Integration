package com.viafirma.tray.ws.dto;

public class SendRequestResponseDTO extends WSInformationDTO {

	private RequestDTO result;

	public SendRequestResponseDTO() {
		super();
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public RequestDTO getResult() {
		return result;
	}

	public void setResult(RequestDTO result) {
		this.result = result;
	}
	
}
