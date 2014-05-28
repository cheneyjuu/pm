package com.baosight.pm.entity;

import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: Juchen
 * Date: 14-5-28
 * Time: 12:42
 */
@Entity
@Table(name = "tbl_project_user")
public class ProjectUser {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade(value = CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "project_id")
    private Project project;

    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade(value = CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "user_id")
    private User user;
}
