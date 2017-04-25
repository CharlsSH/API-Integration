package com.viafirma.tray.ws.enumerados;

public enum TipoAccionPeticion {
    FIRMA("F"),
    VISTOBUENO("VB");

	private String nombreCorto;

	TipoAccionPeticion(String nombreCorto){
		this.nombreCorto = nombreCorto;
	}

	public String getNombre() {
		return this.name();
	}

	public String getNombreCorto() {
		return nombreCorto;
	}

	public static TipoAccionPeticion findByNombreCorto(String nombreCorto) {
		TipoAccionPeticion res = null;
		for(TipoAccionPeticion tipo : TipoAccionPeticion.values()) {
			if (tipo.getNombreCorto().equals(nombreCorto)) {
				res = tipo;
				break;
			}
		}
		return res;
	}

}