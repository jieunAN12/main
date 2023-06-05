package com.an.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.an.dto.CartVO;
import com.an.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("cinsert.do")
	public String insert(@ModelAttribute CartVO vo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		System.out.println("컨트롤유저아이디"+userId);
		//장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(vo.getProductId(), userId);
		System.out.println("컨트롤"+count);
		//count == 0 ? cartService.updateCart(vo) : cartService.insert(vo);
		if(count != 0) {
			//없으면 insert
			cartService.updateCart(vo);
			
		}else {
			//있으면 udpate
			cartService.insert(vo);
		}
		return "redirect:/clist.do";
	}
	
	@RequestMapping("clist.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		String userId = (String) session.getAttribute("userId");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list = cartService.listCart(userId);//장바구니 정보
		int sumMoney = cartService.sumMoney(userId);//장바구니 전체금액 호출
		//장바구니 전체 금액에 따라 배송비 구분
		//배송료(10만원 이상 무료, 미만은 2500)
		int fee = sumMoney >= 100000 ? 0 : 2500;
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("allSum", sumMoney+fee);
		
		mav.setViewName("/product/cartList.jsp");
		mav.addObject("map", map);
		
		return mav;
	}
	
	@RequestMapping("/cdelete.do")
	public String delete(@RequestParam int cartId) {
		cartService.delete(cartId);
		return "redirect:/clist.do";
	}
	
	
	@RequestMapping("cupdate.do")
	public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session) {
		//session의 id
		String userId = (String) session.getAttribute("userId");
		//레코드의 갯수 만큼 반복문 실행
		for(int i=0; i<productId.length; i++) {
			CartVO vo = new CartVO();
			vo.setUserId(userId);
			vo.setAmount(amount[i]);
			vo.setProductId(productId[i]);
			cartService.modifyCart(vo);
		}
		return "redirect:/clist.do";
	}
	

}
