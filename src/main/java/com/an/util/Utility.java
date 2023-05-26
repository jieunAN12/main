package com.an.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utility {
	
	// 서비스시에는 도메인으로 변경됨.
		  /**
		   * 2010-12-14 형식의 날짜를 리턴합니다.
		   * 
		   * @return 2008-01-30 형식의 문자열 리턴
		   */
		  public static synchronized String getDate() {
		    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");

		    String date = sd.format(new Date());

		    // System.out.println(date);
		    return date;
		  }

		  /**
		   * 20101214 형식의 날짜를 리턴합니다.
		   * 
		   * @return 20101214 형식의 문자열 리턴
		   */
		  public static synchronized String getDate2() {
		    SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");

		    String date = sd.format(new Date());

		    // System.out.println(date);
		    return date;
		  }

		  /**
		   * 20101214 형식의 날짜를 리턴합니다.
		   * 
		   * @param _date
		   * @return
		   */
		  public static synchronized String getDate3(Date _date) {
		    SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		    String date = sd.format(_date);

		    // System.out.println(date);
		    return date;
		  }

		  /**
		   * 2010년 12월 14일 형식의 날짜를 리턴합니다.
		   * 
		   * @return
		   */
		  public static synchronized String getDate4() {
		    SimpleDateFormat sd = new SimpleDateFormat("yyyy년 MM월 dd일");
		    String date = sd.format(new Date());

		    // System.out.println(date);
		    return date;
		  }

		  /**
		   * 20101214일 형식의 날짜를 리턴합니다.
		   * 
		   * @param _date
		   * @return
		   */
		  public static synchronized String getDate5(Date _date) {
		    SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		    String date = sd.format(_date);

		    // System.out.println(date);
		    return date;
		  }

		  /**
		   * 2010-12-14 형식의 날짜를 리턴합니다.
		   * 
		   * @return 2008-01-30 형식의 문자열 리턴
		   */
		  public static synchronized String getDate6(int year, int month, int day) {
		    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");

		    new Date();
		    String date = sd.format(new Date(year - 1900, month, day));

		    // System.out.println(date);
		    return date;
		  }

}
