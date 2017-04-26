<%@include file="../includes/header.jsp" %>

<section>
    <h2>Send Viafirma Inbox request</h2>
    
    <%@include file="../includes/integration-info.jsp" %>
    
    <hr />
    
    <%
        try {
            String contentType = request.getContentType();
       
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                File fichero = null;
                String userId = null;
                List items = upload.parseRequest(request);
       
                for (Object item : items) {
                   FileItem uploaded = (FileItem) item;
       
                   if (!uploaded.isFormField()) {
                      fichero = new File("/tmp", uploaded.getName());
                      uploaded.write(fichero);
                   } else {
                       userId = uploaded.getString();
                   }
                }
                
                if (userId != null && fichero != null) {
                    RequestDTO sendRequest = new RequestDTO();
                    RequestUserDTO destinatario = new RequestUserDTO();
                    DocumentDTO documento = new DocumentDTO();
                    DocumentDTO anexo = new DocumentDTO();
                    MetadataDTO metadato = new MetadataDTO();
                    metadato.setKey("SampleMetadata");
                    metadato.setDefaultValue("Sample metadata value: lorem ipsum dolor");

                    destinatario.setPersonId(userId);

                    sendRequest.setAccessType("ANONIMO");
                    sendRequest.setBoolNotifyIfRead(true);
                    sendRequest.setBoolNotifyIfReturned(true);
                    sendRequest.setBoolNotifyIfSigned(true);
                    sendRequest.setMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in imperdiet metus. Curabitur accumsan, nisl ac scelerisque suscipit, tortor turpis elementum nibh, eu laoreet turpis risus dignissim urna. Cras iaculis, odio at maximus venenatis, lorem felis posuere nisi, non consectetur sem magna sit amet dolor. Cras in dolor at eros tempor ornare. Integer egestas consectetur placerat. Proin sit amet volutpat dui. Nunc mattis metus id arcu ultrices, auctor molestie magna ultricies.");
                    sendRequest.setSubject("Request from sample integration app");
                    sendRequest.setNoficationUrl(notificationURL);

                    documento.setFileName(fichero.getName());
                    documento.setData(Files.readAllBytes(fichero.toPath()));

                    RequestUserDTO[][][] destinatarios = { { { destinatario } } };
                    DocumentDTO[] documentos = { documento };
                    DocumentDTO[] anexos = { };
                    MetadataDTO[] reqMetadatos = { metadato };

                    SendRequestResponseDTO respuestaSendRequest = client.getService().sendRequest(sendRequest, destinatarios, documentos, anexos, reqMetadatos);
                    
                    out.println("<h3>Result</h3>");
                    if (respuestaSendRequest.getError()) {
                        showErrorMessage("Could not send the request: ("+ respuestaSendRequest.getResponseCode() +") " + respuestaSendRequest.getMessage(), out);
                    } else {
                        showSuccessMessage("Request successfuly sent", out);
                    }
                }
            }
        } catch (SOAPFaultException e) {
            showErrorMessage("Error: " + e.getMessage(), out);
        } catch (WebServiceException e) {
            showErrorMessage("Error: " + e.getMessage(), out);
        }
    %>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Request data</h3>
        </div>
        <div class="panel-body">
            <form  class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="userID" class="col-sm-2 control-label">User</label>
                    <div class="col-sm-10">
                        <select id="userId" name="userId" class="form-control">
                            <option value="99331100">99331100</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="file" class="col-sm-2 control-label">PDF to be signed</label>
                    <div class="col-sm-10">
                        <input type="file" name="file" accept="application/pdf" />
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <a href="${pageContext.request.contextPath}/index.jsp">&larr; Back</a>
</section>
        
<%@include file="../includes/footer.jsp" %>