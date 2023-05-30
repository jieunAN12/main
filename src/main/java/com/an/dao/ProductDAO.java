package com.an.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.an.dto.ProductVO;

@Repository
public class ProductDAO {
	
	@Inject
	SqlSession sql;

	public List<ProductVO> listProduct() {
		return sql.selectList("product.listProduct");
	}

	public ProductVO detailProduct(int productId) {
		return sql.selectOne("product.detailProduct", productId);
	}

	public void updateProduct(ProductVO vo) {
		sql.update("product.updateProduct", vo);
	}

	public void deleteProduct(int productId) {
		sql.delete("product.deleteProduct", productId);
	}

	public String fileInfo(int productId) {
		return sql.selectOne("product.fileInfo", productId);
	}

	public void insertProduct(ProductVO vo) {
		sql.insert("product.insertProduct", vo);
	}

	public void insertProduct(MultipartFile file, String fileName) {
		sql.insert("product.insertfile",file);
	}

}
