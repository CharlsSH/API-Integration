package com.viafirma.tray.ws.dto;

/**
 * Contiene el objeto respuesta a la petición de estado de una solicitud
 * @author viavansi
 *
 */
public class UsersResponseDTO extends WSInformationDTO {
	
	private UserDTO[] result;

	public UsersResponseDTO() {
		super();
		result = new UserDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public UserDTO[] getResult() {
		return result;
	}

	public void setResult(UserDTO[] result) {
		this.result = result;
	}
	
}
