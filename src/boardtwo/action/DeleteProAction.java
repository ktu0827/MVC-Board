package boardtwo.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import boardtwo.model.BoardDao;
import boardtwo.model.BoardDto;

public class DeleteProAction implements CommandAction{

	public String requestPro(
			HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			request.setCharacterEncoding("UTF-8");
			int num =Integer.parseInt(request.getParameter("num"));
			String pageNum =request.getParameter("pageNum");
			String pass = request.getParameter("pass");
			
			BoardDao dbPro = BoardDao.getInstance();
			BoardDto article = dbPro.getArticle(num);
			
			String filename = article.getFilename();
			int check = dbPro.deleteArticle(num, pass);
			
			String uploadFileName = request.getServletContext().getRealPath("/fileUpload/load")+"/"+filename;
			
			File uploadFile = new File(uploadFileName);
			if(uploadFile.exists() && uploadFile.isFile()) {
				uploadFile.delete();
			}
			
			request.setAttribute("pageNum", new Integer(pageNum));
			request.setAttribute("check", new Integer(check));
		return "/boardtwo/deletePro.jsp";
	}

}
