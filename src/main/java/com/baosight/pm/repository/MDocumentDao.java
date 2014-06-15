package com.baosight.pm.repository;

import com.baosight.pm.entity.MDocument;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: Juchen
 * Date: 14-6-15
 * Time: 19:15
 */
public interface MDocumentDao extends PagingAndSortingRepository<MDocument, String>, JpaSpecificationExecutor<MDocument> {
}
