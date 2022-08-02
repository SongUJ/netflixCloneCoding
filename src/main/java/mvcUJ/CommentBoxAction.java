package mvcUJ;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uj.dao.CommentBoxDao;
import com.uj.dto.CommentBoxDto;

public class CommentBoxAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommentBoxAction 들어옴!");
		
		
	}

}
