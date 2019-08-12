package com.uth.membership.board.dao;

import java.util.List;

import com.uth.membership.board.model.BoardVO;

public interface BoardDao {
	public List<BoardVO> getList();
}
