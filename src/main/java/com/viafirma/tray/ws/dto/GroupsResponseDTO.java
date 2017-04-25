package com.viafirma.tray.ws.dto;

public class GroupsResponseDTO extends WSInformationDTO {
	
	private GroupDTO[] result;

	public GroupsResponseDTO() {
		super();
		result = new GroupDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public GroupDTO[] getResult() {
		return result;
	}

	public void setResult(GroupDTO[] result) {
		this.result = result;
	}
	
}
