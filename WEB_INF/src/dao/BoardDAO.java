package dao;


import static db.JdbcUtil.*;//jdbc ���� ���ϰ� �ۼ���.
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

//vo ��ü import �ؾ���

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {}
	
	
	//�̱��� �������� boardDAO ��ü�� null�̸� ���ο� ��ü�� ���� �� ��ȯ
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	//�����ڴ� ���⼭ ������ ���� ����
	public void setCon(Connection con) {
		this.con = con;
	}
	
	//�� ��Ϻ���
	//vo ��ü �� ���� ��ü�� Ŭ������ ���� ����� �׽�Ʈ �Ұ���.
	public ArrayList</*VO��ü*/> selectArticleList(/*�Ű����� ���� : ���翡���� page�� limit �����. ��ũ�ѷ� �� ������ �����̶�� �� ���� �ʿ����.*/){
		//pstmt�� rs �ʱ�ȭ
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//���ް� �����ȣ ������ �������� ����
		String board_list_sql="select * from bcard order by pos_num, emp_num asc";
		//vo ��ü�� ���� arraylist �ʱ�ȭ
		ArrayList</*VO��ü*/> articleList = new ArrayList</*VO��ü*/>();
		//vo ��ü �ʱ�ȭ
		/*vo��ü ���� �ʿ�*/ board = null;
		

		//����ó�� �� �����ڸ� �̿��ؼ�, �����ڷ� �ҷ��� �����͸� ����.
		
		//vo��ü�� ���� ����ȭ ���ʿ�.
		try {
			//���ĵ� ��� �ҷ�����
			pstmt = con.prepareStatement(board_list_sql);
			rs = pstmt.executeQuery();
			
			//board ��ü�� ���̻� �˻��Ǵ� �����Ͱ� ���� ������ ����.
			while(rs.next()) {
				//���ο� vo��ü ����
				board = new /*vo��ü ���� �ʿ�*/;
				board.setBoard_NUM(rs.getInt(""));// "" �ȿ� �ش��ϴ� vo��ü�� �־����. �Ʒ��� ������.
				board.setBoard_NAME(rs.getString(""));
				board.setBoard_SNUM(rs.getInt(""));//�ֹι�ȣ
				board.setBoard_DEP(rs.getInt(""));//�μ�
				board.setBoard_NUM(rs.getInt(""));//����
				board.setBoard_MOBILE(rs.getInt(""));
				board.setBoard_PHONE(rs.getInt(""));//�μ���ȣ
				board.setBoard_FAX(rs.getInt(""));
				board.setBoard_EMAIL(rs.getString(""));
				board.setBoard_EDATE(rs.getDate(""));//�Ի���
				board.setBoard_RDATE(rs.getDate(""));//�����
				articleList.add(board);
			}
		}catch(Exception e) {
			System.out.println("getBoardList ���� : " + e);
		}finally {
			close(rs);
			close(pstmt);
		}
	return articleList;
		
	}
	
}
