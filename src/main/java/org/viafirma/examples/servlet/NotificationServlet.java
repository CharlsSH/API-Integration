package org.viafirma.examples.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NotificationServlet extends HttpServlet {

	private static final long serialVersionUID = 1566489604492122956L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String)request.getParameter("action");
		String label = (String)request.getParameter("label");
		Boolean finished = (request.getParameter("finished") != null);
		
		System.out.println("Recibida notificación ("+action+") para la petición '"+label+"' a las "+(new Date())+". Petición "+(finished?"":"no ")+"finalizada.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
}
