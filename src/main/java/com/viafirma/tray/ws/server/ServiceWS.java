/* Desarrollado por VIAVANSI ( Servicios Avanzados para las Instituciones S.L. ) 2008
  
   Se permite la libre distribución y modificación de esta librería bajo los 
   términos de la licencia GPL siempre que se indique de forma clara
   la autoría de Servicios Avanzados para las Instituciones S.L. (VIAVANSI).
   Para usos comerciales de este software contacte con info@viavansi.com.
   
   This library is free software; you can redistribute it and/or
   modify it under the terms of the GPL GNU General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.
  
   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.
 
   For any commercial use of this software contact info@viavansi.com.

   ********************************************************************
   Encoding: UTF-8 
   Cadena de comprobación de encoding: 'El veloz murciélago hindú comía feliz cardillo y kiwi.'
									   'La cigüeña tocaba el saxofón detrás del palenque de paja.'
*/


package com.viafirma.tray.ws.server;

import javax.jws.HandlerChain;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import com.viafirma.tray.ws.dto.AccessTypesResponseDTO;
import com.viafirma.tray.ws.dto.ActionTypesResponseDTO;
import com.viafirma.tray.ws.dto.AddCommentResponseDTO;
import com.viafirma.tray.ws.dto.ComposeRequestResponseDTO;
import com.viafirma.tray.ws.dto.DocumentDTO;
import com.viafirma.tray.ws.dto.GroupsResponseDTO;
import com.viafirma.tray.ws.dto.JobsResponseDTO;
import com.viafirma.tray.ws.dto.MetadataDTO;
import com.viafirma.tray.ws.dto.MetadataResponseDTO;
import com.viafirma.tray.ws.dto.PingResponseDTO;
import com.viafirma.tray.ws.dto.RejectTypesResponseDTO;
import com.viafirma.tray.ws.dto.RequestAnnexesResponseDTO;
import com.viafirma.tray.ws.dto.RequestDTO;
import com.viafirma.tray.ws.dto.RequestDocumentsResponseDTO;
import com.viafirma.tray.ws.dto.RequestCommentsResponseDTO;
import com.viafirma.tray.ws.dto.RequestInfoResponseDTO;
import com.viafirma.tray.ws.dto.RequestMetadataDTO;
import com.viafirma.tray.ws.dto.RequestMetadataResponseDTO;
import com.viafirma.tray.ws.dto.RequestStatusResponseDTO;
import com.viafirma.tray.ws.dto.RequestUserDTO;
import com.viafirma.tray.ws.dto.SendRequestResponseDTO;
import com.viafirma.tray.ws.dto.SignRequestResponseDTO;
import com.viafirma.tray.ws.dto.SignatureTicketResponseDTO;
import com.viafirma.tray.ws.dto.SignedDocumentResponseDTO;
import com.viafirma.tray.ws.dto.StatusResponseDTO;
import com.viafirma.tray.ws.dto.UserResponseDTO;
import com.viafirma.tray.ws.dto.UsersResponseDTO;
import com.viafirma.tray.ws.dto.WorkflowRequestResponseDTO;
import com.viafirma.tray.ws.dto.WorkflowUsersDTO;
import com.viafirma.tray.ws.dto.WorkflowsResponseDTO;

/**
 * Interfaz de los Servicios Web ofrecidos por la aplicación.
 * Para obtener el WSDL asociado;
 * http://localhost:8080/tray/serviceWS?wsdl
 * 
 * Nota: Utilizando la implementación JAX-WS 2.x ( Proyecto Metro de Sun)
 *
 * Every method of the WebService returns a subclass instance of WSInformationDTO, which contains
 * general info about the operation result (error, responseCode, errorMessage), and the particular
 * result for the operation (result)
 *
 */


@HandlerChain(file = "handlerchain.xml")
@WebService(targetNamespace = "http://tray.viavansi.com", name = "serviceWS")
@SOAPBinding(style = SOAPBinding.Style.RPC, use = SOAPBinding.Use.LITERAL)
public interface ServiceWS {
	
	/**
	 * Tests the webservice status
	 * @param param Any string
	 * @return responseCode SUCCESS if the webservice is operative
	 */
	@WebMethod(operationName = "ping", action = "urn:ping")
	@WebResult(name = "return")
	PingResponseDTO ping(@WebParam(name = "param") String param);

