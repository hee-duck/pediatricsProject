<%--
  Created by IntelliJ IDEA.
  User: dldbs
  Date: 2023-08-08
  Time: 오후 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/hospital-appo.css">
    <title>병원 예약하기 생성</title>
</head>
<body>
    <div>
        <form method="post" onsubmit="return false">

<%--            <input type="text" id="ykiho" name="ykiho" placeholder="">--%>
            <input type="text" id="ykiho" name="ykiho" placeholder="병원코드">
            <input type="text" id="doctor_name" name="doctor_name" placeholder="의사명">
            <input type="text" id="doctor_average_time_of_care" name="doctor_average_time_of_care" placeholder="의사평균진료시간[분단위]">

            <h2>병원 예약 생성</h2>
            <label for="date">
                <input type="date" id="date" max="2023-09-09" min="2023-08-09" value="2023-08-09">
            </label>
            <table id="time_set">
                <thead>
                    <tr>
                        <th>시간</th>
                        <th>예약가능 수</th>
                    </tr>
                </thead>
            </table>
            <input type="text" id="hospital_announcement" name="hospital_announcement" placeholder="병원 공지사항">
            <input type="text" id="count" name="count" placeholder="현재 예약자 수">
            <input type="text" id="max" name="max" placeholder="예약 가능한 최대 인원수">

            <button onclick="appo_create()">예약 생성</button>
        </form>

    </div>

    <script src="/script/hospital_appo.js"></script>
</body>
</html>
