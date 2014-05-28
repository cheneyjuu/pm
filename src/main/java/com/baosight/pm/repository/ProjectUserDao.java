package com.baosight.pm.repository;

import com.baosight.pm.entity.ProjectUser;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: Juchen
 * Date: 14-5-28
 * Time: 13:03
 */
public interface ProjectUserDao extends PagingAndSortingRepository<ProjectUser, Long>, JpaSpecificationExecutor<ProjectUser> {
}
