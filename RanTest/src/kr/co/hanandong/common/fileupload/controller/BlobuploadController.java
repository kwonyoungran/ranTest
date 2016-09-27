package kr.co.hanandong.common.fileupload.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.hanandong.common.fileupload.dto.BlobuploadDto;
import kr.co.hanandong.common.fileupload.dto.RequestParams;
import kr.co.hanandong.common.fileupload.service.BlobuploadService;

@Controller
@RequestMapping("/common/fileupload/blobupload")
public class BlobuploadController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="blobuploadService")
	BlobuploadService blobuploadSrvc;
	
	@RequestMapping("list")
	public String list(RequestParams reqParams, Model model) {
		String sViewName = "/common/fileupload/blobupload/list";
		
		try {
			Map<String,Object> dataMap = new HashMap<String,Object>();
			dataMap.put("currentPageNo", reqParams.getCurrentPageNo());
			
			Map<String,Object> resultMap = blobuploadSrvc.selectFileList(dataMap);	
			model.addAttribute("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
			model.addAttribute("list" , resultMap.get("result"));
		} catch (Exception e) {
			log.error("["+this.getClass().getName() + ".list]" + e.getMessage(), e);
		}
		
		return sViewName;
	}
	
	@RequestMapping("write")
	public String write(RequestParams reqParams) {
		log.debug(reqParams);
		String sViewName = "/common/fileupload/blobupload/write";
		
		return sViewName;
	}
	
	@RequestMapping("insertFile")
	public String insertFile(BlobuploadDto blobuploadDto, BindingResult result, WebRequest request) {
		log.debug(blobuploadDto);
		try {
			String sFileName = blobuploadDto.getFile().getOriginalFilename();
			blobuploadDto.setFile_name(sFileName);
			blobuploadSrvc.insertFile(blobuploadDto);
		} catch (Exception e) {
			log.error("["+this.getClass().getName() + ".insertFile]" + e.getMessage(), e);
		}
		return "redirect:list.do";
	}
}
