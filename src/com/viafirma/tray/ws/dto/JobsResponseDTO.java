package com.viafirma.tray.ws.dto;

public class JobsResponseDTO extends WSInformationDTO {
	
	private JobDTO[] result;

	public JobsResponseDTO() {
		super();
		result = new JobDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public JobDTO[] getResult() {
		return result;
	}

	public void setResult(JobDTO[] result) {
		this.result = result;
	}
	
}
