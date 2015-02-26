package com.ng.daily.server.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

/**
 * Created by fangs on 15/1/9.
 */

@Document(collection = "posts")
public class Post {

    public static final String TYPE_ARTICLE = "article";
    public static final String TYPE_FRAGMENT = "fragment";

    public static final Integer STATUS_DRAFT = -1;
    public static final Integer STATUS_QUEUE = 0;
    public static final Integer STATUS_ONLINE = 1;

    @Id
    private String id; // 文章ID
    private String title; // 标题
    private String content; // 内容
    private Integer status; // 状态: 草稿 已发布 队列
    private String type; // 类型: 文章 碎片
    private String tag; // 标签:
    private String source; // 来源

    private String titleImage; // 题图
    private List<String> imageList; // 图片列表

    public Post() {
    }

    @Override
    public String toString() {
        return "Post{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", status=" + status +
                ", type='" + type + '\'' +
                ", tag='" + tag + '\'' +
                ", source='" + source + '\'' +
                ", titleImage='" + titleImage + '\'' +
                ", imageList=" + imageList +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }
}
