<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
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
<%@page import="com.viafirma.tray.ws.dto.WorkflowUsersDTO"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.io.*,java.nio.file.*" %>
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
 String url = request.getRequestURL().toString();
 String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
 
 String connectionURL = "https://testservices.viafirma.com/inbox/app/default/serviceWS";
 String returnURL = baseURL +"examples/sign-request.jsp";
 String notificationURL = baseURL +"notification";
 String system = "ruben";
 String key = "C0G6RE1PZMTV8BSQ9XWQJXRYLK6YU8SLKQBAD5UP";
 
 String serverVersion = "2.5.X";
 String action = (String) request.getParameter("action");
 String res = (String) request.getParameter("res");
 String message = (String) request.getParameter("message");
%>
<%!
 public void showErrorMessage(String msg, javax.servlet.jsp.JspWriter out) {
    try{ out.println("<div class='alert alert-danger'>" + msg + "</div>"); } 
    catch(Exception eek) { }
 }
 
 public void showSuccessMessage(String msg, javax.servlet.jsp.JspWriter out) {
     try{ out.println("<div class='alert alert-success'>" + msg + "</div>"); } 
     catch(Exception eek) { }
 }
%>
<%
 
 if (system != "" && !system.equals("") && key != "" && !key.equals("")) {
     ViafirmaInboxWSTest.init(connectionURL, system, key);
 } else {
     ViafirmaInboxWSTest.init(connectionURL);
 }
 ViafirmaInboxWSTest client = ViafirmaInboxWSTest.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Sample CRM - Viafirma Inbox Integration Demo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <h1><img src="${pageContext.request.contextPath}/images/logo.png" /></h1>
        </header>