package kr.co.hanandong.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study/jquery")
public class StudyController {
	
	@RequestMapping("main")
	public String main() {
		return "/study/jquery/main";
	}
}
