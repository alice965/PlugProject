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
		//sql.insert("member.addDetail", map);
		return true;
	}

	public int existOne(Map map) { //login. 아이디와 패스워드 일치하는지
		return sql.selectOne("member.checkByIdAndPass", map);
	}

	// id나 email이 머고, pass가 머인 데이터가 있는지 확인할때
	public HashMap readOneById(String id) {
		return sql.selectOne("member.readOneById", id);
	}
	
	public int addProfile(Map map) {
		return sql.insert("member.addProfile", map);
	}
	
	public Map readLatestProfileById(String id) {
		return sql.selectOne("member.readLatestProfileById", id);
	}


}










