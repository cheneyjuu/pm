package com.baosight.pm.repository;

import com.baosight.pm.entity.Discuss;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: Juchen
 * Date: 14-5-30
 * Time: 14:18
 */
public interface DiscussDao extends PagingAndSortingRepository<Discuss, String>, JpaSpecificationExecutor<Discuss> {
}
