package com.baosight.pm.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * User: Juchen
 * Date: 14-5-30
 * Time: 14:46
 */
@Entity
@Table(name = "tbl_attachment")
public class Attachment {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id")
    private String id;
    private String fileName;
    private String filePath;
    private String createTime;
    private String fileType;
    @ManyToOne
    @JoinColumn(name = "discuss_id")
    private Discuss discuss;

    public Discuss getDiscuss() {
        return discuss;
    }

    public void setDiscuss(Discuss discuss) {
        this.discuss = discuss;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
}
