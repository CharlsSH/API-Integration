<%@include file="../includes/header.jsp" %>

<section>
    <h2>Signature request</h2>
    
    <%@include file="../includes/integration-info.jsp" %>
    
    <hr />
    
    <%
    if (action != null && action.equals("preparesignresponse")) {
        out.println("<h3>Result</h3>");
        
        if (res != null && res.equals("ok")) {
            showSuccessMessage("The PDF has been signed successfuly", out);
        } else {
            showErrorMessage("Could not sign the PDF: " + message, out);
        }
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
                 returnURL = returnURL + "?action=preparesignresponse";
                 SignRequestResponseDTO prepareComposeResponse = client.getService().prepareSignRequest(userId, fichero.getName(), Files.readAllBytes(fichero.toPath()), returnURL, notificationURL, new RequestMetadataDTO[] {});
                 
                 if (prepareComposeResponse.getError()) {
                     showErrorMessage("Prepare Sign Request Error(" + prepareComposeResponse.getResponseCode() + "): " + prepareComposeResponse.getMessage(), out);
                 } else {
                     response.sendRedirect(prepareComposeResponse.getRedirectUrl());
                 }
             }
         }
     } catch (SOAPFaultException e) {
         showErrorMessage("Error: " + e.getMessage(), out);
     } catch (WebServiceException e) {
         showErrorMessage("Error: " + e.getMessage(), out);
     }
    %>
    
    <a href="${pageContext.request.contextPath}/index.jsp">&larr; Back</a>
</section>
        
<%@include file="../includes/footer.jsp" %>