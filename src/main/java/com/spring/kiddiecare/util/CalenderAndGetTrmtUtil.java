package com.spring.kiddiecare.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import com.spring.kiddiecare.openApi.hospInfo.HospDetailItem;
import org.springframework.stereotype.Component;

@Component
public class CalenderAndGetTrmtUtil {
    private final Calendar calendar = Calendar.getInstance();

    public int printToday() {
        // 현재 시간 가져오기
        // 요일 구하기
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        // 요일 이름 구하기
        String[] dayNames = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
        String displayName = dayNames[dayOfWeek - 1];
        // 출력


        return dayOfWeek;
    }

    public String getStartByWeekday(HospDetailItem item) {

        String start = "";
        String end = "";
        if(item != null){
            switch (printToday()) {
                case 1:
                    start = item.getTrmtSunStart();
                    end = item.getTrmtSunEnd();
                    break;
                case 2:
                    start = item.getTrmtMonStart();
                    end = item.getTrmtMonEnd();
                    break;
                case 3:
                    start = item.getTrmtTueStart();
                    end = item.getTrmtTueEnd();
                    break;
                case 4:
                    start = item.getTrmtWedStart();
                    end = item.getTrmtWedEnd();
                    break;
                case 5:
                    start = item.getTrmtThuStart();
                    end = item.getTrmtThuEnd();
                    break;
                case 6:
                    start = item.getTrmtFriStart();
                    end = item.getTrmtFriEnd();
                    break;
                case 7:
                    start = item.getTrmtSatStart();
                    end = item.getTrmtSatEnd();
                    break;
            }
        }else{
            return null;
        }

        if(start == null || end == null){
            return null;
        }

        return String.format("%s:%s ~ %s:%s",start.substring(0,2),start.substring(2)
                ,end.substring(0,2),end.substring(2));
    }
}

