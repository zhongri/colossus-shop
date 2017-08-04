package com.colosuss.search.mapper;

import com.colosuss.search.model.Item;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;


public interface ItemMapper extends ElasticsearchRepository<Item,String> {
}
