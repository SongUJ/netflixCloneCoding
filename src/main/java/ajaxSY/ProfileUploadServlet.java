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

@WebServlet("/ProfileUploadServlet")
public class ProfileUploadServlet extends HttpServlet {
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
		//프로필 이미지
		String fileObject1 = (String) (files.nextElement());	// 배경이미지 ---> 이건 null
		String filename1 = multi.getFilesystemName(fileObject1);
		//배경이미지
		String fileObject2 = (String) (files.nextElement());	// 프로필이미지 ---> 이건 null이 아닐 때가 문제.
		String filename2 = multi.getFilesystemName(fileObject2);


		//(만약 내용을 바꾸지 않은다면)null이 아니라 기존의 내용의 유지하고 싶음
		//sql문을 다시 짜야하나?
		
		
		//프로필 이미지랑 배경이미지 모두 업로드
		if((filename1 != null) && (filename2 != null)) {
			request.setAttribute("filename1", "upload/"+filename1);
			request.setAttribute("filename2", "upload/"+filename2);
			request.setAttribute("nickname", multi.getParameter("nickname"));
			request.setAttribute("statement", multi.getParameter("statement"));
			request.getRequestDispatcher("jspSY/ProfileUpdateAct.jsp").forward(request, response);
		//프로필 이미지만 업로드	
		} else if((filename2 != null) && (filename1 == null)) {
			request.setAttribute("filename2", "upload/"+filename2);
			request.getRequestDispatcher("jspSY/ProfileUpdateAct.jsp").forward(request, response);
		//배경이미지만 업로드		
		}else if((filename1 != null) && (filename2 == null)) {
			request.setAttribute("filename1", "upload/"+filename1);
			request.getRequestDispatcher("jspSY/ProfileUpdateAct.jsp").forward(request, response);
		//이미지는 업로드 x
		}else {
			request.getRequestDispatcher("jspSY/ProfileUpdateAct.jsp").forward(request, response);
		}
		
	
		
		
		

	}
}
