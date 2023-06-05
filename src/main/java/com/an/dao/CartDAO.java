package com.an.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.an.dto.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSession sql;

	public int countCart(int productId, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("productId", productId);
		System.out.println("dao map"+map);
		return sql.selectOne("cart.countCart", map);
	}

	public int updateCart(CartVO vo) {
		return sql.update("cart.updateCart", vo);
	}

	public void insert(CartVO vo) {
		sql.insert("cart.insert", vo);
	}

	public List<CartVO> listCart(String userId) {
		return sql.selectList("cart.listCart", userId);
	}

	public int sumMoney(String userId) {
		sql.selectOne("cart.sumMoney", userId);
		return sql.selectOne("cart.sumMoney", userId);
		
	}

	public void delete(int cartId) {
		sql.delete("cart.delete", cartId);
	}

	public void modifyCart(CartVO vo) {
		sql.update("cart.modifyCart", vo);
	}

}
