/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.booking;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.StringTokenizer;

/**
 *
 * @author Xqy
 */
public class DateofApp {

    public String DayofWeek(String dateW) {
        StringTokenizer stk = new StringTokenizer(dateW, "/-");
        int y = Integer.parseInt(stk.nextToken());
        int m = Integer.parseInt(stk.nextToken());
        int d = Integer.parseInt(stk.nextToken());
        LocalDate date = LocalDate.of(y, m, d);
        DayOfWeek day = date.getDayOfWeek();
        return day.getDisplayName(TextStyle.FULL, Locale.getDefault());
    }

    public Date AfterDate(Date date, int count) {
       return date = Date.valueOf(LocalDate.now().plusDays(count));
    }

}
