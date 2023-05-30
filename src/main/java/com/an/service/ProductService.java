package com.an.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.an.dao.ProductDAO;
import com.an.dto.ProductVO;

@Service
public class ProductService {
	
	@Inject
	ProductDAO dao;

	public List<ProductVO> listProduct() {
		return dao.listProduct();
	}

	public ProductVO detailProduct(int productId) {
		return dao.detailProduct(productId);
	}
	
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);
	}
	
	public void deleteProduct(int productId) {
		dao.deleteProduct(productId);
	}

	public String fileInfo(int productId) {
		return dao.fileInfo(productId);
	}

	public void insertProduct(ProductVO vo) {
		String productName = vo.getProductName();
		int productPrice = vo.getProductPrice();
		String productDesc = vo.getProductDesc();
		String productUrl = vo.getProductUrl();
		vo.setProductName(productName);
		vo.setProductPrice(productPrice);
		vo.setProductDesc(productDesc);
		vo.setProductUrl(productUrl);
		dao.insertProduct(vo);
	}

	public void insertProduct(MultipartFile file, String fileName) {
		dao.insertProduct(file, fileName);
	}
}
