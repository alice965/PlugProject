package com.plug.dj.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlayListDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// �����ͺ��̽� ���
		public boolean add(Map map) {
			sql.insert("myplay.add", map);
			return true;
		}


}
