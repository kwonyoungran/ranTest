package kr.co.hanandong.common.fileupload.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hanandong.common.CommandMap;
import kr.co.hanandong.common.fileupload.service.FileuploadService;

@Controller
@RequestMapping("/common/fileupload")
public class FileuploadController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileuploadService")
	private FileuploadService fileuploadService;

	@RequestMapping("main.do")
	public ModelAndView goMain() {
		ModelAndView mv = new ModelAndView("/common/fileupload/main");
		
		return mv;
	}
	
	@RequestMapping(value="openBoardList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/common/fileupload/boardList");
         
        List<Map<String,Object>> list = fileuploadService.selectBoardList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
	
	@RequestMapping(value="openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/common/fileupload/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/common/fileupload/openBoardList.do");
		
		fileuploadService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/common/fileupload/boardDetail");
		
		Map<String,Object> map = fileuploadService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="openBoardUpdate.do")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception {
	    ModelAndView mv = new ModelAndView("/common/fileupload/boardUpdate");
	     
	    Map<String,Object> map = fileuploadService.selectBoardDetail(commandMap.getMap());
	    mv.addObject("map", map.get("map"));
	    mv.addObject("list", map.get("list"));
	    
	    return mv;
	}
	
	@RequestMapping(value="updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/common/fileupload/openBoardDetail.do");
		
		fileuploadService.updateBoard(commandMap.getMap(), request);
	    mv.addObject("IDX", commandMap.get("IDX"));
	    
	    return mv;
	}
	
	@RequestMapping(value="deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/common/fileupload/openBoardList.do");
		
		fileuploadService.deleteBoard(commandMap.getMap());
		
	    return mv;
	}
	
	@RequestMapping(value="downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception {
		Map<String,Object> map = fileuploadService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String)map.get("STORED_FILE_NAME");
		String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File("D:\\RAN\\Test\\file\\" + storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
}
