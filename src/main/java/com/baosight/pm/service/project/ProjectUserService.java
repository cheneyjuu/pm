package com.baosight.pm.service.project;

import com.baosight.pm.entity.ProjectUser;
import com.baosight.pm.repository.ProjectUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
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
}
