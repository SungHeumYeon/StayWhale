package svc;

import static db.JdbcUtil.close;

import java.util.ArrayList;

import DAO.DataProcess_Review;
import DTO.Writer;

public class ReviewListService {
		public int getListCount() throws Exception{
			int listCount = 0;
			DataProcess_Review reviewDAO = new DataProcess_Review();
			listCount = reviewDAO.selectListCount();
			return listCount;
		}
		public ArrayList<Writer> getReviewList(int page, int limit) throws Exception{
			ArrayList<Writer> reviewList = null;
			DataProcess_Review reviewDAO = new DataProcess_Review();
			reviewList = reviewDAO.review_check(page,limit);
			return reviewList;
		}
	}