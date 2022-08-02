package mvc;

public class ActionFactory {	// 싱글턴패턴.
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() { }
	public static ActionFactory getInstance() {
		return instance;
	}
	
	Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "board_list":
			action = new BoardListAction();
			break;
		case "board_write_form":
			action = new BoardWriteFormAction();
			break;
		case "board_write_action":
			action = new BoardWriteAction();
			break;
			
//		case "calculate":
//			action = new CalculateAction();
//			break;
//		case "result":
//			action = new ResultAction();
//			break;
		}
		if(action==null) {
			System.out.println("주의! action이 null임!");  // 로그(log)를 찍다(=로깅한다)
		}
		return action;
	}
}








