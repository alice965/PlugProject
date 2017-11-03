package com.plug.dj.model;

import java.util.HashMap;
import java.util.List;
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
	
	public List<Map> selectVideoList(String num) {
		return sql.selectList("video.selectVideoList", num);
	}
	
	public List<Map> selectVideo_IdList(String num){
		return sql.selectList("video.selectVideo_IdList", num);
	}

	public boolean deleteVideo(String video_num){
		sql.update("video.deleteVideo", video_num);
		return true;
	}
}