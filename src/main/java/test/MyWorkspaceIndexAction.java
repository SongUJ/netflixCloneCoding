//package collabee.jh.mvc;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//
//import collabee.jh.dao.MyWorkspaceListDao;
//import collabee.jh.dto.MyWorkspaceListDto;
//
//public class MyWorkspaceIndexAction implements Action{
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("MyWorkspaceListACtion 들어옴");
//		System.out.println("request parameter loginId : " + request.getParameter("loginId"));
//		
//		//int fl = Integer.parseInt(request.getParameter("fl"));
//		
//		MyWorkspaceListDao dao = new MyWorkspaceListDao();
//		ArrayList<MyWorkspaceListDto> list = new ArrayList<MyWorkspaceListDto>();
//		int member_id = Integer.parseInt(request.getParameter("loginId")); //이놈이 null값임
//		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
//		System.out.println(workspace_id);
//		try {
//			
//			list = dao.getMyWorkspace_List(member_id);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		PrintWriter out = response.getWriter();
//		
//		//JSONArray array = new JSONArray();
//		JSONObject obj = new JSONObject();
//		for(MyWorkspaceListDto dto : list) {
//			if(workspace_id==dto.getWorkspace_id()) {
//			obj.put("workspace_id", dto.getWorkspace_id());
////			obj.put("workspace_name", dto.getWorkspace_name());
////			obj.put("color", dto.getColor());
//			obj.put("summary", dto.getSummary());
//			System.out.println(dto.getSummary());
////			obj.put("invite_url", dto.getInvite_url()); 
////			obj.put("confidential", dto.getConfidential());
//			obj.put("complete", dto.getComplete());
//			obj.put("workspace_alarm", dto.getWorkspace_alarm());
////			obj.put("creation_date", dto.getCreation_date()); 
//			}
//		}
//		out.print(obj);
//		request.setAttribute("workspacePostList", obj);
//		request.getRequestDispatcher("newCollabee/workspace_index.jsp").forward(request, response);//출력할 페이지로 req, resp 전송, 이 페이지로 html을 그려줌.
//	}
//}
