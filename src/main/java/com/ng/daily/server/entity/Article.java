package com.ng.daily.server.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigInteger;
import java.util.Date;

/**
 * Created by fangs on 15/1/9.
 */

@Document(collection = "article")
public class Article {

    @Id
    private BigInteger id; // 文章iD

    private String author; // 作者

    private Date postAt; // 发表时间

    private Integer status; // 状态

    private String tag; // 标签

    private String intro; // 介绍

    private String content; // 内容

    private String introPic; // 介绍图片

    public Article() {
    }

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", author='" + author + '\'' +
                ", content='" + content + '\'' +
                ", postAt=" + postAt +
                '}';
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPostAt() {
        return postAt;
    }

    public void setPostAt(Date postAt) {
        this.postAt = postAt;
    }
}
