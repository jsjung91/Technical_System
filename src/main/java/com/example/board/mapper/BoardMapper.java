package com.example.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.board.domain.BoardVo;
import com.example.board.domain.FileVo;
import com.example.board.domain.MemberVo;
import com.example.board.domain.TechVo;

@Repository("com.example.board.mapper.BoardMapper") // 해당 클래스가 데이터베이스에 접근하는 클래스임을 명시
public interface BoardMapper {

	// 문의 게시판
	public int boardCount() throws Exception; // 게시글 갯수
	
	public List<BoardVo> boardList(BoardVo vo) throws Exception; // 게시글 목록
	
	public BoardVo boardView(int idx) throws Exception; // 게시글 상세 보기
	
	public int boardInsert(BoardVo vo) throws Exception; // 게시글 작성
	
	public int boardUpdate(BoardVo vo) throws Exception; // 게시글 수정
	
	public int boardDelete(int idx) throws Exception; // 게시글 삭제
	
	public int hitPlus(int idx) throws Exception; // 조회수 
	
	// 파일 
	public int fileInsert(FileVo file) throws Exception; // 파일 업로드 

	public FileVo fileDetail(int bno) throws Exception; //파일 상세
	
	// 기술 지원
	public List<TechVo> techList(TechVo vo) throws Exception; // 게시글 목록
	
	public TechVo techView(int idx) throws Exception; // 게시글 상세 보기
	
	public int techInsert(TechVo vo) throws Exception; // 게시글 작성
	
	public int techUpdate(TechVo vo) throws Exception; // 게시글 수정
	
	public int techDelete(int idx) throws Exception; // 게시글 삭제
	
	
	// 로그인
	public MemberVo Login(MemberVo vo) throws Exception; //
}
