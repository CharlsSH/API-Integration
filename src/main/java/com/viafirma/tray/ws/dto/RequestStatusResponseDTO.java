package com.viafirma.tray.ws.dto;

/**
 * Contiene el objeto respuesta a la petición de estado de una solicitud
 * @author viavansi
 *
 */
public class RequestStatusResponseDTO extends WSInformationDTO {
	
	private RequestAddresseeDTO[] result;

	public RequestStatusResponseDTO() {
		super();
		result = new RequestAddresseeDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public RequestAddresseeDTO[] getResult() {
		return result;
	}

	public void setResult(RequestAddresseeDTO[] result) {
		this.result = result;
	}
	
}
