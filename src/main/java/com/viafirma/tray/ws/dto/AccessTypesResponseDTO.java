package com.viafirma.tray.ws.dto;

public class AccessTypesResponseDTO extends WSInformationDTO {
	
	private AccessTypeDTO[] result;

	public AccessTypesResponseDTO() {
		super();
		result = new AccessTypeDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public AccessTypeDTO[] getResult() {
		return result;
	}

	public void setResult(AccessTypeDTO[] result) {
		this.result = result;
	}
	
}
