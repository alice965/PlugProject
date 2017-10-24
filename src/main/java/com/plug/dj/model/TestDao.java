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
		public List<Map> list() {
			return sql.selectList("myplay.list");
		}
		public Map readOne(String num) {
			return sql.selectOne("myplay.readOne", num);
		}
		public int delete(String num) {
			return sql.update("myplay.delete", num);
		}
		public int edit(Map map) {
			return sql.update("myplay.edit", map);
		}
		public int countListPage() {
			return sql.selectOne("myplay.countListPage");
		}
		
		public List<Map> listPage(Map map){
			return sql.selectList("myplay.listPage", map);
		}


}
