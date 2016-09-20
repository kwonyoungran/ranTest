package kr.co.hanandong.common.servlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.hanandong.common.utils.Strings;

public class ResultServlet extends HttpServlet {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20140106113400L;	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 	{
		
		String charset = Strings.getString(request.getAttribute("charset"));
		
		if (charset.length() > 0)
			response.setContentType("text/html; charset=" + charset);
		else
			response.setContentType("text/html; charset=UTF-8");
		
		Writer out = response.getWriter();
		
		out.write("<html>\n");
		out.write("<head>\n");
		// **************************************************
		// Script SRC
		// **************************************************
		String scriptSRC 	= Strings.getString(request.getAttribute("scriptSRC"));
		if (scriptSRC.length() > 0)
			out.write(scriptSRC + "\n");
		
		
		// **************************************************
		// # Script Start
		// **************************************************
		out.write("<script>\n");
		
		// Script Message
		String message 	= Strings.getString(request.getAttribute("message"));
		if (message.length() > 0)
			out.write("alert(\"" + message + "\");\n");				
		
		// Script Code
		String script 	= Strings.getString(request.getAttribute("script"));
		if (script.length() > 0)
			out.write(script + "\n");
		
		// HTML Target & Redirect
		String target 	= Strings.getString(request.getAttribute("target"));
		String redirect = Strings.getString(request.getAttribute("redirect"));
		if (redirect.length() > 0) {
			if (target.length() > 0)
				out.write(target + ".window.location.href=\"" + redirect + "\";\n");
			else
				out.write("window.location.href=\"" + redirect + "\";\n");
		}

		// Script Back
		String back 	= Strings.getString(request.getAttribute("back"));
		if (back.equalsIgnoreCase("true"))
			out.write("window.history.back();\n");
		
		// Script Close
		String close 	= Strings.getString(request.getAttribute("close"));
		if (close.equalsIgnoreCase("true"))
			out.write("top.window.self.close();\n");
		
		out.write("</script>\n");
		// **************************************************
		// # Script End
		// **************************************************
		out.write("</head>\n");
		out.write("<body>\n");
		
		// Post
		String post = Strings.getString(request.getAttribute("post"));
		if (post.length() > 0) {
			
				out.write("<form name=\"frmPost\" id=\"frmPost\" method=\"post\" action=\"" + Strings.getString(request.getAttribute("post")) + "\">\n");
				
				if(request.getAttribute("name") != null) {
					String[] name 	= (String[])request.getAttribute("name");
					String[] value 	= (String[])request.getAttribute("value");
					
					for (int nLoop = 0; nLoop < name.length; nLoop++) {
						out.write("<input type=\"hidden\" name=\"" + Strings.getString(name[nLoop]) 
								+ "\" id=\"" + Strings.getString(name[nLoop]) 
								+ "\" value=\"" + Strings.getString(value[nLoop]) 
								+ "\" />\n");
					}
				}
				out.write("<script>document.getElementById(\"frmPost\").submit();</script>");
		}
		out.write("</body>\n");
		out.write("</html>\n");
	}
}
