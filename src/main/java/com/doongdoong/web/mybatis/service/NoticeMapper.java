package com.doongdoong.web.mybatis.service;

import java.util.List;

import com.doongdoong.web.service.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> noticeList();
	
	public void insert(NoticeVO noticeVO);
	
	public NoticeVO read(Long nno);
	
	public int delete(Long nno);
	
	public int update(NoticeVO noticeVO);

}
