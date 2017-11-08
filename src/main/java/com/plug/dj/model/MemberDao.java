package com.plug.dj.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// 데이터베이스 등록
	public boolean addOne(Map map) { //join
		sql.insert("member.addBasic", map);
		sql.insert("member.addDetail", map);
		return true;
	}

	public int existOne(Map map) { //login. 아이디와 패스워드 일치하는지
		return sql.selectOne("member.existOne", map);
	}

	// id나 email이 머고, pass가 머인 데이터가 있는지 확인할때
	public HashMap readOneById(String id) {
		return sql.selectOne("member.readOneById", id);
	}
	
	public int checkById(String id) {
		return sql.selectOne("member.checkById", id);
	}
	public int checkByNickname(String nickname) {
		return sql.selectOne("member.checkByNickname", nickname);
	}
	
	public boolean updateOneDetail(Map map) {
		sql.insert("member.updateOneDetail", map);
		return true;
	}
	
	public boolean updateOneProfile(Map map){
		sql.insert("member.updateOneProfile", map);
		return true;
	}
	
	public Map readLatestProfileById(String id) {
		return sql.selectOne("member.readLatestProfileById", id);
	}
	
	public boolean updatePass(Map map){ //change로 파라미터 넘겨주고 하므로 Map으로 받기. id는 없으니까 controller에서 추가.
		sql.update("member.updatePass", map);
		return true;
	}
	
	public boolean updateOutFlag(Map map){
		sql.update("member.updateOutFlag", map);
		return true;
	}
	
	public String selectFlag(String id){
		return sql.selectOne("member.selectFlag", id);
	}
	
	public List<Map> readAllByNickname(String nickname){
		return sql.selectList("member.readAllByNickname", nickname);
	}
	
	//비밀번호 찾을 때 uuid에서 추출한 auth_str을 비밀번호에 새롭게 저장한다.
	public boolean findPass(Map map){
		sql.update("member.findPass", map);
		return true;
	}
	
}










