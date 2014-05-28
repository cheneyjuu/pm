package com.baosight.pm.service.project;

import com.baosight.pm.entity.ProjectUser;
import com.baosight.pm.entity.User;
import com.baosight.pm.repository.ProjectUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import javax.persistence.criteria.*;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Set;

/**
 * User: Juchen
 * Date: 14-5-28
 * Time: 13:04
 */
@Component
@Transactional
public class ProjectUserService {

    @Autowired
    private ProjectUserDao projectUserDao;
    public void save(Set<ProjectUser> projectUserSet){
        projectUserDao.save(projectUserSet);
    }

    public List<ProjectUser> listWithUser(final Long uid){
        return projectUserDao.findAll(new Specification<ProjectUser>() {
            @Override
            public Predicate toPredicate(Root<ProjectUser> projectUserRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<Long> userId = projectUserRoot.get("user").get("id");
                criteriaQuery.where(criteriaBuilder.equal(userId, uid));
                return null;
            }
        });
    }
}
