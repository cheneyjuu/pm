package com.baosight.pm.service;

import com.baosight.pm.entity.MDocument;
import com.baosight.pm.repository.MDocumentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * User: Juchen
 * Date: 14-6-15
 * Time: 19:16
 */
@Component
@Transactional
public class MDocumentService {

    @Autowired
    private MDocumentDao documentDao;

    public void save(MDocument document){
        documentDao.save(document);
    }

    public Page<MDocument> documentPage(int pageNumber, int pageSize){
        return documentDao.findAll(new Specification<MDocument>() {
            @Override
            public Predicate toPredicate(Root<MDocument> mDocumentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize));
    }

    public MDocument findOne(String id){
        return documentDao.findOne(id);
    }
}
