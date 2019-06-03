package boardtwo.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.sql.Timestamp;

import boardtwo.model.BoardDto;
import boardtwo.model.BoardDao;

public class WriteProAction implements CommandAction{

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
		String fileName = multi.getFilesystemName("filename");
		System.out.println(fileName);
		BoardDto article = new BoardDto();
		article.setNum(Integer.parseInt(multi.getParameter("num")));
		article.setWriter(multi.getParameter("writer"));
		article.setEmail(multi.getParameter("email"));
		article.setSubject(multi.getParameter("subject"));
		article.setPass(multi.getParameter("pass"));
		article.setRegdate(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(multi.getParameter("ref")));
		article.setStep(Integer.parseInt(multi.getParameter("step")));
		article.setDepth(Integer.parseInt(multi.getParameter("depth")));
		article.setContent(multi.getParameter("content"));
		article.setIp(request.getRemoteAddr());
		article.setFilename(fileName);
		System.out.println(article);
		BoardDao dbPro = BoardDao.getInstance();
		dbPro.insertArticle(article);
		return "/boardtwo/writePro.jsp";
	}

}
