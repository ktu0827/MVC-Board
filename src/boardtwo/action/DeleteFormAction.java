package boardtwo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction implements CommandAction{

	public String requestPro(
				HttpServletRequest request,
				HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum",new Integer(pageNum));
		return "/boardtwo/deleteForm.jsp";
	}
	
}
