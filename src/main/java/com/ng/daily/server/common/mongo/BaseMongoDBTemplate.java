package com.ng.daily.server.common.mongo;


import com.ng.daily.server.common.pagination.Page;
import com.ng.daily.server.common.pagination.PageCreator;
import com.ng.daily.server.common.pagination.PaginationParameters;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;

import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class BaseMongoDBTemplate {
    private MongoTemplate mongoTemplate;

    /**
     * 获取mongoTemplate
     *
     * @return mongoTemplate
     */
    public MongoTemplate getMongoTemplate() {
        return mongoTemplate;
    }

    /**
     * 设置mongoTemplate
     *
     * @param mongoTemplate mongoTemplate
     */
    public void setMongoTemplate(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    public String getCollectionName(Class clazz) {
        String collectionName = this.getMongoTemplate().getCollectionName(clazz);
        return collectionName;
    }

    public <T> Page findByPage(Query query, PaginationParameters pp, Class<T> clazz) {
        String collectionName = this.getMongoTemplate().getCollectionName(clazz);
        return this.findByPage(query, pp, clazz, collectionName);
    }

    public <T> Page findByPage(Query query, PaginationParameters pp, Class<T> clazz, String collectionName) {
        int totalSize = new Long(this.getMongoTemplate().count(query, collectionName)).intValue();
        int skip = PageCreator.getFirstPageValue(pp, totalSize);
        int limit = PageCreator.getSeondPageValue(skip, totalSize, pp.getPageMaxSize());
        query.skip(skip).limit(limit);
        if (pp.getOrderKey() != null && !"".equals(pp.getOrderKey())) {
            Sort sort = null;
            if (null != pp.getOrderType() && !"".equals(pp.getOrderType())) {
                if (pp.getOrderType().equalsIgnoreCase(Direction.ASC.toString())) {
                    sort = new Sort(Direction.ASC, pp.getOrderKey());
                } else {
                    sort = new Sort(Direction.DESC, pp.getOrderKey());
                }
            } else {
                sort = new Sort(Direction.ASC, pp.getOrderKey());
            }
            if (sort != null) {
                query.with(sort);
            }
        } else if (null != pp.getOrderMap()) {
            Iterator<Map.Entry<String, String>> it = pp.getOrderMap().entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, String> entry = it.next();
                Sort sort = new Sort(Direction.fromString(entry.getValue()), entry.getKey());
                query.with(sort);
            }
        }
        List<T> result = this.getMongoTemplate().find(query, clazz, collectionName);
        Page<T> page = new Page<T>(pp.getCurrentPageNumber(), pp.getPageMaxSize(), result, totalSize, pp.get_page_div());
        return page;
    }
}
