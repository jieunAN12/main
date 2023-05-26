package com.an.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.an.dao.RboardDAO;
import com.an.dto.BoardVO;

@Service
public class RboardService {
	
	@Inject
	RboardDAO dao;

	public List<BoardVO> listAll(String searchOption, String keyword, int start, int end) {
		return dao.listAll(searchOption, keyword, start, end);
	}
	
	public int contArticle(String searchOption, String keyword) {
		return dao.contArticle(searchOption, keyword);
	}

	public void create(BoardVO vo) {
		String title = vo.getTitle();
		String content = vo.getBcontent();
		String writer = vo.getWriter();
		//태그 문자처리 
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		//공백 문자처리
		title = title.replace(" ", "&nbsp;&nbsp;");
		writer = writer.replace(" ", "&nbsp;&nbsp;");
		//줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setBcontent(content);
		vo.setWriter(writer);
		dao.create(vo);
	}

	public void increaseViewcnt(int bno, HttpSession session) {
		long update_time = 0;
		//세션에 저장된 조회시간 ㄱ머색
		//최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행 x
		if(session.getAttribute("update_time"+bno) != null) {
			update_time = (long)session.getAttribute("update_time"+bno);
		}
		//시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		//일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		//시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(bno);
			//세션에 시간을 지정 bno는 다른변수와 중복되지 않도록
			session.setAttribute("update_time"+bno, current_time);
		}
	}

	public BoardVO read(int bno) {
		return dao.read(bno);
	}

	public void update(BoardVO vo) {
		dao.update(vo);
	}

	public void delete(int bno) {
		dao.delete(bno);
	}

}
