package com.an.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.an.dto.BoardPager;
import com.an.dto.BoardVO;
import com.an.service.RboardService;

@Controller
public class RboardController {
	
	@Autowired
	RboardService rboardService;
	
	@RequestMapping("/list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="1") int curPage){
		
		//레코드의 갯수
		int count = rboardService.contArticle(searchOption, keyword);
		//페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
	
		List<BoardVO> list = rboardService.listAll(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		//모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);//데이터를 저장
		mav.setViewName("/board/list.jsp");//뷰를 list.jsp로 설정

		return mav;//list.jsp List가 전달된다.
	}
	
	@RequestMapping(value="write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String write() {
		return "/board/write.jsp";
	}
	
	@RequestMapping(value="insert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insert(@ModelAttribute BoardVO vo, HttpSession session) {
		String writer = (String) session.getAttribute("userId");
		vo.setWriter(writer);
		rboardService.create(vo);
		return "redirect:/list.do";
	}
	
	@RequestMapping(value="view.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(@RequestParam int bno, HttpSession session) {
		//조회수 증가 처리
		rboardService.increaseViewcnt(bno, session);
		//모델(데이터)+뷰(화면)을 함꼐 전달하는 객체
		ModelAndView mav = new ModelAndView();
		//뷰의 이름
		mav.setViewName("/board/view.jsp");
		//뷰에 전달할 데이터
		mav.addObject("dto", rboardService.read(bno));
		return mav;
	}
	
	@RequestMapping(value="update.do", method={RequestMethod.GET, RequestMethod.POST})
	public String update(@ModelAttribute BoardVO vo) {
		rboardService.update(vo);
		return "redirect:/list.do";
	}
	
	@RequestMapping(value="delete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String update(@RequestParam int bno) {
		rboardService.delete(bno);
		return "redirect:/list.do";
	}

}
