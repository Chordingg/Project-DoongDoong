package com.doongdoong.web.product;

import java.util.List;

public interface PhotoService {
	
	//사진등록
	public void photoEnroll(ProductVO photo);
	
	//카테고리 리스트
	public List<CateVO> cateList();
	
	//이미지 데이터 반환
	public List<AttachImageVO> getAttachList(int product_id);
}
