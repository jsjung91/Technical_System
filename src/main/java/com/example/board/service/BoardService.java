package com.example.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.board.domain.BoardVo;
import com.example.board.domain.FileVo;
import com.example.board.mapper.BoardMapper;

@Service("com.example.board.service.BoardService")
public class BoardService {
	
	@Resource(name="com.example.board.mapper.BoardMapper")
	BoardMapper boardMapper;
	
	public List<BoardVo> boardListService(BoardVo vo) throws Exception{
		return boardMapper.boardList(vo);
	}
	public BoardVo boardViewService(int idx) throws Exception{
		return boardMapper.boardView(idx);
	}
	public int boardInsertService(BoardVo vo) throws Exception{
		return boardMapper.boardInsert(vo);
	}
	public int boardUpdateService(BoardVo vo) throws Exception{
		return boardMapper.boardUpdate(vo);
	}
	public int boardDeleteService(int idx) throws Exception{
		return boardMapper.boardDelete(idx);
	}
	public int hitPlusService(int idx) throws Exception{
		return boardMapper.hitPlus(idx);
	}
	public int fileInsertService(FileVo file) throws Exception{
		return boardMapper.fileInsert(file);
	}
	public FileVo fileDetailService(int bno) throws Exception{
		return boardMapper.fileDetail(bno);
	}
	
}
