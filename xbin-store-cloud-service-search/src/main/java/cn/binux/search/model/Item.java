package cn.binux.search.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldIndex;
import org.springframework.data.elasticsearch.annotations.FieldType;


@Document(indexName = "item",type = "item")
@Data
public class Item {

    @Id
    @Field(type = FieldType.String,index = FieldIndex.not_analyzed,store = true)
    private String id;
    @Field(type = FieldType.String,index = FieldIndex.not_analyzed,store = true)
    private String title;
    @Field(type = FieldType.String,index = FieldIndex.not_analyzed,store = true)
    private String categoryName;
    @Field(type = FieldType.String,index = FieldIndex.not_analyzed,store = true)
    private String imgUrl;
    @Field(type = FieldType.Float,index = FieldIndex.not_analyzed,store = true)
    private float price;
    @Field(type = FieldType.String,index = FieldIndex.not_analyzed,store = true)
    private String SellPoint;
    @Field(type = FieldType.String,index = FieldIndex.not_analyzed,store = true)
    private String description;
}
