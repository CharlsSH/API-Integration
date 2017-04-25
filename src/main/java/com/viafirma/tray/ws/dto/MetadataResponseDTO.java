package com.viafirma.tray.ws.dto;

public class MetadataResponseDTO extends WSInformationDTO {
	
	private MetadataDTO[] result;

	public MetadataResponseDTO() {
		super();
		result = new MetadataDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public MetadataDTO[] getResult() {
		return result;
	}

	public void setResult(MetadataDTO[] result) {
		this.result = result;
	}
	
}
