package com.viafirma.tray.ws.dto;

public class RequestInfoResponseDTO extends WSInformationDTO {
	
	private RequestDTO result;

	public RequestInfoResponseDTO() {
		super();
		result = new RequestDTO();
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
