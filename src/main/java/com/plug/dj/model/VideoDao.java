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
	
	// �����ͺ��̽� ���
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
	
	public String selectAdd_id(String video_num){
		return sql.selectOne("video.selectAdd_id", video_num);
	}
	
	public int existVideoId(Map map){
		//���� ��ȣ�� �������̵� ���ؾ���.
		return sql.selectOne("video.existVideoId", map);
	}
}