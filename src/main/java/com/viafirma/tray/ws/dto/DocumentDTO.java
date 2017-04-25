package com.viafirma.tray.ws.dto;

public class DocumentDTO {
	
	private String signType;
	private String fileHash;
	private String fileExtension;
	private long fileSize;
	private String fileName;
	private String fileMimeType;
	private String signFormat;
	private String reference;
	private String downloadUrl;
	private boolean boolIsAnnex;
	private byte[] data;
	private String publicAccessId;

	public DocumentDTO() {
		signType = "";
		fileHash = "";
		fileExtension = "";
		fileSize = 0L;
		fileName = "";
		fileMimeType = "";
		signFormat = "";
		reference = "";
		downloadUrl = "";
		boolIsAnnex = false;
		data = null;
		publicAccessId = "";
	}
	
	//*******************************
	//		Getters / Setters
	//*******************************
	public String getSignType() {
		return signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
	}

	public String getFileHash() {
		return fileHash;
	}

	public void setFileHash(String fileHash) {
		this.fileHash = fileHash;
	}

	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileMimeType() {
		return fileMimeType;
	}

	public void setFileMimeType(String fileMimeType) {
		this.fileMimeType = fileMimeType;
	}

	public String getSignFormat() {
		return signFormat;
	}

	public void setSignFormat(String signFormat) {
		this.signFormat = signFormat;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}
	
	public boolean getBoolIsAnnex() {
		return boolIsAnnex;
	}

	public void setBoolIsAnnex(boolean boolIsAnnex) {
		this.boolIsAnnex = boolIsAnnex;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	public String getPublicAccessId() {
		return publicAccessId;
	}

	public void setPublicAccessId(String publicAccessId) {
		this.publicAccessId = publicAccessId;
	}
	
}
