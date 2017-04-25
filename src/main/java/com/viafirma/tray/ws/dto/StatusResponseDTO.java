package com.viafirma.tray.ws.dto;

public class StatusResponseDTO extends WSInformationDTO {
	
	private StatusDTO[] result;

	public StatusResponseDTO() {
		super();
		result = new StatusDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public StatusDTO[] getResult() {
		return result;
	}

	public void setResult(StatusDTO[] result) {
		this.result = result;
	}
	
}
