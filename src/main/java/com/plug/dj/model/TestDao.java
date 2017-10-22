package com.plug.dj.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// 데이터베이스 등록
		public int save(Map map) {
			return sql.insert("test.save", map);
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
