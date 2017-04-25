package com.viafirma.tray.ws.dto;

public class RequestMetadataResponseDTO extends WSInformationDTO {
	
	private RequestMetadataDTO[] result;

	public RequestMetadataResponseDTO() {
		super();
		result = new RequestMetadataDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public RequestMetadataDTO[] getResult() {
		return result;
	}

	public void setResult(RequestMetadataDTO[] result) {
		this.result = result;
	}
	
}
