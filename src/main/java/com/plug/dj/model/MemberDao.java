package com.plug.dj.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// �����ͺ��̽� ���
	public boolean addOne(Map map) { //join
		sql.insert("member.addBasic", map);
		sql.insert("member.addDetail", map);
		return true;
	}

	public int existOne(Map map) { //login. ���̵�� �н����� ��ġ�ϴ���
		return sql.selectOne("member.existOne", map);
	}

	// id�� email�� �Ӱ�, pass�� ���� �����Ͱ� �ִ��� Ȯ���Ҷ�
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
	
	public boolean updatePass(Map map){ //change�� �Ķ���� �Ѱ��ְ� �ϹǷ� Map���� �ޱ�. id�� �����ϱ� controller���� �߰�.
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
	
}










