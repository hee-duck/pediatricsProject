<%--
  ******  안씀  *****
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <title>병원 예약하기 생성</title>
    <link rel="shortcut icon" href="/image/favicon.ico">
    <link href="/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/hospital-appo.css">
</head>
<c:import url="header.jsp"></c:import>
<body>
<div class="container">
    <section>
        <div>
            <form method="post" onsubmit="return false">

    <%--            <input type="text" id="ykiho" name="ykiho" placeholder="">--%>
                <input type="text" id="hospital_name" name="hospital_name">
                <input type="text" id="ykiho" name="ykiho" placeholder="병원코드" value="${Ykiho}" style="display: none">
                <select name="doctor_list" id="doctor_list">
                    <option value="">의사선택</option>
                </select>
    <%--            <input type="text" id="doctor_no" name="doctor_no" placeholder="의사코드">--%>

    <%--            <input type="text" id="doctor_average_time_of_care" name="doctor_average_time_of_care" placeholder="의사평균진료시간[분단위]">--%>

                <h2>병원 예약 생성</h2>

                <label for="date">
                    <input type="date" id="date" value="">
                </label>

                <button>인원수 초기화</button>
                <table id="time_set">
                    <thead>
                    <tr>
                        <th>시간</th>
                        <th>최대 예약 가능 인원</th>
                        <th>현재 예약자 수</th>
                        <th>보류 인원 수</th>
                        <th>최종 예약 가능 인원</th>
                    </tr>
                    </thead>
                    <tbody id="time_set_body">
                    </tbody>
                </table>

                <button onclick="appo_create()">예약 생성</button>
            </form>
        </div>
    </section>
</div>
    <script src="/script/hospital-appo.js"></script>
</body>
<c:import url="footer.jsp"></c:import>
</html>
