package boardtwo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardtwo.action.*;
import boardtwo.model.BoardDao;
import boardtwo.model.BoardDto;

public class ContentAction implements CommandAction{
	public String requestPro(
			HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String path = request.getContextPath()+"/fileUpload/load";
		String pageNum = request.getParameter("pageNum");
		BoardDao dbPro = BoardDao.getInstance();
		
		BoardDto article = dbPro.getArticle(num);
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		request.setAttribute("path" , path);
		return "/boardtwo/content.jsp";
	}
	
}
