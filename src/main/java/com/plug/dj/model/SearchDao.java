package com.plug.dj.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {
	@Autowired
	SqlSessionTemplate sql;
	
	public List<Map> listTitle(String keyword) {
		return sql.selectList("search.listTitle", keyword);
	}
	
	public List<Map> listOption(Map map) {
		System.out.println(map);
		return sql.selectList("search.listOption", map);
	}

}
