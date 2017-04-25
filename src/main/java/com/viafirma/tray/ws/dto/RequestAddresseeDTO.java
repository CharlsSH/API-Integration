package com.viafirma.tray.ws.dto;

import java.util.Date;

public class RequestAddresseeDTO {
	private UserDTO user;
	private String status;
	private String action;
	private Date updated;
	private RejectTypeDTO rejectType;
	private String rejectReason;
	
	public RequestAddresseeDTO(){
		user = new UserDTO();
		status = "";
		rejectType = new RejectTypeDTO();
		rejectReason = "";
		updated = null;
		action = "";
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public RejectTypeDTO getRejectType() {
		return rejectType;
	}

	public void setRejectType(RejectTypeDTO rejectType) {
		this.rejectType = rejectType;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
}
