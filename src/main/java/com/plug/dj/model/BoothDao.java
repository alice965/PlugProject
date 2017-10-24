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

}
