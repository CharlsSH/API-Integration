<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.viafirma.examples.singleton.ViafirmaInboxWSTest"%>
<%@page import="com.viafirma.tray.ws.dto.PingResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.UsersResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.UserDTO"%>
<%@page import="com.viafirma.tray.ws.dto.JobsResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.JobDTO"%>
<%@page import="com.viafirma.tray.ws.dto.GroupsResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignatureDocumentDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignedDocumentResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignatureTicketResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.GroupDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RejectTypesResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RejectTypeDTO"%>
<%@page import="com.viafirma.tray.ws.dto.MetadataResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.MetadataDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignatureDocumentDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignedDocumentResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignatureTicketResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.StatusResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.StatusDTO"%>
<%@page import="com.viafirma.tray.ws.dto.ActionTypesResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.ActionTypeDTO"%>
<%@page import="com.viafirma.tray.ws.dto.AccessTypesResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.AccessTypeDTO"%>
<%@page import="com.viafirma.tray.ws.dto.UserResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestUserDTO"%>
<%@page import="com.viafirma.tray.ws.dto.DocumentDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SendRequestResponseDTO"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="com.viafirma.tray.ws.dto.AddCommentResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestInfoResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestCommentsResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestCommentDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestDocumentsResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestAnnexesResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.WorkflowRequestResponseDTO"%>
<%@page import="javax.xml.ws.soap.SOAPFaultException"%>
<%@page import="com.viafirma.tray.ws.dto.WorkflowsResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.WorkflowDTO"%>
<%@page import="javax.xml.ws.WebServiceException"%>
<%@page import="com.viafirma.tray.ws.dto.ComposeRequestResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.SignRequestResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestMetadataResponseDTO"%>
<%@page import="com.viafirma.tray.ws.dto.RequestMetadataDTO"%>

<%
    /*
    * ========================
    *    PUT HERE YOUR CONFIG
    * =========================
    */
    String connectionURL = "http://localhost:9080/tray/app/default/serviceWS";
    String returnURL = "http://localhost:8080/viafirmaInboxWebservicesExamples/index.jsp"; //Our URL
    //Notice it's a sample servlet that just writes something
    String notificationURL = "http://localhost:8080/viafirmaInboxWebservicesExamples/notification";

    // API credentials (ask for them)
    String system = "javi";
    String key = "ACAZGHBNPNB6DRYLOBVJJQKE8JECE1VR0CSN3LDP";

    // An existing sample signed request ID
    String requestId = "E939-CMER-93FQ-8YG5";

    String testUserId = "09431554J"; //An existing user ID
    String testPublicWorkflowID = "BNDNZRTH9N"; //An existing GLOBAL (!) workflow public ID

    /*
    * ========================
    * =========================
    */

    //DON'T MODIFY
    String serverVersion = "1.5.X";
    String testPDFFile = "test.pdf";
    InputStream file = getClass().getResourceAsStream("/" + testPDFFile);
    byte[] data = IOUtils.toByteArray(file);
    String action = (String) request.getParameter("action");
    String res = (String) request.getParameter("res");
    String message = (String) request.getParameter("message");

    //CHECK CODE

    //Init client
    if (system != "" && !system.equals("") && key != "" && !key.equals("")) {
        ViafirmaInboxWSTest.init(connectionURL, system, key);
    } else {
        ViafirmaInboxWSTest.init(connectionURL);
    }
    
    ViafirmaInboxWSTest client = ViafirmaInboxWSTest.getInstance();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Viafirma Inbox WebServices - Examples - Server version: <%=serverVersion%></title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous" />
<link rel="stylesheet" href="../../css/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <img src="../../images/layout/logo-viafirma-inbox.png" />
            <h1>WebServices Examples</h1>
        </header>
        <section>
            <h2>Ping</h2>
            
            <p>Este enlace utiliza el método 'ping' del API; simplemente chequea que la comunicación con el servidor de Viafirma Inbox es correcta, y el user/pass enviado en las cabeceras HTTP autentica correctamente en el servidor.</p>
            
            <hr />
            
            <a href="?action=ping" class="btn btn-primary">Test</a>

            <%
                if (action != null && !action.equals("")) {
                    try {
                        if (action.equals("ping")) {
                            out.println("<h3>Result</h3>");
                            
                            PingResponseDTO pingResponse = client.getService().ping("prueba");
                            if (pingResponse.getError()) {
                                //Error
                                out.println("<div class='alert alert-danger'>Ping Error(" + pingResponse.getResponseCode() + "): " + pingResponse.getMessage() + "</div>");
                            } else {
                                //Ok
                                out.println("<div class='alert alert-success'>Ping Test OK</div>");
                            }
                        }
                    } catch (SOAPFaultException | WebServiceException e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    }
                }
            %>


        </section>
        
        <footer>
            <a href="../../index.jsp" class="pull-left">&larr; Back</a>
            Viafirma 2017. Server version: <%=serverVersion%>
        </footer>
    </div>
</body>

<%@page import="com.viafirma.tray.ws.dto.WorkflowUsersDTO"%></html>