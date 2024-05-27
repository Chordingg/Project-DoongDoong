package com.doongdoong.web.review;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewTests {
	public static void main(String[] args) {

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "doong";
		String password = "doong";
		
		try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "INSERT INTO tbl_review (userid, product_id, title, content, score, photo, regdate, updatedate) VALUES (?, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "test@naver.com");
                pstmt.setString(2, "example_product");
                pstmt.setString(3, "Great Product!");
                pstmt.setString(4, "This product exceeded my expectations. I highly recommend it!");
                pstmt.setInt(5, 5);

                // 이미지 파일을 읽어와서 BLOB 값으로 설정
                File imageFile = new File("upload/tmp/image.jpg");
                FileInputStream fis = new FileInputStream(imageFile);
                pstmt.setBinaryStream(6, fis, (int) imageFile.length());

                int rowsInserted = pstmt.executeUpdate();
                
                if (rowsInserted > 0) {
                    System.out.println("A new row has been inserted.");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
