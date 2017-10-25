package com.plug.dj.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.MultiValueMap;

@Repository
public class FriendDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// 데이터베이스 등록
		public int add(Map map) {
			return sql.insert("friend.add", map);
		}
		public List<Map> myList(String id) {
			return sql.selectList("friend.myList", id);
		}
		public Map readOne(Map map) {
			return sql.selectOne("friend.readOne", map);
		}
		public int delete(String num) {
			return sql.update("friend.delete", num);
		}
		
		public List<Map> listAll() {
			return sql.selectList("friend.listAll");
		}
		public Map getNick(Map param) {
			return sql.selectOne("friend.readOne", param);
		}


}
