import vo.CardBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.CardDAO;

public class CardViewService {

	Connection con = getConnection();
	CardDAO cardDAO = CardDAO.getInstance();
	cardDAO.setConnection(con);
	ArrayList<CardBean> cardList = cardDAO.selectCardList();
	close(con);
	return CardList;
}
