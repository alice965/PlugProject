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
		//sql.insert("member.addDetail", map);
		return true;
	}

	public int existOne(Map map) { //login. ���̵�� �н����� ��ġ�ϴ���
		return sql.selectOne("member.checkByIdAndPass", map);
	}

	// id�� email�� �Ӱ�, pass�� ���� �����Ͱ� �ִ��� Ȯ���Ҷ�
	public HashMap readOneById(String id) {
		return sql.selectOne("member.readOneById", id);
	}


}










