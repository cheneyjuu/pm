package com.baosight.pm.entity;

import javax.persistence.*;
import java.util.Set;

/**
 * User: Juchen
 * Date: 14-5-22
 * Time: 14:34
 */
@Entity
@Table(name = "tbl_project")
public class Project extends IdEntity{

    private Set<User> users;
    private String projectName;
    private String subName;
    private String intro;
    private String createTime;
    private int status;//1为有效, 0为失效, -1为删除状态

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @ManyToMany
    @JoinTable(name = "tbl_project_user", joinColumns = @JoinColumn(name = "project_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
