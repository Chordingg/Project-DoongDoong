package com.doongdoong.web.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doongdoong.web.mybatis.product.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PhotoServiceImpl implements PhotoService{

	@Autowired
	private ProductMapper photoMapper;
	
	//사진등록
	@Override
	public void photoEnroll(ProductVO photo) {
			log.info("(service)photoEnroll....");
			photoMapper.generalEnroll(photo);
			System.out.println("photo" + photo);
			if(photo.getImageList() == null || photo.getImageList().size() <= 0) {
				return;
			}
			
			photo.getImageList().forEach(attach ->{
				attach.setProduct_id(photo.getProduct_id());
				photoMapper.imageEnroll(attach);
			});
	}

	
	//이미지 데이터 반환
	@Override
	public List<AttachImageVO> getAttachList(int product_id) {
		
		log.info("getAttachList......");
		
		return photoMapper.getAttachList(product_id);
	}


	//카테고리 리스트
	@Override
	public List<CateVO> cateList() {

		log.info("(service)cateList.....");
		
		return photoMapper.cateList();
	}

}
