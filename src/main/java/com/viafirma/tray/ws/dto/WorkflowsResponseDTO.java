package com.viafirma.tray.ws.dto;

/**
 * Contiene el objeto respuesta a la petición de estado de una solicitud
 * @author viavansi
 *
 */
public class WorkflowsResponseDTO extends WSInformationDTO {
	
	private WorkflowDTO[] result;

	public WorkflowsResponseDTO() {
		super();
		result = new WorkflowDTO[0];
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public WorkflowDTO[] getResult() {
		return result;
	}

	public void setResult(WorkflowDTO[] result) {
		this.result = result;
	}
	
}
