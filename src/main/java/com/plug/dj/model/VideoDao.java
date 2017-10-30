package com.plug.dj.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDao {
	@Autowired
	SqlSessionTemplate sql;
	
	// 데이터베이스 등록
	public boolean addVideo(Map map) { //join
		sql.insert("video.addVideo", map);
		return true;
	}
	
	public HashMap selectVideoList(int num) {
		return sql.selectOne("video.selectVideoList", num);
	}
}