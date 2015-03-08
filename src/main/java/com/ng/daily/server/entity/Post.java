package com.ng.daily.server.entity;

import com.google.common.collect.Maps;
import com.ng.daily.server.admin.IDGenerator;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

    //    @NotBlank
    private String title; // 标题
    private String content; // 内容
    //    @NotBlank
    private Integer status; // 状态: 草稿 已发布 队列
    //    @NotBlank
    private String type; // 类型: 文章 碎片
    //    @NotBlank
    private String tag; // 标签:
    //    @NotBlank
    private String source; // 来源

    private String titleImage; // 题图
    private List<String> imageList; // 图片列表

    private Date publishScheduleAt; // 定时发布时间
    private Date publishAt; // 发布时间

    private Map<String, Object> extras = Maps.newHashMap();

    private String crawlerUrl; // 爬虫抓取地址
    private Date crawledAt; // 抓取时间

    public Post() {
    }

    public static final Post createArticle() {
        Post post = new Post();
        post.setId(IDGenerator.getArticleId());
        post.setType(Post.TYPE_ARTICLE);
        post.setStatus(Post.STATUS_DRAFT);
        return post;
    }

    public static final Post createFragment() {
        Post post = new Post();
        post.setId(IDGenerator.getFragmentId());
        post.setType(Post.TYPE_FRAGMENT);
        post.setStatus(Post.STATUS_DRAFT);
        return post;
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

    public String getCrawlerUrl() {
        return crawlerUrl;
    }

    public void setCrawlerUrl(String crawlerUrl) {
        this.crawlerUrl = crawlerUrl;
    }

    public Date getCrawledAt() {
        return crawledAt;
    }

    public void setCrawledAt(Date crawledAt) {
        this.crawledAt = crawledAt;
    }

    public Date getPublishScheduleAt() {
        return publishScheduleAt;
    }

    public void setPublishScheduleAt(Date publishScheduleAt) {
        this.publishScheduleAt = publishScheduleAt;
    }

    public Date getPublishAt() {
        return publishAt;
    }

    public void setPublishAt(Date publishAt) {
        this.publishAt = publishAt;
    }

    public Object getExtra(String key) {
        return extras.get(key);
    }

    public void addExtra(String key, Object value) {
        extras.put(key, value);
    }

    public Map<String, Object> getExtras() {
        return extras;
    }

    public void setExtras(Map<String, Object> extras) {
        this.extras = extras;
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
