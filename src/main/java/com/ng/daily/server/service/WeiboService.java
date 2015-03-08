package com.ng.daily.server.service;

import com.ng.daily.server.entity.Post;
import org.springframework.stereotype.Service;
import weibo4j.Timeline;
import weibo4j.examples.oauth2.Log;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;

/**
 * Created by fangs on 15/3/4.
 */
@Service
public class WeiboService {


    public void publishToWeibo(Post post) {

        // 初级接口
//        http://open.weibo.com/wiki/2/statuses/update : 发布一条新微博
//        http://open.weibo.com/wiki/2/statuses/upload : 上传图片并发布一条新微博

        // 高级接口
//        http://open.weibo.com/wiki/2/statuses/upload_pic : 上传图片
//        http://open.weibo.com/wiki/2/statuses/upload_url_text : 指定一个图片URL地址抓取后上传并同时发布一条新微博


        // TODO
//        使用 upload_pic 一一上传图片 得到pic_id, 然后调用 upload_url_text 发布多图微博



    }


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
