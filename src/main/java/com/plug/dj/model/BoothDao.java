package com.plug.dj.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoothDao {
	@Autowired
	SqlSessionTemplate sql;
	
	public List<Map> listAll() {
		return sql.selectList("booth.listAll");
	}
	
	public List<Map> listNew() {
		return sql.selectList("booth.listNew");
	}
	
	public List<Map> listInterest() {
		return sql.selectList("booth.listInterest");
	}
	
	public Map readOne(String num) {
		return sql.selectOne("booth.readOne", num);
	}
	public int increaseCnt(String num) {
		return sql.update("booth.increaseCnt", num);
	}

}
