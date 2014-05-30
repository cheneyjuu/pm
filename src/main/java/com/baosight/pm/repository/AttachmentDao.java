package com.baosight.pm.repository;

import com.baosight.pm.entity.Attachment;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: Juchen
 * Date: 14-5-30
 * Time: 15:00
 */
public interface AttachmentDao extends PagingAndSortingRepository<Attachment, String>, JpaSpecificationExecutor<Attachment> {
}
