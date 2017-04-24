package com.viafirma.tray.ws.dto;

public class RequestAnnexesResponseDTO extends WSInformationDTO {
	
	private DocumentDTO[] result;

	public RequestAnnexesResponseDTO() {
		super();
		result = new DocumentDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public DocumentDTO[] getResult() {
		return result;
	}

	public void setResult(DocumentDTO[] result) {
		this.result = result;
	}
	
}
