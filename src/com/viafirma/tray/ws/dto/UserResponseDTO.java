package com.viafirma.tray.ws.dto;

/**
 * Contiene el objeto respuesta a la petición de estado de una solicitud
 * @author viavansi
 *
 */
public class UserResponseDTO extends WSInformationDTO {
	
	private UserDTO result;

	public UserResponseDTO() {
		super();
		result = new UserDTO();
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public UserDTO getResult() {
		return result;
	}

	public void setResult(UserDTO result) {
		this.result = result;
	}
	
}
