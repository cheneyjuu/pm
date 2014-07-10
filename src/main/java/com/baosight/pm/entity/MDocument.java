package com.baosight.pm.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * User: Juchen
 * Date: 14-6-15
 * Time: 19:09
 */
@Entity
@Table(name = "tbl_mdocument")
public class MDocument {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id")
    private String id;
    private String title;
    private String description;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User author;
    private String createTime;
    private String originArticle;
    private String article;
    private int type;//文档类型，1代表MarkDown，2代表服文本
    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

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

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getOriginArticle() {
        return originArticle;
    }

    public void setOriginArticle(String originArticle) {
        this.originArticle = originArticle;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
