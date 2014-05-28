package com.baosight.pm.repository;

import com.baosight.pm.entity.Project;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * User: Juchen
 * Date: 14-5-26
 * Time: 14:53
 */
public interface ProjectDao extends PagingAndSortingRepository<Project, String>, JpaSpecificationExecutor<Project> {
}
