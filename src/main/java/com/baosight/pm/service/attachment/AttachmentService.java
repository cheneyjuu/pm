package com.baosight.pm.service.attachment;

import com.baosight.pm.entity.Attachment;
import com.baosight.pm.repository.AttachmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;

/**
 * User: Juchen
 * Date: 14-5-30
 * Time: 16:02
 */
@Component
@Transactional
public class AttachmentService {

    @Autowired
    private AttachmentDao attachmentDao;

    public void save(Attachment attachment){
        attachmentDao.save(attachment);
    }
}
