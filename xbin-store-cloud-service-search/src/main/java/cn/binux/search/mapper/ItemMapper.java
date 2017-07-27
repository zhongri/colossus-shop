package cn.binux.search.mapper;

import cn.binux.search.model.Item;
import org.springframework.data.elasticsearch.repository.ElasticsearchCrudRepository;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

public interface ItemMapper extends ElasticsearchRepository<Item,String>,QueryDslPredicateExecutor<Item> {
}
