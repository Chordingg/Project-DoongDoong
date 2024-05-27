package com.doongdoong.web.product;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doongdoong.web.product.ProductVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.doongdoong.web.product.PhotoService;
import com.doongdoong.web.member.MemberService;
import com.doongdoong.web.product.AttachImageVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@Controller
@RequestMapping("/photoPrint")
public class PhotoPrintController {
	
	@Autowired
	private PhotoService photoService;
	
	@Autowired
	private MemberService memberservice;

	
	@GetMapping("/general")
	public String generalPhotograph() {
		
		return "product/photoPrint/general";
	}
	
	@GetMapping("/generalUpload")
	public String generalUpload(Model model) throws Exception{
		
		log.info("일반사진등록 페이지 접속");
		
		ObjectMapper objm = new ObjectMapper();
		
		List list = photoService.cateList();
		
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
		log.info("변경 전......." + list);
		log.info("변경 후......." + cateList);
		
		return "product/photoPrint/generalUpload";
	}
	
	
	@PostMapping("/generalUploadPost")
    public String generalUploadPost(ProductVO photo, CateVO cate, Model model) {
       log.info("photoEnrollPOST....: " + photo);
       
       
       photoService.photoEnroll(photo);
//       rttr.addFlashAttribute("enroll_result", photo.getProduct_id());
       model.addAttribute("enroll_result", photo.getProduct_id());
       photoService.cateList();
       model.addAttribute("cateCode", cate.getCateCode());
       
       
       return "product/photoPrint/photoManage";
       
    }

	
	//사진 수정 페이지로 이동
		@GetMapping("/photoManage")
		public String photoManageGET() {
			return "product/photoPrint/photoManage";
		}
	
	
	// 이미지 정보 가지고 있어서 보여주기
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int product_id) {
		
		log.info("이미지 정보 가져오기" + product_id);
		
		return new ResponseEntity<List<AttachImageVO>>(photoService.getAttachList(product_id), HttpStatus.OK);
	}
	
	//첨부파일 업로드
		@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
			
			log.info("uploadAjaxActionPOST..........");
			
			for(MultipartFile multipartFile: uploadFile) {
				File checkfile = new File(multipartFile.getOriginalFilename());
				String type =null;
				
				try {
					type = Files.probeContentType(checkfile.toPath());
					log.info("MIME TYPE : " + type);
				} catch (IOException e) {
					e.printStackTrace();
				}
				if(!type.startsWith("image")) {
					
					List<AttachImageVO> list = null;
					return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				}
			}//for
			
			String uploadFolder = "C:\\upload";
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date();
			
			String str = sdf.format(date);
			
			String datePath = str.replace("-", File.separator);
			
			/* 폴더 생성 */
			File uploadPath = new File(uploadFolder, datePath);
			
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			
			//이미지 정보 담는 객체
			List<AttachImageVO> list = new ArrayList();
			
			
			// 향상된 for
			for(MultipartFile multipartFile : uploadFile) {
				
				//이미지 정보 객체
				AttachImageVO vo = new AttachImageVO();
				
				/* 파일 이름 */
				String uploadFileName = multipartFile.getOriginalFilename();	
				vo.setFileName(uploadFileName);
				vo.setUploadPath(datePath);
				
				/* uuid 적용 파일 이름 */
				String uuid = UUID.randomUUID().toString();
				vo.setUuid(uuid);
				
				
				uploadFileName = uuid + "_" + uploadFileName;
				
				/* 파일 위치, 파일 이름을 합친 File 객체 */
				File saveFile = new File(uploadPath, uploadFileName);
				
				/* 파일 저장 */
				try {
					multipartFile.transferTo(saveFile);
					
//					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//					
//					BufferedImage bo_image = ImageIO.read(saveFile);
//					
//					/* 비율 */
//					double ratio = 3;
//					/*넓이 높이*/
//					int width = (int) (bo_image.getWidth() / ratio);
//					int height = (int) (bo_image.getHeight() / ratio);	
//					
//					BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//									
//					Graphics2D graphic = bt_image.createGraphics();
//					
//					graphic.drawImage(bo_image, 0, 0, width, height, null);
//						
//					ImageIO.write(bt_image, "jpg", thumbnailFile);
					
					/* 방법 2 */
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);				
					
					BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 2;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);
					
					Thumbnails.of(saveFile)
			        .size(width, height)
			        .toFile(thumbnailFile);
					
				} catch (Exception e) {
					e.printStackTrace();
				} 
				list.add(vo);
		} 	//for 
			
			ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
			
			return result;
		}
	
	
	//이미지 출력
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		log.info("getImage()......" + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	//이미지 파일 삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile...." + fileName);
		
		File file = null;
		
		try {
			//섬네일 파일 삭제
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		} //catch
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping("/identification")
	public String IdentificationPhotograph() {
		
		return "product/photoPrint/identification";
	}
	
	@GetMapping("/decorate")
	public String DecoratePhotograph() {
		
		return "product/photoPrint/decorate";
	}
}
