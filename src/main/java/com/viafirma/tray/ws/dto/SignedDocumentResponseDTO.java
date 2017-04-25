package com.viafirma.tray.ws.dto;

public class SignedDocumentResponseDTO extends WSInformationDTO {
	
	private SignatureDocumentDTO result;

	public SignedDocumentResponseDTO() {
		super();
		result = new SignatureDocumentDTO();
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public SignatureDocumentDTO getResult() {
		return result;
	}

	public void setResult(SignatureDocumentDTO result) {
		this.result = result;
	}
	
}
