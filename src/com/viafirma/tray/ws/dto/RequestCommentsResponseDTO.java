package com.viafirma.tray.ws.dto;

/**
 * Contiene el objeto respuesta a la petición de los comentarios de una solicitud
 * @author viavansi
 *
 */
public class RequestCommentsResponseDTO extends WSInformationDTO {
	
	private RequestCommentDTO[] result;

	public RequestCommentsResponseDTO() {
		super();
		result = new RequestCommentDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public RequestCommentDTO[] getResult() {
		return result;
	}

	public void setResult(RequestCommentDTO[] result) {
		this.result = result;
	}
	
}
