package cn.binux.search.mapper;

import cn.binux.search.model.Item;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;


public interface ItemMapper extends ElasticsearchRepository<Item,String> {
}
