package org.example;

import org.apache.hadoop.hive.ql.exec.UDF;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyUdf extends UDF {
    public String evaluate(String input1, String input2) {
        if (input2.equals("q")) {
            return get_quarter(input1);
        } else if (input2.equals("w")) {
            return get_week(input1);
        } else if (input2.equals("m")) {
            return get_mon(input1);
        } else if (input2.equals("y")) {
            return get_yea(input1);
        } else {
            return "参数错误";
        }
    }

    public String get_yea(String input1) {
        String yea = input1.substring(0, 4);
        return yea + "-01-01";
    }

    public String get_mon(String input1) {
        String ym = input1.substring(0, 7);
        return ym + "-01";


    }

    public String get_quarter(String input1) {
        String mon = input1.substring(5, 7);
        String ye = input1.substring(0, 4);
        int ii = Integer.parseInt(mon);
        if (ii > 10) {
            return ye + "-" + "-10-01";
        } else if (ii > 7) {
            return ye + "-" + "-07-01";
        } else if (ii > 4) {
            return ye + "-" + "-04-01";
        } else {
            return ye + "-" + "-01-01";
        }
    }

    public String get_week(String input1) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        try {
            cal.setTime(sdf.parse(input1));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);
        if (1 == dayWeek) {
            cal.add(Calendar.DAY_OF_MONTH, -1);
        }
        // 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        // 获得当前日期是一个星期的第几天
        int day = cal.get(Calendar.DAY_OF_WEEK);
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);
        Date time = cal.getTime();
        return sdf.format(time);
    }

}
