package weibo4j.examples.timeline;

import weibo4j.Timeline;
import weibo4j.http.ImageItem;
import weibo4j.model.Status;
import weibo4j.util.URLEncodeUtils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;

public class Upload {
	public static void main(String args[]) {
		try {
			try {
//				byte[] content = readFileImage(args[2]);
				byte[] content = readFileImage("/Users/fangs/Pictures/body_bg.jpg");
				System.out.println("content length:" + content.length);
				ImageItem pic = new ImageItem("pic", content);
//				String statuses = java.net.URLEncoder.encode(args[1], "utf-8");
				String statuses = "发个图11";
				statuses = URLEncodeUtils.encodeURL(statuses); // 微博内容必须做  URL Encode !!!

//				String access_token = args[0];
				String access_token = "2.00wFyJoB8bMAMBbb0be9367ffVRRgE";

				Timeline tm = new Timeline(access_token);
				Status status = tm.uploadStatus(statuses, pic);

				System.out.println("Successfully upload the status to ["
						+ status.getText() + "].");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} catch (Exception ioe) {
			System.out.println("Failed to read the system input.");
		}
	}

	public static byte[] readFileImage(String filename) throws IOException {
		BufferedInputStream bufferedInputStream = new BufferedInputStream(
				new FileInputStream(filename));
		int len = bufferedInputStream.available();
		byte[] bytes = new byte[len];
		int r = bufferedInputStream.read(bytes);
		if (len != r) {
			bytes = null;
			throw new IOException("读取文件不正确");
		}
		bufferedInputStream.close();
		return bytes;
	}
}
