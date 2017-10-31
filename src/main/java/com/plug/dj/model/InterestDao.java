package com.plug.dj.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InterestDao {
	@Autowired
	SqlSessionTemplate sql;
	
	public int addInterest(Map map) {
		return sql.insert("interest.addInterest", map);
	}	
	
	public List<Map> listInterest(String id) {
		return sql.selectList("interest.listInterest", id);
	}
	
	public int delete(Map map) {
		return sql.update("interest.delete", map);
	}
	
	

}
