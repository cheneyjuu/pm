package com.baosight.pm.service.project;

import com.baosight.pm.entity.Project;
import com.baosight.pm.repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
}