	/**
	 * Retrieves the request status for each addressee
	 * @param requestId The request public id (i.e. 31V1-NUN7-MD7Z-2K7O) - required - 
	 * @return RequestStatusResponseDTO
	 * @errorCodes 
	 * 		WS_ERROR_CODE_0
	 * 		WS_ERROR_CODE_1
	 */
	@WebMethod(operationName = "getRequestStatus", action = "urn:getRequestStatus")
	@WebResult(name = "return")
	RequestStatusResponseDTO getRequestStatus(@WebParam(name = "requestId") String requestId);

	/**
	 * Retrieves the general info corresponding to the public request id passed as argument
	 * @param requestId The request public id
	 * @return RequestInfoResponseDTO
	 * @errorCodes 
	 * 		WS_ERROR_CODE_0
	 * 		WS_ERROR_CODE_1
	 */
	@WebMethod(operationName = "getRequestInfo", action = "urn:getRequestInfo")
	@WebResult(name = "return")
	RequestInfoResponseDTO getRequestInfo(@WebParam(name = "requestId") String requestId);
	
	/**
	 * Retrieves the comments associated with the public request id passed as argument
	 * @param requestId The request public id
	 * @return RequestCommentsResponseDTO
	 * @errorCodes 
	 * 		WS_ERROR_CODE_0
	 * 		WS_ERROR_CODE_1
	 */
	@WebMethod(operationName = "getRequestComments", action = "urn:getRequestComments")
	@WebResult(name = "return")
	RequestCommentsResponseDTO getRequestComments(@WebParam(name = "requestId") String requestId);

	/**
	 * Send a new comment to the request passed as argument
	 * @param requestId The request public id
	 * @param body The comment message
	 * @return RequestInfoResponseDTO
	 * @errorCodes 
	 * 		WS_ERROR_CODE_0
	 * 		WS_ERROR_CODE_1
	 * 		WS_ERROR_CODE_2
	 * 		WS_ERROR_CODE_3
	 * 		WS_ERROR_CODE_4
	 */
	@WebMethod(operationName = "addComment", action = "urn:addComment")
	@WebResult(name = "return")
	AddCommentResponseDTO addComment(@WebParam(name = "requestId") String requestId,
									@WebParam(name = "body") String body);
	
	@WebMethod(operationName = "getRequestDocuments", action = "urn:getRejectTypes")
	@WebResult(name = "return")
	RequestDocumentsResponseDTO getRequestDocuments(@WebParam(name = "requestId") String requestId);
	
	@WebMethod(operationName = "getRequestAnnexes", action = "urn:getRequestAnnexes")
	@WebResult(name = "return")
	RequestAnnexesResponseDTO getRequestAnnexes(@WebParam(name = "requestId") String requestId);
	
	@WebMethod(operationName = "getRequestMetadata", action = "urn:getRequestMetadata")
	@WebResult(name = "return")
	RequestMetadataResponseDTO getRequestMetadata(@WebParam(name = "requestId") String requestId);
	
	@WebMethod(operationName = "getSignedDocument", action = "urn:getSignedDocument")
	@WebResult(name = "return")
	SignedDocumentResponseDTO getSignedDocument(@WebParam(name = "requestId") String requestId);
	
	@WebMethod(operationName = "getSignatureTicket", action = "urn:getSignatureTicket")
	@WebResult(name = "return")
	SignatureTicketResponseDTO getSignatureTicket(@WebParam(name = "requestId") String requestId);
	
	@WebMethod(operationName = "getUsers", action = "urn:getUsers")
	@WebResult(name = "return")
	UsersResponseDTO getUsers();
	
	@WebMethod(operationName = "getUserByPersonId", action = "urn:getUserByPersonId")
	@WebResult(name = "return")
	UserResponseDTO getUserByPersonId(@WebParam(name = "personId") String personId);
	
	@WebMethod(operationName = "getUsersBySearchTerm", action = "urn:getUsersBySearchTerm")
	@WebResult(name = "return")
	UsersResponseDTO getUsersBySearchTerm(@WebParam(name = "searchTerm") String searchTerm);
	
	@WebMethod(operationName = "getJobs", action = "urn:getJobs")
	@WebResult(name = "return")
	JobsResponseDTO getJobs();
	
	@WebMethod(operationName = "getGroups", action = "urn:getGroups")
	@WebResult(name = "return")
	GroupsResponseDTO getGroups();
	
	@WebMethod(operationName = "getWorkflows", action = "urn:getWorkflows")
	@WebResult(name = "return")
	WorkflowsResponseDTO getWorkflows();
	
	@WebMethod(operationName = "getRejectTypes", action = "urn:getRejectTypes")
	@WebResult(name = "return")
	RejectTypesResponseDTO getRejectTypes();
	
