package com.doongdoong.web.product;

import lombok.Data;

@Data
public class AttachImageVO {
	
	//상품id
	private int product_id;
	
	//경로
	private String uploadPath;
	
	//uuid
	private String uuid;
	
	//파일이름
	private String fileName;
	
	
	
}
