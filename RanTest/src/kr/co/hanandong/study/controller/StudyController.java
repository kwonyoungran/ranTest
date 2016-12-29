package kr.co.hanandong.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {
	
	@RequestMapping("/jquery/main")
	public String jQueryMain() {
		return "/study/jquery/main";
	}
	
}
