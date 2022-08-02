package ajaxSY;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sns.dao.PostingDAO;
import com.sns.dto.PostViewDTO;
import com.sns.dto.ProfileDTO;

@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRealPath("images/upload"); // 절대경로
		System.out.println("(참고) real path : " + path);

		// upload 폴더가 없으면 만듦. --------------------------
		File filePath = new File(path);
		if (filePath.exists() == false) {
			filePath.mkdirs();
		}
		// ------------------------------------------------

		int sizeLimit = 100 * 1024 * 1024; // 100MB 제한

		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		// 파일 저장 끝. 이제 파일에 대한 정보(파일이름)를 multi객체로부터 뽑아내서 사용.
		Enumeration files = multi.getFileNames();
		String fileObject1 = (String) (files.nextElement());
		String filename1 = multi.getFilesystemName(fileObject1);
		System.out.println("filename1 : " + filename1);
		
		//파일을 업로두 하지 않으면 (파일이름이 null이면)
		if(filename1 != null) {
			request.setAttribute("filename", "upload/"+filename1);
			request.setAttribute("content", multi.getParameter("content"));
			request.getRequestDispatcher("jspSY/postingAct.jsp").forward(request, response);
			
			}else {
				request.setAttribute("content", multi.getParameter("content"));
				request.getRequestDispatcher("jspSY/postingAct.jsp").forward(request, response);
			}
		/*
		 * RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("postingAct.jsp"); dispatcher.forward(request,
		 * response); request.setAttribute("request", "requestValue");
		 */
		/* System.out.println("desc : " + multi.getParameter("desc")); */

	}
}
