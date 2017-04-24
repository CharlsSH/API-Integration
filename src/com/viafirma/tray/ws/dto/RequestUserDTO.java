package com.viafirma.tray.ws.dto;

import com.viafirma.tray.ws.enumerados.TipoAccionPeticion;

public class RequestUserDTO {

	private String personId;
	private String action;
	
	public RequestUserDTO() {
		personId = "";
		action = TipoAccionPeticion.FIRMA.name(); //F, VB
	}
	
	public boolean equals(Object o) {
		if (o instanceof RequestUserDTO) {
			RequestUserDTO usuario = (RequestUserDTO) o;
			return personId.equals(usuario.getPersonId());
		} else {
			return false;
		}
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	
	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
	public String toString(){
		return "[RequestUserDTO]: personId = "+personId+", action = "+action+"\n";
	}
	
}
