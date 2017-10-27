package com.plug.dj.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// �����ͺ��̽� ���
	public boolean addVideo(Map map) { //join
		sql.insert("video.addVideo", map);
		return true;
	}
}