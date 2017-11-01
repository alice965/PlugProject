package com.plug.dj.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDao {
	@Autowired
	SqlSessionTemplate sql;
	
	@Autowired
	DataSource ds;
	
	public int addNewMemo(Map map) {
		return sql.insert("memo.addNewMemo", map);
	}
	public List<Map> SendList() {
		return sql.selectList("memo.SendList");
	}
	public List<Map> ReceiveList() {
		return sql.selectList("memo.ReceiveList");
	}
	public HashMap readOne(String one) {
		HashMap r = sql.selectOne("memo.readOne", one);
		return r;
	}
}
	