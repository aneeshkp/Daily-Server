package com.ng.daily.server.entity;

import org.springframework.data.annotation.Id;

/**
 * Created by fangs on 15/2/14.
 */
public class Draft {

    @Id
    private String id;
    private String title; // 标题
    private String titleImage; // 题图
    private String source; // 来源
    private String content; // 内容

    public Draft() {
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

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
