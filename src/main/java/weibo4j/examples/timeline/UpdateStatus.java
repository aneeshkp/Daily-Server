package weibo4j.examples.timeline;

import weibo4j.Timeline;
import weibo4j.examples.oauth2.Log;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;

public class UpdateStatus {

	public static void main(String[] args) {
//		String access_token = args[0];
//		String statuses = args[1];
		String access_token = "2.00wFyJoB8bMAMBbb0be9367ffVRRgE";
		String statuses = "SUCCESS11";
		Timeline tm = new Timeline(access_token);
		try {


			Status status = tm.updateStatus(statuses);
			Log.logInfo(status.toString());
			System.err.println(status.toString());
		} catch (WeiboException e) {
			e.printStackTrace();
		}	
	}

}
