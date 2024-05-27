package com.doongdoong.web.service;

import java.util.List;

public interface NoticeService {
	
	public void insert(NoticeVO noticeVO);
	
	public List<NoticeVO> getList();
	
	public NoticeVO get(Long nno);
	
	public boolean remove(Long nno);
	
	public boolean modify(NoticeVO noticeVO);

}
