package com.plug.dj.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.MultiValueMap;

@Repository
public class TestDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// 데이터베이스 등록
		public int save(String string) {
			return sql.insert("test.save", string);
		}
		public Map readOne(String num) {
			return sql.selectOne("test.readOne", num);
		}
		public int edit(Map map) {
			return sql.update("test.edit", map);
		}

}
