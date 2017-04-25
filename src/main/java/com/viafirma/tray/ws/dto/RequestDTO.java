package com.viafirma.tray.ws.dto;

import java.util.Date;

public class RequestDTO {

	private UserDTO user;
	private Date creationDate;
	private String subject;
	private String message;
	private String reference;
	private Date expirationDate;
	private String publicAccessId;
	private String accessType;
	private String accessUser;
	private String accessPassword;
	private String noficationUrl;
	private boolean boolNotifyIfRead;
	private boolean boolNotifyIfReturned;
	private boolean boolNotifyIfSigned;

	public RequestDTO(){
		user = new UserDTO();
		creationDate = null;
		subject = "";
		message = "";
		reference = "";
		expirationDate = null;
		publicAccessId = "";
		accessType = "";
		accessUser = "";
		accessPassword = "";
		noficationUrl = null;
		boolNotifyIfRead = false;
		boolNotifyIfReturned = false;
		boolNotifyIfSigned = false;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}
	
	public String getPublicAccessId() {
		return publicAccessId;
	}

	public void setPublicAccessId(String publicAccessId) {
		this.publicAccessId = publicAccessId;
	}
	
	public String getAccessType() {
		return accessType;
	}

	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}

	public String getAccessUser() {
		return accessUser;
	}

	public void setAccessUser(String accessUser) {
		this.accessUser = accessUser;
	}

	public String getAccessPassword() {
		return accessPassword;
	}

	public void setAccessPassword(String accessPassword) {
		this.accessPassword = accessPassword;
	}
	
	public boolean getBoolNotifyIfRead() {
		return boolNotifyIfRead;
	}

	public void setBoolNotifyIfRead(boolean boolNotifyIfRead) {
		this.boolNotifyIfRead = boolNotifyIfRead;
	}

	public boolean getBoolNotifyIfReturned() {
		return boolNotifyIfReturned;
	}

	public void setBoolNotifyIfReturned(boolean boolNotifyIfReturned) {
		this.boolNotifyIfReturned = boolNotifyIfReturned;
	}

	public boolean getBoolNotifyIfSigned() {
		return boolNotifyIfSigned;
	}

	public void setBoolNotifyIfSigned(boolean boolNotifyIfSigned) {
		this.boolNotifyIfSigned = boolNotifyIfSigned;
	}

	public String getNoficationUrl() {
		return noficationUrl;
	}

	public void setNoficationUrl(String noficationUrl) {
		this.noficationUrl = noficationUrl;
	}
	
}
