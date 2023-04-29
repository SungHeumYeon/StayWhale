package vo;

public class HotelCheckBox {
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getReservePossible() {
		return reservePossible;
	}
	public void setReservePossible(String reservePossible) {
		this.reservePossible = reservePossible;
	}
	public String getPromotion() {
		return promotion;
	}
	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}
	public String getHotelResortGrade() {
		return hotelResortGrade;
	}
	public void setHotelResortGrade(String hotelResortGrade) {
		this.hotelResortGrade = hotelResortGrade;
	}
	public String getBedType() {
		return bedType;
	}
	public void setBedType(String bedType) {
		this.bedType = bedType;
	}
	public String getDetailSearch() {
		return detailSearch;
	}
	public void setDetailSearch(String detailSearch) {
		this.detailSearch = detailSearch;
	}
	public int getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}
	public int getHighPrice() {
		return highPrice;
	}
	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}
	public int getPeopleCapa() {
		return peopleCapa;
	}
	public void setPeopleCapa(int peopleCapa) {
		this.peopleCapa = peopleCapa;
	}
	String location, checkin, checkout, reservePossible, promotion, hotelResortGrade, bedType, detailSearch;
	int lowPrice, highPrice, peopleCapa;
	
	
}
