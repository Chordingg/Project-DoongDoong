package com.doongdoong.web.mybatis.product;

import java.util.List;

import com.doongdoong.web.product.AttachImageVO;
import com.doongdoong.web.product.CateVO;
import com.doongdoong.web.product.ProductVO;

public interface ProductMapper {

	//일반사진등록
	public void generalEnroll(ProductVO photo);
	
	//카테고리 리스트
	public List<CateVO> cateList();
	
	//이미지 등록
	public void imageEnroll(AttachImageVO imageVO);
	
	
	//이미지 데이터 반환
	public List<AttachImageVO> getAttachList(int product_id);
}
