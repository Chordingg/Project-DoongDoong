package com.doongdoong.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.doongdoong.web.mybatis.service.NoticeMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeMapper noticeMapper;

	@Override
	public void insert(NoticeVO noticeVO) {
		
		noticeMapper.insert(noticeVO);
	}

	@Override
	public List<NoticeVO> getList() {
		
		return noticeMapper.noticeList();
	}

	@Override
	public NoticeVO get(Long nno) {
		
		return noticeMapper.read(nno);
	}

	@Override
	public boolean remove(Long nno) {
		
		return noticeMapper.delete(nno) == 1;
	}

	@Override
	public boolean modify(NoticeVO noticeVO) {
		
		return noticeMapper.update(noticeVO) == 1;
	}
	
	

}
