package com.example.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.board.domain.FileVo;
import com.example.board.domain.TechVo;
import com.example.board.mapper.BoardMapper;

@Service("com.example.board.service.TechService")
public class TechService {

	@Resource(name="com.example.board.mapper.BoardMapper")
	BoardMapper boardMapper;
	
	public List<TechVo> techListService(TechVo vo) throws Exception{
		return boardMapper.techList(vo);
	}
	public TechVo techViewService(int idx) throws Exception{
		return boardMapper.techView(idx);
	}
	public int techInsertService(TechVo vo) throws Exception{
		return boardMapper.techInsert(vo);
	}
	public int techUpdateService(TechVo vo) throws Exception{
		return boardMapper.techUpdate(vo);
	}
	public int techDeleteService(int idx) throws Exception{
		return boardMapper.techDelete(idx);
	}
	public int fileInsertService(FileVo file) throws Exception{
		return boardMapper.fileInsert(file);
	}
	public FileVo fileDetailService(int bno) throws Exception{
		return boardMapper.fileDetail(bno);
	}
	
}
