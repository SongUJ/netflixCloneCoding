package mvcUJ;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	Action getAction(String command) {
		Action action = null;
		
		switch(command) {
		case "mainHome":
			action = new MainHomeAction(); 
			break;
		case "series":
			action = new SeriesAction();
			break;
		case "movie":
			action = new MovieAction();
			break;
		case "dib":
			action = new DibAction();
			break;
		case "search":
			action = new SearchAction();
			break;
		case "dramaRoundBoxServletAction":
			action = new DramaRoundBoxServletAction();
			break;
		case "gradeBoardMyCommentServletAction":
			action = new GradeBoardMyCommentServletAction();
			break;
		case "GradeBoardRecentServletAction":
			action = new GradeBoardRecentServletAction();
			break;
		case "userCommentDataSympathyServletAction":
			action = new GradeBoardSympathyServletAction();
			break;
		case "gradeServletAction":
			action = new GradeServletAction();
			break;
		case "movieScrollServletAction":
			action = new MovieScrollServletAction();
			break;
		case "dramaScrollServletAction":
			action = new DramaScrollServletAction();
			break;
		}
		if(action == null) {
			System.out.println("주의! action이 null 임!(ActionFactory)");
		}
		return action;
	}
}
