package com.an.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.an.dao.CartDAO;
import com.an.dto.CartVO;

@Service
public class CartService {
	
	@Autowired
	CartDAO dao;

	public int countCart(int productId, String userId) {
		return dao.countCart(productId, userId);
	}

	public int updateCart(CartVO vo) {
		return dao.updateCart(vo);
	}

	public void insert(CartVO vo) {
		dao.insert(vo);
	}

	public List<CartVO> listCart(String userId) {
		return dao.listCart(userId);
	}

	public int sumMoney(String userId) {
		return dao.sumMoney(userId);
	}

	public void delete(int cartId) {
		dao.delete(cartId);
	}

	public void modifyCart(CartVO vo) {
		dao.modifyCart(vo);
	}

}
