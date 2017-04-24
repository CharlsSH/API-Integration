package com.viafirma.tray.ws.dto;

import java.util.Date;

public class RequestCommentDTO {

	private UserDTO user;
	private String comment;
	private Date date;
	private String idRequest;

	public RequestCommentDTO(){
		user = new UserDTO();
		comment = "";
		date = null;
		idRequest = "";
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}		
	
	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}
	public String getIdRequest() {
		return idRequest;
	}

	public void setIdRequest(String idRequest) {
		this.idRequest = idRequest;
	}

}
