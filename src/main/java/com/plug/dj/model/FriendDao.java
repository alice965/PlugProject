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
		public Map readOne(Map map) {
			return sql.selectOne("friend.readOne", map);
		}
		public Map readChkReqOne(String id) {
			return sql.selectOne("friend.readChkReqOne", id);
		}
		public int delete(Map map) {
			return sql.update("friend.delete", map);
		}
		public int accept(Map map) {
			return sql.update("friend.accept", map);
		}
		public List<Map> listReq(String id) {
			return sql.selectList("friend.listReq", id);
		}
		public List<Map> listSnd(String id) {
			return sql.selectList("friend.listRcv", id);
		}
		public List<Map> listFriend(String id) {
			return sql.selectList("friend.listFriend", id);
		}
		
		public Map getNick(Map map) {
			return sql.selectOne("friend.getNick", map);
		}
}
