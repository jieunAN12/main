package com.an.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	
	private int productId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productUrl;
	private MultipartFile productPhoto;
	
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductUrl() {
		return productUrl;
	}

	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}

	public MultipartFile getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDesc=" + productDesc + ", productUrl=" + productUrl + ", productPhoto=" + productPhoto
				+ "]";
	}
	
}
