package com.baosight.pm.service.discuss;

import com.baosight.pm.entity.Discuss;
import com.baosight.pm.repository.DiscussDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;

/**
 * User: Juchen
 * Date: 14-5-30
 * Time: 14:19
 */
@Component
@Transactional
public class DiscussService {

    @Autowired
    private DiscussDao discussDao;

    public void save(Discuss discuss){
        discussDao.save(discuss);
    }
}
