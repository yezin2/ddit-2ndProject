package kr.or.ddit.ad.vo;

public class AdVO {
	private static String adId;
	private static String adName;
	private static int adPrice;
	private static int adDuration;
	
	public static String getAdId() {
		return adId;
	}
	public static void setAdId(String adId) {
		AdVO.adId = adId;
	}
	public static String getAdName() {
		return adName;
	}
	public static void setAdName(String adName) {
		AdVO.adName = adName;
	}
	public static int getAdPrice() {
		return adPrice;
	}
	public static void setAdPrice(int adPrice) {
		AdVO.adPrice = adPrice;
	}
	public static int getAdDuration() {
		return adDuration;
	}
	public static void setAdDuration(int adDuration) {
		AdVO.adDuration = adDuration;
	}
}