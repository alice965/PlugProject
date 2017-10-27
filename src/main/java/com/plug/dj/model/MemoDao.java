package com.plug.dj.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDao {
	@Autowired
	SqlSessionTemplate sql;
	
	public int addNewMemo(Map map) {
		return sql.insert("memo.addNewMemo", map);
	}
	public int addSendList(Map map) {
		return sql.insert("memo.addSendList", map);
	}
	public int addReceiveList(Map map) {
		return sql.insert("memo.addReceiveList", map);
	}
	
}
