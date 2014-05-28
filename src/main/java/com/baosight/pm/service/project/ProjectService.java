package com.baosight.pm.service.project;

import com.baosight.pm.entity.Project;
import com.baosight.pm.entity.User;
import com.baosight.pm.repository.ProjectDao;
import com.baosight.pm.service.account.ShiroDbRealm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;
import java.util.Set;

/**
 * User: Juchen
 * Date: 14-5-26
 * Time: 14:55
 */
@Component
@Transactional
public class ProjectService {

    @Autowired
    private ProjectDao projectDao;

    public void save(Project project){
        projectDao.save(project);
    }

    public List<Project> list(){
        Sort sort = new Sort("createTime");
        return (List<Project>)projectDao.findAll(sort);
    }

    public List<Project> listWithUser(final Long uid){
        return projectDao.findAll(new Specification<Project>() {
            @Override
            public Predicate toPredicate(Root<Project> projectRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                projectRoot = criteriaQuery.from(Project.class);
                Path<Long> userId = projectRoot.get("users").get("user_id");
                criteriaQuery.where(criteriaBuilder.equal(userId, uid));
                return null;
            }
        });
    }

    public Project findWithId(final String projectId){
        return projectDao.findOne(new Specification<Project>() {
            @Override
            public Predicate toPredicate(Root<Project> projectRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = projectRoot.get("id");
                criteriaQuery.where(criteriaBuilder.equal(id, projectId));
                return null;
            }
        });
    }
}
