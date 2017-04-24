package com.viafirma.tray.ws.dto;

public class SignatureDocumentDTO {
	
	private String fileName;
	private byte[] data;

	public SignatureDocumentDTO() {
		fileName = "";
		data = null;
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
	
}
