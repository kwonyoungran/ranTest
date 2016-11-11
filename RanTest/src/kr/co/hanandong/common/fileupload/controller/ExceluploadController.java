package kr.co.hanandong.common.fileupload.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/fileupload/excelupload")
public class ExceluploadController {

	@RequestMapping("list")
	public String list() {
		return "/common/fileupload/excelupload/list";
	}
}
