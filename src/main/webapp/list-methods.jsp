<%@include file="includes/header.jsp" %>

        <section>
            <h2>API Methods</h2>
            
            <%

    // An existing sample signed request ID
    String requestId = "E939-CMER-93FQ-8YG5";

    String testUserId = "99331100"; //An existing user ID
    String testPublicWorkflowID = "MF0GXK40PC"; //An existing GLOBAL (!) workflow public ID

    /*
    * ========================
    * =========================
    */

    //DON'T MODIFY
    String testPDFFile = "test.pdf";
    InputStream file = getClass().getResourceAsStream("/" + testPDFFile);
    byte[] data = IOUtils.toByteArray(file);

    //SAMPLES
    try {
        if (action != null && action.equals("preparecompose")) {
            returnURL += "?action=preparecomposeresponse";
            ComposeRequestResponseDTO prepareComposeResponse = client.getService().prepareComposeRequest(testUserId, testPDFFile, data, returnURL, notificationURL);

            if (prepareComposeResponse.getError()) {
                //Error
                out.println("<p class='error'>Prepare Compose Request Error(" + prepareComposeResponse.getResponseCode() + "): " + prepareComposeResponse.getMessage() + "</p>");
            } else {
                //Ok
                response.sendRedirect(prepareComposeResponse.getRedirectUrl());
            }

        } else if (action != null && action.equals("prepareworkflowcompose")) {
            returnURL += "?action=prepareworkflowcomposeresponse";
            WorkflowRequestResponseDTO prepareComposeResponse = client.getService().prepareWorkflowRequest(testUserId, testPDFFile, data, testPublicWorkflowID, returnURL, notificationURL);

            if (prepareComposeResponse.getError()) {
                //Error
                out.println("<p class='error'>Prepare Workflow Compose Request Error(" + prepareComposeResponse.getResponseCode() + "): " + prepareComposeResponse.getMessage() + "</p>");
            } else {
                //Ok
                response.sendRedirect(prepareComposeResponse.getRedirectUrl());
            }

        } else if (action != null && action.equals("preparesign")) {
            returnURL += "?action=preparesignresponse";
            SignRequestResponseDTO prepareComposeResponse = client.getService().prepareSignRequest(testUserId, testPDFFile, data, returnURL, notificationURL, new RequestMetadataDTO[] {});

            if (prepareComposeResponse.getError()) {
                //Error
                out.println("<p class='error'>Prepare Sign Request Error(" + prepareComposeResponse.getResponseCode() + "): " + prepareComposeResponse.getMessage() + "</p>");
            } else {
                //Ok
                response.sendRedirect(prepareComposeResponse.getRedirectUrl());
            }
        }
    } catch (SOAPFaultException e) {
        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
    } catch (WebServiceException e) {
        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
    }
