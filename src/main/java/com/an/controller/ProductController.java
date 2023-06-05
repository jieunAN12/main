package com.an.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.an.dto.ProductVO;
import com.an.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@RequestMapping("plist.do")
	public ModelAndView plist(ModelAndView mav) {
		mav.setViewName("/product/productList.jsp");
		mav.addObject("plist",productService.listProduct());
		System.out.println(mav+"컨트롤 리스트 확인");
		return mav;
	}
	
	@RequestMapping("/detail/{productId}")
	public ModelAndView detail(@PathVariable("productId") int productId, ModelAndView mav) {
		mav.setViewName("/product/productDetail.jsp");
		mav.addObject("vo", productService.detailProduct(productId));
		return mav;
	}
	
	@RequestMapping("pwrite.do")
	public String write() {
		return "/product/productWrite.jsp";
	}
	
	@RequestMapping("pinsert.do")
	public String pinsert(@ModelAttribute ProductVO vo) {
		System.out.println(vo);
		
		String filename="";
		//첨부파일 사진이 변경되면
		if(!vo.getProductPhoto().isEmpty()) {
			filename = vo.getProductPhoto().getOriginalFilename();
			String path = "C:\\portfolio\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
					+ "tmp0\\wtpwebapps\\main\\product\\images";
			try {
				new File(path).mkdirs();//디렉토리 생성
				//임시 디렉토리 서버에 저장된 파일을 지정된 디렉토리로 전송
				vo.getProductPhoto().transferTo(new File(path+filename));
			}catch(Exception e) {
				e.printStackTrace();
			}
			vo.setProductUrl(filename);
			productService.insertProduct(vo);
		}
		return "redirect:/plist.do";
	}
	
	@RequestMapping("/edit/{productId}")
	public ModelAndView edit(@PathVariable("productId") int productId, ModelAndView mav) {
		mav.setViewName("/product/productEdit.jsp");
		mav.addObject("vo", productService.detailProduct(productId));
		return mav;
	}
	
	@RequestMapping("/pupdate.do")
	public String pupdate(@ModelAttribute ProductVO vo) {
		System.out.println("update"+vo);
		String filename="";
		//첨부파일 사진이 변경되면
		if(!vo.getProductPhoto().isEmpty()) {
			filename = vo.getProductPhoto().getOriginalFilename();
			String path = "C:\\portfolio\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
					+ "tmp0\\wtpwebapps\\main\\product\\images";
			try {
				new File(path).mkdirs();//디렉토리 생성
				//임시 디렉토리 서버에 저장된 파일을 지정된 디렉토리로 전송
				vo.getProductPhoto().transferTo(new File(path+filename));
			}catch(Exception e) {
				e.printStackTrace();
			}
			vo.setProductUrl(filename);
			//첨부파일이 변경되지 않으면
			}else {
				//기존 파일명
			ProductVO vo2 = productService.detailProduct(vo.getProductId());
			vo.setProductUrl(vo2.getProductUrl());
		}
		productService.updateProduct(vo);
		return "redirect:/plist.do";
	}
	
	@RequestMapping("pdelete.do")
	public String pdelete(@RequestParam int productId) {
		//상품 이미지 정보
		String filename=productService.fileInfo(productId);
		String path = "C:\\portfolio\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
					+ "tmp0\\wtpwebapps\\main\\product\\images";
		//상품 이미지 삭제
		if(filename != null) {
			File file = new File(path+filename);
			//파일이 존재하면
			if(file.exists()) {
				file.delete();//파일 삭제
			}
		}
		//레코드 삭제
		productService.deleteProduct(productId);
		return "redirect:/plist.do";
	}
	
}
