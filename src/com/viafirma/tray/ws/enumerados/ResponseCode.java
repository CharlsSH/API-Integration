package com.viafirma.tray.ws.enumerados;

public enum ResponseCode {

	SUCCESS,
	WS_ERROR_CODE_0,			// Empty request id - Error id petición vacío
	WS_ERROR_CODE_1,			// Unable to retrieve request info - Error al recuperar petición
	WS_ERROR_CODE_2,			// Unable to retrieve WS User - Error al recuperar el usuario anónimo WS
	WS_ERROR_CODE_3,			// Unable to create comment - Error al crear el comentario
	WS_ERROR_CODE_4,			// Empty comment error - Error comentario vacío
	WS_ERROR_CODE_5,			// Empty user ID error - Error nif vacío
	WS_ERROR_CODE_6,			// Recipient not found error - Error destinatario no existe
	WS_ERROR_CODE_7,			// Unable to create request - Error insertando petición
	WS_ERROR_CODE_8,			// Unknown - Request action type - Acción de petición inexistente
	WS_ERROR_CODE_9,			// Request access level empty or not found - Tipo de acceso a petición vacío o no existe
	WS_ERROR_CODE_10,			// Repeated users in request - Usuarios repetidos en la petición
	WS_ERROR_CODE_11,			// Empty recipients list - ista de destinatarios vacía
	WS_ERROR_CODE_12,			// Empty documents list - Lista de documentos vacía
	WS_ERROR_CODE_13, 			// No document name found - Nombre del documento vacío
	WS_ERROR_CODE_14, 			// Empty document content - Contenido del documento vacío
	WS_ERROR_CODE_15, 			// Empty workflow ID - Id de flujo vacío
	WS_ERROR_CODE_16, 			// Wrong Inbox Instance - Instancia de Inbox incorrecta
	WS_ERROR_CODE_17, 			// User not found - Usuario no encontrado
	WS_ERROR_CODE_18, 			// Unable to download signed document - No se puede descargar el documento firmado
	WS_ERROR_CODE_19,			// The request is not finished or error while retrieving last signature - Petición incompleta o problema al recuperar la última firma
	WS_ERROR_CODE_20,			// Unable to retrieve stored signature document - Error recuperando el documento de firma custodiado
	WS_ERROR_CODE_21,			// Unable to retrieve pdf report - No se puede descargar el informe en pdf
	WS_ERROR_CODE_22,			// Request not completed - La petición de firma aún no está terminada
	WS_ERROR_CODE_23,			// Unable to generate PDF signature report - Error generando el informe de firma en pdf
	WS_ERROR_CODE_24,			// Unable to found workflow, not global or not in this instance - Workflow no localizado, no es de la instancia o no es global
	WS_ERROR_CODE_25,			// Error while evaluating global workflow - Error evaluando el workflow global
	WS_ERROR_CODE_26,			// Error evaluando la representación String del workflow
	WS_ERROR_CODE_401;			// Authentication error - Error de autenticación
	
	public String getMessage() {
		return name();
	}
	
	public String getMessage(String... params) {
		String message = name();
		for (int i = 0; i < params.length; i ++) {
			message = message.replace("{" + i + "}", params[i]);
		}
		return message;
	}
}
