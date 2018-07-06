package com.example.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.example.board.domain.BoardVo;
import com.example.board.domain.FileVo;
import com.example.board.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Resource(name="com.example.board.service.BoardService")
	BoardService boardService;
	
	@RequestMapping("/main")
	public String mainPage() throws Exception{
		
		return "/main";
	}
	
	@RequestMapping("/list") // 게시판 리스트 화면
	public String boardList(HttpServletRequest request, String search, String search_text, Model model) throws Exception{
		
		BoardVo vo = new BoardVo();

		if(search!=null && !search.equals("all")) {
			if(search.equals("subject")) {
				vo.setSubject(request.getParameter("search_text"));
			}else if(search.equals("name")) {
				vo.setName(request.getParameter("search_text"));
			}
		}
		
		List<BoardVo> list = boardService.boardListService(vo);
		
		model.addAttribute("list", list);
		
		return "list";
		
	}
	
	@RequestMapping("/view/{idx}")
	private String boardView(@PathVariable int idx, Model model) throws Exception{
		
		model.addAttribute("vo", boardService.boardViewService(idx));
		model.addAttribute("files", boardService.fileDetailService(idx)); 
		
		boardService.hitPlusService(idx);
		
		return "view";
	}
	
	@RequestMapping("/insert")
	private String boardInsertForm() {
		return "insert";
	}
	
	@RequestMapping("/insertProc")
	private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
		
		BoardVo vo = new BoardVo(); 
		
		FileVo file = new FileVo();  // 파일 업로드 용
		
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setName(request.getParameter("name"));
		vo.setPwd(request.getParameter("pwd"));
		
		if(files.isEmpty()){ //업로드할 파일이 업을 경우
			boardService.boardInsertService(vo); //게시글 insert
		}else{ 
			// 스프링 부트에서 Multipart 요청을 처리하려면 multipartConfingElement, multipartResolver 빈이 애플리케이션 컨텍스트에 존재해야 하는데 애플리케이션 시작 시
			// MultipartAutoConfiguration 클래스가 이 작업을 수동으로 수행해준다.
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\Users\\Jung\\Desktop\\boardboot\\src\\main\\webapp\\WEB-INF\\uploadFiles/";
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} 
		while (destinationFile.exists());
		
		destinationFile.getParentFile().mkdirs();
		files.transferTo(destinationFile); // 요청 시점의 임시 파일을 로컬 파일 시스템에 영구적으로 복사를 해준다. 단 한번만 실행된다.
		
		boardService.boardInsertService(vo);
		
		file.setIdx(vo.getIdx());
		file.setFileName(destinationFileName);
		file.setFileOriName(fileName);
		file.setFileUrl(fileUrl);
		
		boardService.fileInsertService(file); // file insert
		
		}
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/update/{idx}")
	private String boardUpdateForm(@PathVariable int idx, Model model) throws Exception{
		model.addAttribute("vo", boardService.boardViewService(idx));
		
		return "update";
	}
	
	@RequestMapping("/updateProc")
	private String boardUpdateProc(HttpServletRequest request) throws Exception{
		BoardVo vo = new BoardVo();
	
		vo.setIdx(Integer.parseInt(request.getParameter("idx")));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		
		boardService.boardUpdateService(vo);
		
		return "redirect:/board/view/" + request.getParameter("idx");
	}
	
	@RequestMapping("/delete/{idx}")
	private String boardDelete(@PathVariable int idx) throws Exception {

		boardService.boardDeleteService(idx);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/fileDown/{idx}")
    private void fileDown(@PathVariable int idx, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileVo fileVO = boardService.fileDetailService(idx);
        
        //파일 업로드된 경로 
        try{
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();
            
            //실제 내보낼 파일명 
            String oriFileName = fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }
}
