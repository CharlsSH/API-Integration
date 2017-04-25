package com.viafirma.tray.ws.dto;

public class RequestDocumentsResponseDTO extends WSInformationDTO {
	
	private DocumentDTO[] result;

	public RequestDocumentsResponseDTO() {
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
