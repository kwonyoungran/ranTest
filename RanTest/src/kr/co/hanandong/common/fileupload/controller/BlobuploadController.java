package kr.co.hanandong.common.fileupload.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.hanandong.common.fileupload.dto.BlobuploadDto;
import kr.co.hanandong.common.fileupload.dto.RequestParams;
import kr.co.hanandong.common.fileupload.service.BlobuploadService;
import kr.co.hanandong.common.utils.Strings;

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
			String sCurrentPageNo = Strings.getString(reqParams.getCurrentPageNo(), "1");
			Map<String,Object> dataMap = new HashMap<String,Object>();
			dataMap.put("currentPageNo", sCurrentPageNo);
			
			Map<String,Object> resultMap = blobuploadSrvc.selectFileList(dataMap);	
			model.addAttribute("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
			model.addAttribute("list" , resultMap.get("result"));
			model.addAttribute("currentPageNo", sCurrentPageNo);
		} catch (Exception e) {
			log.error("["+this.getClass().getName() + ".list]" + e.getMessage(), e);
		}
		
		return sViewName;
	}
	
	@RequestMapping("write")
	public String write(RequestParams reqParams, Model model) {
		String sViewName = "/common/fileupload/blobupload/write";
		log.debug(reqParams);
		
		int nIdx = reqParams.getIdx();
		BlobuploadDto blobuploadDto = blobuploadSrvc.getFileInfo(nIdx);
		
		if(nIdx != 0) {
			reqParams.setMode("update");
		} else {
			reqParams.setMode("insert");
		}
		
		settingParams(model, reqParams);

		model.addAttribute("fileInfo", blobuploadDto);
		model.addAttribute("mode", reqParams.getMode());

		return sViewName;
	}
	
	@RequestMapping(value="insertFile")
	public String insertFile(BlobuploadDto blobuploadDto, RequestParams reqParams, BindingResult result, WebRequest request, Model model) {
		log.debug(blobuploadDto);
		try {
			String sFileName = blobuploadDto.getFile().getOriginalFilename();
			blobuploadDto.setFile_name(sFileName);
			blobuploadDto.setReg_name("youngran");
			blobuploadSrvc.insertFile(blobuploadDto);
			
			reqParams.setAlertSaved("입력되었습니다.");
			settingParams(model, reqParams);
		} catch (Exception e) {
			log.error("["+this.getClass().getName() + ".insertFile]" + e.getMessage(), e);
		}
		return "forward:list.do";
	}
	
	@RequestMapping("thumnail")
	public void thumnail(@RequestParam(value = "idx", required=true) int idx, HttpServletResponse response) throws Exception {
		log.debug(idx);
		
		Map<String,Object> fileData = new HashMap<String,Object>();
		fileData = blobuploadSrvc.getThumnail(idx);
		byte[] image = null;
		image = (byte[]) fileData.get("file_data");
		
		response.setContentType("image/gif");
		response.setContentLength(image.length);
		
		OutputStream os = response.getOutputStream();
		os.write(image);
		
		os.flush();
	}
	
	@RequestMapping("updateFile")
	public String update(BlobuploadDto blobuploadDto, RequestParams reqParams, BindingResult result, WebRequest request, Model model) {
		log.debug(blobuploadDto);
		try {
			String sFileName = blobuploadDto.getFile().getOriginalFilename();
			blobuploadDto.setFile_name(sFileName);
			blobuploadDto.setUpdate_name("youngran");
			blobuploadSrvc.updateFile(blobuploadDto);
			
			reqParams.setAlertSaved("변경되었습니다.");
			settingParams(model, reqParams);
		} catch(Exception e) {
			log.error("["+this.getClass().getName() + ".update]" + e.getMessage(), e);
		}
		return "forward:list.do";
		
	}
	
	@RequestMapping("deleteFile")
	public String delete(BlobuploadDto blobuploadDto, RequestParams reqParams, BindingResult result, WebRequest request, Model model) {
		log.debug(blobuploadDto);
		try {
			blobuploadDto.setDel_yn("Y");
			blobuploadDto.setUpdate_name("youngran");
			blobuploadSrvc.deleteFile(blobuploadDto);
			
			reqParams.setAlertSaved("삭제되었습니다.");
			settingParams(model, reqParams);
		} catch(Exception e) {
			log.error("["+this.getClass().getName() + ".delete]" + e.getMessage(), e);
		}
		
		return "forward:list.do";
	}
	
	public Model settingParams(Model model, RequestParams reqParams) {
		model.addAttribute("currentPageNo", reqParams.getCurrentPageNo());
		model.addAttribute("alertSaved", reqParams.getAlertSaved());
		return model;
	}
	
	@RequestMapping(value="downloadFile.do")
	public void downloadFile(@RequestParam(value = "idx", required=true) int idx, HttpServletResponse response) throws Exception {
		Map<String,Object> fileData = new HashMap<String,Object>();
		fileData = blobuploadSrvc.getThumnail(idx);
		
		byte fileByte[] = (byte[]) fileData.get("file_data");
		String originalFileName = Strings.getString(fileData.get("file_name"));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
