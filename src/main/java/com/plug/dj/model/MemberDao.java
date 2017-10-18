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
	public boolean addOne(Map map) {
		sql.insert("member.addBasic", map);
		sql.insert("member.addDetail", map);
		return true;
	}

	public int existId(Map map) {
		return sql.selectOne("member.checkById", map);
	}
	
	public int existNickname(Map map) {
		return sql.selectOne("member.checkByNickname", map);
	}



}










