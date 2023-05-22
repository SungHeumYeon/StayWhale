package svc;

import static db.JdbcUtil.close;

import java.util.ArrayList;

import DAO.DataProcess;
import DTO.Writer;

public class ReviewListService {
		public int getListCount() throws Exception{
			int listCount = 0;
			DataProcess reviewDAO = new DataProcess();
			listCount = reviewDAO.selectListCount();
			return listCount;
		}
		public ArrayList<Writer> getReviewList(int page, int limit) throws Exception{
			ArrayList<Writer> reviewList = null;
			DataProcess reviewDAO = new DataProcess();
			reviewList = reviewDAO.review_check(page,limit);
			return reviewList;
		}
	}