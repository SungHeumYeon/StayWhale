package svc;

import static db.JdbcUtil.close;

import java.util.ArrayList;

import DAO.DataProcess;
import DTO.Writer;

public class ReviewSearchService {
		public int getSearchCount(String val, String str) throws Exception{
			int listCount = 0;
			DataProcess reviewDAO = new DataProcess();
			listCount = reviewDAO.searchListCount(val, str);
			return listCount;
		}
		public ArrayList<Writer> getSearchList(String val, String str, int page, int limit) throws Exception{
			ArrayList<Writer> reviewList = null;
			DataProcess reviewDAO = new DataProcess();
			reviewList = reviewDAO.review_search(val, str, page,limit);
			return reviewList;
		}
	}