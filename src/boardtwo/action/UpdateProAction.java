package boardtwo.action;

import boardtwo.model.BoardDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import boardtwo.model.BoardDao;

public class UpdateProAction implements CommandAction{

	@Override
	public String requestPro(
			HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String savePath = "/fileUpload/load";
		int uploadFileSizeLimit = 5*1024*1024;
		String encType = "UTF-8";
		
		String uploadFilePath = request.getServletContext().getRealPath(savePath);
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(
					request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
		}catch (Exception e) {
			System.out.println("예외발생 : "+e);
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(multi.getParameter("num"));
		String fileName = "";
		String pageNum = request.getParameter("pageNum");
		BoardDto article = new BoardDto();
		BoardDao dbPro = BoardDao.getInstance();
		
		BoardDto origin = dbPro.getArticle(num);
		
		if(multi.getFilesystemName("filename") != null) {
			fileName = multi.getFilesystemName("filename");
			article.setFilename(fileName);
		}else {
			fileName = origin.getFilename();
			article.setFilename(fileName);
		}
		article.setNum(num);
		article.setWriter(multi.getParameter("writer"));
		article.setEmail(multi.getParameter("email"));
		article.setSubject(multi.getParameter("subject"));
		article.setPass(multi.getParameter("pass"));
		article.setContent(multi.getParameter("content"));
		
		int check = dbPro.updateAricle(article);
		
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));
		
		return "/boardtwo/updatePro.jsp";
	}

}
