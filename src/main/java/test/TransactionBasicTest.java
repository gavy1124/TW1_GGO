package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionBasicTest {
//	public static void main(String[] args) {
//
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user = "scott";
//		String password = "tiger1234";
//		String sql = "";
//		Connection con = null;
//		PreparedStatement ptmt = null;
//
//		// 1. 현재 작업의 진행상태를 저장하기위한 프래그변수 선언 ( 정상상태 or 오류상태 )
//		boolean state = false;
//		
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			con = DriverManager.getConnection(url, user, password);
//			//2. 자바는 autocommit이 기본 설정값이므로 해제!
//			con.setAutoCommit(false);
//			
//			// 구매버튼실행시 실행되는 작업들
//			sql = "insert into test values ('test21','1234','서울','장동건','배우')";
//			ptmt = con.prepareStatement(sql);
//			ptmt.executeUpdate();
//			sql = "insert into test values ('test22','1234','인천','이민호','배우)";
//			ptmt = con.prepareStatement(sql);
//			ptmt.executeUpdate();
//			sql = "insert into test values ('test23','1234','군산','신하균','배우)";
//			ptmt = con.prepareStatement(sql);
//			ptmt.executeUpdate();
//
//			// 3. 전체 line이 실행된다는것은 정상적으로 작업완료 했다는 의미이기에 state를 treu로 맞춤.
//			state = true;
//			
//		} catch (ClassNotFoundException e) {
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			// 4. state값을 판단(정상 or 오류 )하여, finally블럭안에서 DB에 최종 반영될 수 있도록 처리
//			try {
//				if(state) { // 정상이라면
//					con.commit(); //DB에 모든 작업을 commit시킨다.
//				}else {
//					con.rollback();//DB에 모든작업을 rollback시킨다.
//				}
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//	}
}
