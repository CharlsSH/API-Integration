package com.viafirma.tray.ws.dto;

public class RejectTypesResponseDTO extends WSInformationDTO {
	
	private RejectTypeDTO[] result;

	public RejectTypesResponseDTO() {
		super();
		result = new RejectTypeDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public RejectTypeDTO[] getResult() {
		return result;
	}

	public void setResult(RejectTypeDTO[] result) {
		this.result = result;
	}
	
}
