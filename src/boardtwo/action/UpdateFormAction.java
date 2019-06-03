package boardtwo.action;


import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardtwo.model.*;

public class UpdateFormAction implements CommandAction{
	public String requestPro(
			HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		BoardDao dbPro = BoardDao.getInstance();
		BoardDto article = dbPro.updateGetArticle(num);
		
		String uploadFileName = request.getServletContext().getRealPath("/fileUpload/load")+"/"+filename;
		
		File uploadFile = new File(uploadFileName);
		if(uploadFile.exists() && uploadFile.isFile()) {
			uploadFile.delete();
		}
		
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		
		
		return "/boardtwo/updateForm.jsp";
	}

}