%>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Integration info</h3>
                </div>
                <div class="panel-body">
                    <ul>
                        <li><strong>Viafirma Inbox URL</strong>: <%=connectionURL%></li>
                        <li><strong>System</strong>: <%=system%></li>
                        <li><strong>API Key</strong>: <%=key%></li>
                    </ul>
                </div>
            </div>
            
            <%
                if (action != null && !action.equals("")) {
                    out.println("<hr />");

                    try {
                        if (action.equals("ping")) {
                            out.println("<h2>Ping Test</h2>");
                            PingResponseDTO pingResponse = client.getService().ping("prueba");
                            if (pingResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get All users Error(" + pingResponse.getResponseCode() + "): " + pingResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                out.println("<p>Ping Test OK</p>");
                            }

                        } else if (action.equals("users")) {
                            out.println("<h2>Get All Users</h2>");
                            UsersResponseDTO usersResponse = client.getService().getUsers();
                            if (usersResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get All users Error(" + usersResponse.getResponseCode() + "): " + usersResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                UserDTO[] usuarios = usersResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < usuarios.length; i++) {
                                    out.println("<li>" + usuarios[i].getName() + " " + usuarios[i].getSurname1() + " " + usuarios[i].getSurname2() + " [" + usuarios[i].getNif() + "]</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("userbynif")) {
                            out.println("<h2>Get User By Nif (Ej. " + testUserId + ")</h2>");
                            UserResponseDTO userResponse = client.getService().getUserByPersonId(testUserId);
                            if (userResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get All users Error(" + userResponse.getResponseCode() + "): " + userResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                UserDTO usuario = userResponse.getResult();
                                out.println("<ul>");
                                if (usuario != null) {
                                    out.println("<li>" + usuario.getName() + " " + usuario.getSurname1() + " " + usuario.getSurname2() + " [" + usuario.getNif() + "]</li>");
                                } else {
                                    out.println("<li>User Not Found</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("searchusers")) {
                            out.println("<h2>Search Users (Query=Admin)</h2>");
                            UsersResponseDTO usersResponse = client.getService().getUsersBySearchTerm("Admin");
                            if (usersResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Search Users Error(" + usersResponse.getResponseCode() + "): " + usersResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                UserDTO[] usuarios = usersResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < usuarios.length; i++) {
                                    out.println("<li>" + usuarios[i].getName() + " " + usuarios[i].getSurname1() + " " + usuarios[i].getSurname2() + " [" + usuarios[i].getNif() + "]</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("jobs")) {
                            out.println("<h2>Get Jobs</h2>");
                            JobsResponseDTO jobsResponse = client.getService().getJobs();
                            if (jobsResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Jobs Error(" + jobsResponse.getResponseCode() + "): " + jobsResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                JobDTO[] jobs = jobsResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < jobs.length; i++) {
                                    out.println("<li>" + jobs[i].getName() + " [" + jobs[i].getPublicAccessId() + "]</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("workflows")) {
                            out.println("<h2>Get Workflows</h2>");
                            WorkflowsResponseDTO workflowsResponse = client.getService().getWorkflows();
                            if (workflowsResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Workflows Error(" + workflowsResponse.getResponseCode() + "): " + workflowsResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                WorkflowDTO[] workflows = workflowsResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < workflows.length; i++) {
                                    out.println("<li>" + workflows[i].getName() + " [" + workflows[i].getPublicAccessId() + "]</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("groups")) {
                            out.println("<h2>Get Groups</h2>");
                            GroupsResponseDTO groupsResponse = client.getService().getGroups();
                            if (groupsResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Groups Error(" + groupsResponse.getResponseCode() + "): " + groupsResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                GroupDTO[] groups = groupsResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < groups.length; i++) {
                                    out.println("<li>" + groups[i].getName() + " [" + groups[i].getPublicAccessId() + "]</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("rejecttypes")) {
                            out.println("<h2>Get Reject Types</h2>");
                            RejectTypesResponseDTO rejecttypesResponse = client.getService().getRejectTypes();
                            if (rejecttypesResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Reject Types Error(" + rejecttypesResponse.getResponseCode() + "): " + rejecttypesResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                RejectTypeDTO[] rejecttypes = rejecttypesResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < rejecttypes.length; i++) {
                                    out.println("<li>" + rejecttypes[i].getName() + "</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("metadata")) {
                            out.println("<h2>Get Metadata Keys</h2>");
                            MetadataResponseDTO metadataResponse = client.getService().getMetadataKeys();
                            if (metadataResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Reject Types Error(" + metadataResponse.getResponseCode() + "): " + metadataResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                MetadataDTO[] metadatas = metadataResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < metadatas.length; i++) {
                                    out.println("<li>" + metadatas[i].getKey() + " : " + metadatas[i].getDefaultValue() + "</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("status")) {
                            out.println("<h2>Get Status</h2>");
                            StatusResponseDTO statusResponse = client.getService().getStatus();
                            if (statusResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Status Error(" + statusResponse.getResponseCode() + "): " + statusResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                StatusDTO[] status = statusResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < status.length; i++) {
                                    out.println("<li>" + status[i].getName() + "</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("actiontypes")) {
                            out.println("<h2>Get Action Types</h2>");
                            ActionTypesResponseDTO actionTypesResponse = client.getService().getActionTypes();
                            if (actionTypesResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Action Types Error(" + actionTypesResponse.getResponseCode() + "): " + actionTypesResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                ActionTypeDTO[] actionTypes = actionTypesResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < actionTypes.length; i++) {
                                    out.println("<li>" + actionTypes[i].getName() + "</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("accesstypes")) {
                            out.println("<h2>Get Access Types</h2>");
                            AccessTypesResponseDTO accessTypesResponse = client.getService().getAccessTypes();
                            if (accessTypesResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Get Access Types Error(" + accessTypesResponse.getResponseCode() + "): " + accessTypesResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                AccessTypeDTO[] accessTypes = accessTypesResponse.getResult();
                                out.println("<ul>");
                                for (int i = 0; i < accessTypes.length; i++) {
                                    out.println("<li>" + accessTypes[i].getName() + "</li>");
                                }
                                out.println("</ul>");

                            }

                        } else if (action.equals("requestoperations")) {
                            out.println("<h2>Test Request Operations</h2>");
                            //1. Send Request
                            //2. Add Coment
                            //3. Get Request Info
                            //4. Get Request Comments
                            //5. Get Request Documents
                            //6. Get Request Annexes
                            //7. Get Request Metadata

                            RequestDTO sendRequest = new RequestDTO();
                            RequestUserDTO destinatario = new RequestUserDTO();
                            DocumentDTO documento = new DocumentDTO();
                            DocumentDTO anexo = new DocumentDTO();
                            MetadataDTO metadato = new MetadataDTO();
                            metadato.setKey("MetadatoPrueba");
                            metadato.setDefaultValue("Valor del metadato");

                            destinatario.setPersonId(testUserId);

                            sendRequest.setAccessType("ANONIMO");
                            sendRequest.setBoolNotifyIfRead(true);
                            sendRequest.setBoolNotifyIfReturned(true);
                            sendRequest.setBoolNotifyIfSigned(true);
                            sendRequest.setMessage("Test WS Request");
                            sendRequest.setSubject("Test WS Request");
                            sendRequest.setNoficationUrl(notificationURL);

                            documento.setFileName(testPDFFile);
                            documento.setData(data);

                            anexo.setFileName(testPDFFile);
                            anexo.setData(data);

                            RequestUserDTO[][][] destinatarios = { { { destinatario } } };
                            DocumentDTO[] documentos = { documento };
                            DocumentDTO[] anexos = { anexo };
                            MetadataDTO[] reqMetadatos = { metadato };

                            //Enviamos la petición
                            out.println("<ol>");
                            SendRequestResponseDTO respuestaSendRequest = client.getService().sendRequest(sendRequest, destinatarios, documentos, anexos, reqMetadatos);
                            if (respuestaSendRequest.getError()) {
                                //Error
                                out.println("<li><p class='error'>Send Request Error(" + respuestaSendRequest.getResponseCode() + "): " + respuestaSendRequest.getMessage() + "</p></li>");
                            } else {
                                //Ok
                                out.println("<li>Send Request OK</li>");
                                String idPeticion = respuestaSendRequest.getResult().getPublicAccessId();

                                //Ahora añadimos un comentario a la petición
                                AddCommentResponseDTO respuestaComentario = client.getService().addComment(idPeticion, "Test Comment");
                                if (respuestaComentario.getError()) {
                                    //Error
                                    out.println("<li><p class='error'>Add Comment Error(" + respuestaComentario.getResponseCode() + "): " + respuestaComentario.getMessage() + "</p></li>");
                                } else {
                                    out.println("<li>Add Comment OK</li>");
                                }

                                //Ahora a partir del id de la petición, recuperamos su info
                                RequestInfoResponseDTO requestInfo = client.getService().getRequestInfo(idPeticion);
                                if (requestInfo.getError()) {
                                    //Error
                                    out.println("<li><p class='error'>Get Request Info Error(" + requestInfo.getResponseCode() + "): " + requestInfo.getMessage() + "</p></li>");
                                } else {
                                    //Ok
                                    RequestDTO requestAdd = requestInfo.getResult();
                                    out.println("<li>Get Request Info OK (Subject:'" + requestAdd.getSubject() + "', Message:'" + requestAdd.getMessage() + "',...)</li>");
                                }

                                //Get request comments
                                RequestCommentsResponseDTO reqCommResp = client.getService().getRequestComments(idPeticion);
                                if (reqCommResp.getError()) {
                                    //Error
                                    out.println("<li><p class='error'>Get Request Comments Error(" + reqCommResp.getResponseCode() + "): " + reqCommResp.getMessage() + "</p></li>");
                                } else {
                                    //Ok
                                    RequestCommentDTO[] comentarios = reqCommResp.getResult();
                                    out.println("<li>Get Request Comments OK (" + comentarios.length + " founds)</li>");

                                }

                                //Documentos firma
                                RequestDocumentsResponseDTO documentosFirmaResponse = client.getService().getRequestDocuments(idPeticion);
                                if (documentosFirmaResponse.getError()) {
                                    //Error
                                    out.println(
                                            "<li><p class='error'>Get Request Documents Error(" + documentosFirmaResponse.getResponseCode() + "): " + documentosFirmaResponse.getMessage() + "</p></li>");
                                } else {
                                    //Ok
                                    DocumentDTO[] documentosFirma = documentosFirmaResponse.getResult();
                                    out.println("<li>");
                                    out.println("Get Request Documents OK");
                                    out.println("<ul>");
                                    for (int i = 0; i < documentosFirma.length; i++) {
                                        out.println("<li><a href='" + documentosFirma[i].getDownloadUrl() + "' title='Download Document'>" + documentosFirma[i].getFileName() + "</a></li>");
                                    }
                                    out.println("</ul>");
                                    out.println("</li>");

                                }

                                //Documentos anexos
                                RequestAnnexesResponseDTO documentosAnexosResponse = client.getService().getRequestAnnexes(idPeticion);
                                if (documentosAnexosResponse.getError()) {
                                    //Error
                                    out.println(
                                            "<li><p class='error'>Get Request Annexes Error(" + documentosAnexosResponse.getResponseCode() + "): " + documentosFirmaResponse.getMessage() + "</p></li>");
                                } else {
                                    //Ok
                                    DocumentDTO[] documentosFirma = documentosAnexosResponse.getResult();
                                    out.println("<li>");
                                    out.println("Get Request Annexes OK");
                                    out.println("<ul>");
                                    for (int i = 0; i < documentosFirma.length; i++) {
                                        out.println("<li><a href='" + documentosFirma[i].getDownloadUrl() + "' title='Download Document'>" + documentosFirma[i].getFileName() + "</a></li>");
                                    }
                                    out.println("</ul>");
                                    out.println("</li>");

                                }

                                //Get request metadata
                                RequestMetadataResponseDTO reqMetadata = client.getService().getRequestMetadata(idPeticion);
                                if (reqMetadata.getError()) {
                                    //Error
                                    out.println("<li><p class='error'>Get Request Metadata Error(" + reqMetadata.getResponseCode() + "): " + reqMetadata.getMessage() + "</p></li>");
                                } else {
                                    //Ok
                                    RequestMetadataDTO[] metadatos = reqMetadata.getResult();
                                    out.println("<li>Get Request Metadata OK (" + metadatos.length + " founds)</li>");

                                }

                            }
                            out.println("</ol>");
                        } else if (action.equals("signeddocument")) {
                            SignedDocumentResponseDTO signedDocResponse = client.getService().getSignedDocument(requestId);
                            if (signedDocResponse.getError()) {
                                //Error
                                out.println("<li><p class='error'>Get Signed Document Error(" + signedDocResponse.getResponseCode() + "): " + signedDocResponse.getMessage() + "</p></li>");
                            } else {
                                //Ok
                                SignatureDocumentDTO doc = signedDocResponse.getResult();
                                out.println("<li>Get Signed Document OK (" + doc.getFileName() + " retrieved)</li>");
                            }

                        } else if (action.equals("signatureticket")) {
                            SignatureTicketResponseDTO signTicketResponse = client.getService().getSignatureTicket(requestId);
                            if (signTicketResponse.getError()) {
                                //Error
                                out.println("<li><p class='error'>Get Signature Ticket Error(" + signTicketResponse.getResponseCode() + "): " + signTicketResponse.getMessage() + "</p></li>");
                            } else {
                                //Ok
                                SignatureDocumentDTO doc = signTicketResponse.getResult();
                                out.println("<li>Get Signature Ticket OK (" + doc.getFileName() + " retrieved)</li>");
                            }
                        } else if (action.equals("signeddocument")) {
                            SignedDocumentResponseDTO signedDocResponse = client.getService().getSignedDocument(requestId);
                            if (signedDocResponse.getError()) {
                                //Error
                                out.println("<li><p class='error'>Get Signed Document Error(" + signedDocResponse.getResponseCode() + "): " + signedDocResponse.getMessage() + "</p></li>");
                            } else {
                                //Ok
                                SignatureDocumentDTO doc = signedDocResponse.getResult();
                                out.println("<li>Get Signed Document OK (" + doc.getFileName() + " retrieved)</li>");
                            }

                        } else if (action.equals("signatureticket")) {
                            SignatureTicketResponseDTO signTicketResponse = client.getService().getSignatureTicket(requestId);
                            if (signTicketResponse.getError()) {
                                //Error
                                out.println("<li><p class='error'>Get Signature Ticket Error(" + signTicketResponse.getResponseCode() + "): " + signTicketResponse.getMessage() + "</p></li>");
                            } else {
                                //Ok
                                SignatureDocumentDTO doc = signTicketResponse.getResult();
                                out.println("<li>Get Signature Ticket OK (" + doc.getFileName() + " retrieved)</li>");
                            }

                        } else if (action.equals("preparecomposeresponse")) {
                            out.println("<h2>Prepare Compose Request</h2>");
                            if (res != null && res.equals("ok")) {
                                out.println("<p>Sent Successfully</p>");
                            } else {
                                out.println("<p class='error'>ERROR: " + message + "</p>");
                            }

                        } else if (action.equals("prepareworkflowcomposeresponse")) {
                            out.println("<h2>Prepare Workflow Compose Request</h2>");
                            if (res != null && res.equals("ok")) {
                                out.println("<p>Sent Successfully</p>");
                            } else {
                                out.println("<p class='error'>ERROR: " + message + "</p>");
                            }

                        } else if (action.equals("preparesignresponse")) {
                            out.println("<h2>Prepare Sign Request</h2>");
                            if (res != null && res.equals("ok")) {
                                out.println("<p>Sign Successfully</p>");
                            } else {
                                out.println("<p class='error'>ERROR: " + message + "</p>");
                            }

                        } else if (action.equals("evaluateGlobalWorkflow")) {
                            out.println("<h2>Evaluate Global Workflow and Send Request With a Workflow String Representation</h2>");
                            WorkflowUsersDTO evaluateWorkflowResponse = client.getService().evaluateGlobalWorkFlow(testPublicWorkflowID);
                            if (evaluateWorkflowResponse.getError()) {
                                //Error
                                out.println("<p class='error'>Evaluate Global Workflow Error(" + evaluateWorkflowResponse.getResponseCode() + "): " + evaluateWorkflowResponse.getMessage() + "</p>");
                            } else {
                                //Ok
                                String workflowRep = evaluateWorkflowResponse.getWorkflowStringRepresentation();
                                out.println("<p>Se ha recuperado un workflow que vamos a pasar a sendRequestWithStrWorkflow: " + workflowRep + "</p>");
                                //Ahora llamamos a sendRequestWithStrWorkflow
                                RequestDTO sendRequest = new RequestDTO();

                                DocumentDTO documento = new DocumentDTO();
                                DocumentDTO anexo = new DocumentDTO();
                                MetadataDTO metadato = new MetadataDTO();
                                metadato.setKey("MetadatoPrueba");
                                metadato.setDefaultValue("Valor del metadato");

                                sendRequest.setAccessType("ANONIMO");
                                sendRequest.setBoolNotifyIfRead(true);
                                sendRequest.setBoolNotifyIfReturned(true);
                                sendRequest.setBoolNotifyIfSigned(true);
                                sendRequest.setSubject("Test WS Request using evaluateGlobalWorkFlow");
                                sendRequest.setMessage("Test WS Request using evaluateGlobalWorkFlow: " + workflowRep);
                                sendRequest.setNoficationUrl(notificationURL);

                                documento.setFileName(testPDFFile);
                                documento.setData(data);

                                anexo.setFileName(testPDFFile);
                                anexo.setData(data);

                                DocumentDTO[] documentos = { documento };
                                DocumentDTO[] anexos = { anexo };
                                MetadataDTO[] reqMetadatos = { metadato };

                                //Enviamos la petición
                                out.println("<ul>");
                                SendRequestResponseDTO respuestaSendRequest = client.getService().sendRequestWithStrWorkflow(sendRequest, workflowRep, documentos, anexos, reqMetadatos);
                                if (respuestaSendRequest.getError()) {
                                    //Error
                                    out.println(
                                            "<li><p class='error'>sendRequestWithStrWorkflow Error(" + respuestaSendRequest.getResponseCode() + "): " + respuestaSendRequest.getMessage() + "</p></li>");
                                } else {
                                    out.println("<li>Peticion: " + respuestaSendRequest.getResult().getPublicAccessId() + "</li>");
                                }
                                out.println("</ul>");

                            }
                        }
                    } catch (SOAPFaultException e) {
                        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                    } catch (WebServiceException e) {
                        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                    }
                }
            %>
            
            <div class="row">
                <div class="col-md-6">
                    <!-- Utility -->
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Utility</h3>
                      </div>
                      <div class="panel-body">
                        <dl>
                            <dt><a href="?action=ping">Ping</a></dt>
                            <dd>Este enlace utiliza el método 'ping' del API; simplemente chequea que la comunicación con el servidor de Viafirma Inbox es correcta, y el user/pass enviado en las cabeceras HTTP autentica correctamente en el servidor.</dd>
                            
                            <dt><a href="?action=jobs">Get Jobs</a></dt>
                            <dd>Recupera los cargos de la instancia de Viafirma Inbox, devolviendo su identificador único y su nombre literal</dd>
                            
                            <dt><a href="?action=groups">Get Groups</a></dt>
                            <dd>Recupera los grupos de la instancia de Viafirma Inbox, devolviendo su identificador único y su nombre literal</dd>
                
                            <dt><a href="?action=workflows">Get Workflows</a></dt>
                            <dd>Recupera los flujos de trabajo públicos de la instancia de Viafirma Inbox, devolviendo su identificador único y su nombre literal.</dd>
                
                            <dt><a href="?action=rejecttypes">Get Reject Types</a></dt>
                            <dd>Recupera los motivos de rechazo normalizados de la instancia de Viafirma Inbox.</dd>
                            
                            <dt><a href="?action=metadata">Get Metadata Keys</a></dt>
                            <dd>Recupera los metadatos globales de la instancia de Viafirma Inbox, devolviendo su nombre y su valor por defecto, si existe.</dd>
                
                            <dt><a href="?action=status">Get Status</a></dt>
                            <dd>Recupera la lista de posibles estados de una petición. Viafirma Inbox devuelve uno de estos valores a la dirección de notificación en un parámetro HTTP llamado 'action'.</dd>
                            
                            <dt><a href="?action=actiontypes">Get Action Types</a></dt>
                            <dd>Recupera la lista de posibles acciones a realizar en una petición para un usuario (FIRMA, VISTOBUENO); debe pasarse uno de estos valores para un par petición de firma / usuario (un usuario sólo puede firmar o hacer visto bueno, además de rechazar la petición).</dd>
                        
                            <dt><a href="?action=accesstypes">Get Access Types</a></dt>
                            <dd>Recupera la lista de posibles tipos de acceso a la verificación para una petición; uno de estos valores debe pasarse como atributo de una petición al crearla vía API.</dd>
                        </dl>
                      </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <!-- Work with the system -->
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Work with the system</h3>
                      </div>
                      <div class="panel-body">
                        <dl>
                            <dt><a href="?action=requestoperations">Test Request Operations</a></dt>
                            <dd>
                                <p>Método general de prueba para la gestión de peticiones en remoto vía API. Utiliza varios métodos:</p>
                                <ol>
                                    <li><code>sendRequest</code>, para crear la petición (data generales, ficheros, destinatarios, metadatos, etc.)</li>
                                    <li><code>addComment</code>, para añadir un comentario a la petición.</li>
                                    <li><code>getRequestInfo</code>, para recuperar información de la petición.</li>
                                    <li><code>getRequestComments</code>, para recuperar los comentarios de la petición.</li>
                                    <li><code>getRequestDocuments</code>, para recuperar los documentos firmables de la petición.</li>
                                    <li><code>getRequestAnnexes</code>, para recuperar los documentos anexos a la petición.</li>
                                    <li><code>getRequestMetadata</code>, para recuperar los metadatos (clave/valor) de la petición.</li>
                                </ol>
                            </dd>
                               
                            <dt><a href="?action=signeddocument">Get Signed Document</a></dt>
                            <dd>Recupera el pdf firmado de una petición.</dd>
                            
                            <dt><a href="?action=signatureticket">Get Signature Ticket</a></dt>
                            <dd>Recupera el informe de firmas de una petición.</dd>
                            
                            <dt><a href="?action=preparecompose">Prepare Compose Request</a></dt>
                            <dd>Esta opción realiza una comunicación con Viafirma Inbox para preparar la pantalla de creación de una petición, enviando el documento en dicha comunicación. El usuario es redirigido a Viafirma Inbox, y al enviar la petición, retorna a la aplicación origen.</dd>
                                    
                            <dt><a href="?action=prepareworkflowcompose">Prepare Workflow Compose Request (Ej. '<%=testPublicWorkflowID%>') </a></dt>
                            <dd>Esta opción es similar a la anterior, pero permite además especificar un flujo global existente a priori en la instancia de Viafirma Inbox.</dd>
                            
                            <dt><a href="?action=preparesign">Prepare Sign Request</a></dt>
                            <dd>Esta opción va un paso más allá que las anteriores; se trata de una comunicación para preparar una petición con un solo firmante; el usuario firmante es redirigido desde la aplicación origen a Viafirma Inbox, allí firma la petición recién creada, y es redirigido de vuelta a la aplicación origen.</dd>
                            
                            <dt><a href="?action=evaluateGlobalWorkflow">Evaluate Global Workflow and Send Request with the obtained String Workflow Representation</a></dt>
                            <dd>Dado el ID de un workflow, recupera una representación String del mismo, que puede ser utilizado como parámetro para un sendRequestWithStrWorkflow</dd>
                        </dl>
                      </div>
                    </div>
                </div>
            </div>
            
            <!-- Users -->
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Users</h3>
              </div>
              <div class="panel-body">
                <dl>
                    <dt><a href="?action=users">Get all users</a></dt>
                    <dd>Recupera los usuarios de la instancia de Viafirma Inbox.</dd>
                    
                    <dt><a href="?action=userbynif">Get user by NIF (ex. <%=testUserId%>)</a></dt>
                    <dd>Busca un usuario por un identificador (NIF).</dd>
                    
                    <dt><a href="?action=searchusers">Search Users (ex. Admin)</a></dt>
                    <dd>Busca un usuario por un literal (que puede coincidir con el NIF, nombre, apellido 1, apellido 2...).</dd>
                </dl>
              </div>
            </div>

            <a href="${pageContext.request.contextPath}/index.jsp">&larr; Back</a>
        </section>
        
        <%@include file="includes/footer.jsp" %>