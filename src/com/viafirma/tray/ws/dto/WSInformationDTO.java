package com.viafirma.tray.ws.dto;

import com.viafirma.tray.ws.enumerados.ResponseCode;

/**
 * Contiene información genérica sobre el resultado de una petición al WS
 * @author viavansi
 */
public class WSInformationDTO {
	
	private Boolean error;
	private String responseCode;
	private String errorMessage;
	
	public WSInformationDTO() {
		error = false;
		responseCode = "";
		errorMessage = "";
	}
	
	public void setError(ResponseCode error) {
		setError(true);
		setResponseCode(error.name());
		setMessage(error.getMessage());
	}
	
	public void success() {
		setResponseCode(ResponseCode.SUCCESS.name());
	}
	
	public void setError(ResponseCode error, String... params) {
		setError(true);
		setResponseCode(error.name());
		setMessage(error.getMessage(params));
	}
	
	//*****************************
	//		Getters / Setters
	//*****************************
	public Boolean getError() {
		return error;
	}
	public void setError(Boolean error) {
		this.error = error;
	}
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getMessage() {
		return errorMessage;
	}
	public void setMessage(String message) {
		this.errorMessage = message;
	}
	
}
