package kr.co.hanandong.common.servlet;

import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hanandong.common.servlet.dto.ExceptionServletDto;

@Controller("com.mcomplus.ims.common.servlet.ExceptionServlet")
public class ExceptionServlet {
	/** Logger */
 	protected Log log = LogFactory.getLog(ExceptionServlet.class);
	
	@Autowired
	Properties commonProperties;
	
	@RequestMapping(value = "/exception/error", method = RequestMethod.GET)
	public String errorProc(HttpServletRequest request, ExceptionServletDto systemErrorDto) {

		try {
			// **************************************************************************
			// Language Configuration by Client Cookies
			// **************************************************************************
			/* 디폴트(LANG: KO, FLG_IMG: N) 또는 쿠키에 저장(세션이 생성된 이후임)된 값으로 설정 */
			String lanugage	= "KO";
			String flgImage	= "N";
			
			HttpSession session 	= ((HttpServletRequest)request).getSession();
			if (session != null) {
				Cookie[] cookie = ((HttpServletRequest)request).getCookies();
				if (cookie != null) {
					for (int nLoop = 0; nLoop < cookie.length; nLoop++) {
						if (cookie[nLoop].getName().equals("LANG"))
							lanugage = cookie[nLoop].getValue();
						if (cookie[nLoop].getName().equals("FLG_IMG"))
							flgImage = cookie[nLoop].getValue();
					}
				}
			}
			
			/* 서블릿값 저장 */
			((HttpServletRequest)request).setAttribute("LANG", lanugage);
			((HttpServletRequest)request).setAttribute("FLG_IMG", flgImage);
			
			if (systemErrorDto.getCode().equals("400")) {
				systemErrorDto.setCode_desc("BAD REQUEST");
			}
			else if (systemErrorDto.getCode().equals("401")) {
				systemErrorDto.setCode_desc("UNAUTHORIZED");
			}
			else if (systemErrorDto.getCode().equals("403")) {
				systemErrorDto.setCode_desc("ACCESS DENITED");
			}
			else if (systemErrorDto.getCode().equals("404")) {
				systemErrorDto.setCode_desc("FILE NOT FOUND");
			}
			else if (systemErrorDto.getCode().equals("405")) {
				systemErrorDto.setCode_desc("METHOD NOT ALLOWED");
			}
			else if (systemErrorDto.getCode().equals("408")) {
				systemErrorDto.setCode_desc("REQUEST TIMEOUT");
			}
			else if (systemErrorDto.getCode().equals("415")) {
				systemErrorDto.setCode_desc("FORMAT NOT SUPPORTE");
			}
			else if (systemErrorDto.getCode().equals("500")) {
				systemErrorDto.setCode_desc("INTERNAL SERVER ERROR");
			}
			else if (systemErrorDto.getCode().equals("503")) {
				systemErrorDto.setCode_desc("SERVICE UNAVAILABLE");
			}
			else if (systemErrorDto.getCode().equalsIgnoreCase("exception")) {
				systemErrorDto.setCode_desc("EXCEPTION");
			}
			else if (systemErrorDto.getCode().equalsIgnoreCase("servletException")) {
				systemErrorDto.setCode_desc("SERVLET EXCEPTION");
			}
			else {
				systemErrorDto.setCode_desc("관리자에게 문의해주세요.");
			}
			
			((HttpServletRequest)request).setAttribute("systemErrorDto", systemErrorDto);
			
			log.error("# REGION ***************************" + commonProperties.getProperty("ims.logging.error", "[UNDEFINED]") + "***************************");
			log.error("CODE: " + systemErrorDto.getCode());
			log.error("DESC: " + systemErrorDto.getCode_desc());
			log.error("  IP: " + request.getRemoteAddr());
			log.error("# END REGION ***********************" + commonProperties.getProperty("ims.logging.error", "[UNDEFINED]") + "***************************\n");
			
			return "util/system-error";
		}
		catch (Exception e) {
			log.error("[" + this.getClass().getName() + ".errorProc()]" + e.getMessage(), e);
			return "redirect:/exception/error.do";
		}
		finally {}
		
	}
	
