package com.an.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.an.dto.BoardVO;

@Repository
public class RboardDAO {
	
	@Inject
	SqlSession sql;

	public List<BoardVO> listAll(String searchOption, String keyword, int start, int end) {
		//검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sql.selectList("board_r.listall", map);
	}
	
	public int contArticle(String searchOption, String keyword) {
		//검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sql.selectOne("board_r.contArticle", map);
	}

	public void create(BoardVO vo) {
		sql.insert("board_r.insert", vo);
	}

	public void increaseViewcnt(int bno) {
		sql.update("board_r.increaseViewcnt", bno);
	}

	public BoardVO read(int bno) {
		return sql.selectOne("board_r.view", bno);
	}

	public void update(BoardVO vo) {
		sql.update("board_r.update", vo);
	}

	public void delete(int bno) {
		sql.delete("board_r.delete", bno);
	}

}
