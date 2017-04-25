package com.viafirma.tray.ws.dto;

public class ActionTypesResponseDTO extends WSInformationDTO {
	
	private ActionTypeDTO[] result;

	public ActionTypesResponseDTO() {
		super();
		result = new ActionTypeDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public ActionTypeDTO[] getResult() {
		return result;
	}

	public void setResult(ActionTypeDTO[] result) {
		this.result = result;
	}
	
}