	@RequestMapping(value = "/exception/pause", method = RequestMethod.GET)
	public String pauseProc(HttpServletRequest request) {
		
		try {
			// **************************************************************************
			// Language Configuration by Client Cookies
			// **************************************************************************
			/* 디폴트(LANG: KO, FLG_IMG: N) 또는 쿠키에 저장(세션이 생성된 이후임)된 값으로 설정 */
			String lanugage	= "KO";
			String flgImage	= "N";
			
			HttpSession session 	= ((HttpServletRequest)request).getSession();
			
			if (session != null) {
				Cookie[] cookie = ((HttpServletRequest)request).getCookies();
				if (cookie != null) {
					for (int nLoop = 0; nLoop < cookie.length; nLoop++) {
						if (cookie[nLoop].getName().equals("LANG"))
							lanugage = cookie[nLoop].getValue();
						if (cookie[nLoop].getName().equals("FLG_IMG"))
							flgImage = cookie[nLoop].getValue();
					}
				}
			}
			
			/* 서블릿값 저장 */
			((HttpServletRequest)request).setAttribute("LANG", lanugage);
			((HttpServletRequest)request).setAttribute("FLG_IMG", flgImage);
			
			return "util/system-pause";
		}
		catch (Exception e) {
			log.error("[" + this.getClass().getName() + ".pauseProc()]" + e.getMessage(), e);
			return "redirect:/exception/error.do";
		}
		finally {}
	}
	
	@RequestMapping(value = "/exception/deny", method = RequestMethod.GET)
	public String denyProc(HttpServletRequest request) {
		
		try {
			// **************************************************************************
			// Language Configuration by Client Cookies
			// **************************************************************************
			/* 디폴트(LANG: KO, FLG_IMG: N) 또는 쿠키에 저장(세션이 생성된 이후임)된 값으로 설정 */
			String lanugage	= "KO";
			String flgImage	= "N";
			
			HttpSession session 	= ((HttpServletRequest)request).getSession();
			
			if (session != null) {
				Cookie[] cookie = ((HttpServletRequest)request).getCookies();
				if (cookie != null) {
					for (int nLoop = 0; nLoop < cookie.length; nLoop++) {
						if (cookie[nLoop].getName().equals("LANG"))
							lanugage = cookie[nLoop].getValue();
						if (cookie[nLoop].getName().equals("FLG_IMG"))
							flgImage = cookie[nLoop].getValue();
					}
				}
			}
			
			/* 서블릿값 저장 */
			((HttpServletRequest)request).setAttribute("LANG", lanugage);
			((HttpServletRequest)request).setAttribute("FLG_IMG", flgImage);
			
			return "util/system-deny";
		}
		catch (Exception e) {
			log.error("[" + this.getClass().getName() + ".denyProc()]" + e.getMessage(), e);
			return "redirect:/exception/error.do";
		}
		finally {}
	}
	
	@RequestMapping(value = "/exception/reject", method = RequestMethod.GET)
	public String rejectProc(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			// **************************************************************************
			// Language Configuration by Client Cookies
			// **************************************************************************
			/* 디폴트(LANG: KO, FLG_IMG: N) 또는 쿠키에 저장(세션이 생성된 이후임)된 값으로 설정 */
			String lanugage	= "KO";
			String flgImage	= "N";
			
			HttpSession session 	= ((HttpServletRequest)request).getSession();
			
			if (session != null) {
				Cookie[] cookie = ((HttpServletRequest)request).getCookies();
				if (cookie != null) {
					for (int nLoop = 0; nLoop < cookie.length; nLoop++) {
						if (cookie[nLoop].getName().equals("LANG"))
							lanugage = cookie[nLoop].getValue();
						if (cookie[nLoop].getName().equals("FLG_IMG"))
							flgImage = cookie[nLoop].getValue();
					}
				}
			}
			
			/* 서블릿값 저장 */
			((HttpServletRequest)request).setAttribute("LANG", lanugage);
			((HttpServletRequest)request).setAttribute("FLG_IMG", flgImage);
			
			// status code
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			
			return "util/system-reject";
		}
		catch (Exception e) {
			log.error("[" + this.getClass().getName() + ".rejectProc()]" + e.getMessage(), e);
			return "redirect:/exception/error.do";
		}
		finally {}
	}
}
