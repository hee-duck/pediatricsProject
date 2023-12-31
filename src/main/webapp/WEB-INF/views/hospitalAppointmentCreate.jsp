<%--
  Created by IntelliJ IDEA.
  User: dldbs
  Date: 2023-08-11
  Time: 오후 7:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>AppointmentCreate</title>
    <link rel="shortcut icon" href="/image/favicon.ico">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/hospital-appo-create.css" rel="stylesheet">
</head>
<body>

    <div class="select-area">
<%--        <h1>스케줄 생성</h1>--%>
<%--        <h1>의사 선택</h1>--%>

<%--        <div class="select-option">--%>
<%--        </div>--%>

        <div class="date-set-area">
            <h1>날짜 설정</h1>
            <div id="start-end-date">
                <div>
                    <h3>시작날짜</h3>
                    <input type="date" id="start-date" class="date-style">
                </div>
<%--                <span>부터</span>--%>
                <div>
                    <h3>종료날짜</h3>
                    <input type="date" id="end-date" class="date-style">
                </div>
                <button id="set-date">날짜 범위 설정</button>
            </div>

            <div id="except-area">
                <h3>제외날짜</h3>
                <div id="set-day">
                    <input type="date" id="except-day">
                    <input type="button" id="except-add" onclick="exceptAdd()" value="추가">
                </div>
                <div>
                    <input type="checkbox" id="except-sunday">
                    <label for="except-sunday">일요일제외</label>
                </div>
                <div id="except-days-area">

                </div>
                <button id="time-set-btn" onclick="timeSetBtn()">시간 범위 설정하기</button>
            </div>
        </div>

        <div class="time-set-area">
            <h1>요일별 시간 범위 설정</h1>
            <div id="set-weekday">

            </div>
        </div>

        <div class="meal-time-set-area">
            <h1>식사 시간 설정</h1>
            <div id="lunch-dinner">
                <div id="lunch">
                    <h3>점심시간</h3>
                    <input type="checkbox" id="no-lunch" checked>
                    <label for="no-lunch">점심시간 없음</label>
                    <input type="number" class="inp" id="l-start-hour" min="1" max="12"/>
                    :
                    <input type="number" class="inp" id="l-start-minute" value="00" readonly/>
                    부터
                    <input type="number" class="inp" id="l-end-hour"/>
                    :
                    <input type="number" class="inp" id="l-end-minute" value="00" readonly/>
                </div>

                <div id="dinner">
                    <h3>저녁시간</h3>
                    <input type="checkbox" id="no-dinner" checked>
                    <label for="no-dinner">저녁시간 없음</label>
                    <input type="number" class="inp" id="d-start-hour" min="1" max="12"/>
                    :
                    <input type="number" class="inp" id="d-start-minute" value="00" readonly/>
                    부터
                    <input type="number" class="inp" id="d-end-hour" min="1" max="12"/>
                    :
                    <input type="number" class="inp" id="d-end-minute" value="00" readonly/>
                </div>
            </div>

            <button id="appo-create-btn">예약 생성하기</button>
        </div>
    </div>

    <div id="loading" style="display: none">
        <div class="loading-content">
            <div class="loadingio-spinner-spinner-822xu4kqp5u"><div class="ldio-zhpd3csebyc">
                <div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div>
                </div>
            </div>
            <p>저장중입니다 잠시만 기다려주세요..</p>
        </div>
    </div>

</body>
</html>