	@WebMethod(operationName = "getMetadataKeys", action = "urn:getMetadataKeys")
	@WebResult(name = "return")
	MetadataResponseDTO getMetadataKeys();
	
	@WebMethod(operationName = "getStatus", action = "urn:getStatus")
	@WebResult(name = "return")
	StatusResponseDTO getStatus();
	
	@WebMethod(operationName = "getActionTypes", action = "urn:getActionTypes")
	@WebResult(name = "return")
	ActionTypesResponseDTO getActionTypes();
	
	@WebMethod(operationName = "getAccessTypes", action = "urn:getAccessTypes")
	@WebResult(name = "return")
	AccessTypesResponseDTO getAccessTypes();
	
	@WebMethod(operationName = "sendRequest", action = "urn:sendRequest")
	@WebResult(name = "return")
	SendRequestResponseDTO sendRequest(@WebParam(name = "request") RequestDTO request,
										@WebParam(name = "addressees") RequestUserDTO[][][] addressees,
										@WebParam(name = "documents") DocumentDTO[] documents,
										@WebParam(name = "annexes") DocumentDTO[] annexes,
										@WebParam(name = "metadata") MetadataDTO[] metadata);
	
	@WebMethod(operationName = "sendRequestWithStrWorkflow", action = "urn:sendRequestWithStrWorkflow")
	@WebResult(name = "return")
	SendRequestResponseDTO sendRequestWithStrWorkflow(@WebParam(name = "request") RequestDTO request,
										@WebParam(name = "workflowStringRepresentation") String workflowStringRepresentation,
										@WebParam(name = "documents") DocumentDTO[] documents,
										@WebParam(name = "annexes") DocumentDTO[] annexes,
										@WebParam(name = "metadata") MetadataDTO[] metadata);	
	
	@WebMethod(operationName = "prepareComposeRequest", action = "urn:prepareComposeRequest")
	@WebResult(name = "return")
	ComposeRequestResponseDTO prepareComposeRequest(@WebParam(name = "personId") String personId,
													  @WebParam(name = "documentName") String documentName,
													  @WebParam(name = "documentContent") byte[] documentContent,
													  @WebParam(name = "returnUrl") String returnUrl,
													  @WebParam(name = "notificationUrl") String notificationUrl);
	
	@WebMethod(operationName = "prepareWorkflowRequest", action = "urn:prepareWorkflowRequest")
	@WebResult(name = "return")
	WorkflowRequestResponseDTO prepareWorkflowRequest(@WebParam(name = "personId") String personId,
													  @WebParam(name = "documentName") String documentName,
													  @WebParam(name = "documentContent") byte[] documentContent,
													  @WebParam(name = "workflowId") String workflowId,
													  @WebParam(name = "returnUrl") String returnUrl,
													  @WebParam(name = "notificationUrl") String notificationUrl);
	
	@WebMethod(operationName = "prepareSignRequest", action = "urn:prepareSignRequest")
	@WebResult(name = "return")
	SignRequestResponseDTO prepareSignRequest(@WebParam(name = "personId") String personId,
												  @WebParam(name = "documentName") String documentName,
												  @WebParam(name = "documentContent") byte[] documentContent,
												  @WebParam(name = "returnUrl") String returnUrl,
												  @WebParam(name = "notificationUrl") String notificationUrl,
												  @WebParam(name = "metadatos") RequestMetadataDTO[] metadatos);
	
	/*
	@WebMethod(operationName = "getUserRequestsBySearchTerm", action = "urn:getRequestsBySearchTerm")
	@WebResult(name = "return")
	UsersResponseDTO getUsersBySearchTerm(@WebParam(name = "searchTerm") String searchTerm);
	
	@WebMethod(operationName = "getUserRequests", action = "urn:getRequestsBySearchTerm")
	@WebResult(name = "return")
	UsersResponseDTO getUsersBySearchTerm(@WebParam(name = "searchTerm") String searchTerm);

	*/
	
	/**
	 * Evaluates a global workflow and returns an object with response code, error code... 
	 * ... and a string workflow representation
	 * This string can be used in sendRequestWithStrWorkflow method.
	 * @param param Global Workflow ID
	 * @return WorkflowUsersDTO
	 */
	@WebMethod(operationName = "evaluateGlobalWorkFlow", action = "urn:evaluateGlobalWorkFlow")
	@WebResult(name = "return")
	WorkflowUsersDTO evaluateGlobalWorkFlow(@WebParam(name = "workflowId") String workflowId);	
}
