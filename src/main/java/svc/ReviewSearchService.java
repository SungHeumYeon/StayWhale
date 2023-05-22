package svc;

import static db.JdbcUtil.close;

import java.util.ArrayList;

import DAO.DataProcess_Review;
import DTO.Writer;

public class ReviewSearchService {
		public int getSearchCount(String val, String str) throws Exception{
			int listCount = 0;
			DataProcess_Review reviewDAO = new DataProcess_Review();
			listCount = reviewDAO.searchListCount(val, str);
			return listCount;
		}
		public ArrayList<Writer> getSearchList(String val, String str, int page, int limit) throws Exception{
			ArrayList<Writer> reviewList = null;
			DataProcess_Review reviewDAO = new DataProcess_Review();
			reviewList = reviewDAO.review_search(val, str, page,limit);
			return reviewList;
		}
	}