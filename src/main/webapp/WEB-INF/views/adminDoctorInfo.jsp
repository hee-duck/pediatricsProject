<%--
  Created by IntelliJ IDEA.
  User: 채희재
  Date: 2023-08-19
  Time: 오후 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/admin-doctorInfo.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
    <title>doctorInfo</title>
</head>
<body>
<div class="form_container">
    <i class="uil uil-times form_close"></i>
    <div class="form doctor_form">
        <form method="POST" action="/api/v1/doctor/create" enctype="multipart/form-data">
            <h2>의사 추가</h2>
            <div class="input_box">
                <input type="text" name="doctorName" placeholder="의사이름을 입력해주세요." required />
                <i class="uil uil-user"></i>
            </div>
            <div class="input_box">
                <input type="text" name="doctorAverageTimeOfCare" placeholder="진료 평균 시간" required />
                <i class="uil uil-clock"></i>
            </div>
            <div class="input_box">
                <input type="file" id="doctor-image" name="file" accept=".png,.jpg" size="10000000"/>
                <i class="uil uil-user-square"></i>
            </div>
            <button class="button">의사 추가</button>
        </form>
    </div>
</div>
<div class="doctor-info-container">
    <i class="uil uil-times form_close2"></i>
    <div class="form doctor_form">
        <form method="POST" action="/api/v1/doctor/create" enctype="multipart/form-data">
            <h2>의사 정보 수정</h2>
            <img src="https://d338jhig5816rv.cloudfront.net/admin1">
            <div class="input_box">
                <input type="text" name="doctorName" readonly />
                <i class="uil uil-user"></i>
            </div>
            <div class="input_box">
                <input type="text" name="doctorAverageTimeOfCare" readonly />
                <i class="uil uil-clock"></i>
            </div>
            <div class="input_box">
                <input type="file" id="doctor-image-update" name="file" accept=".png,.jpg" size="10000000"/>
                <i class="uil uil-user-square"></i>
            </div>
            <button class="button-delete" onclick="deleteDoctor()">삭제</button>
            <button class="button-update" onclick="updateDoctor()">수정</button>
        </form>
    </div>
</div>
<h1>의사 선생님 정보</h1>
<div class="doctor-container">
    <div class="dotor-add-area">
        <i class="uil uil-plus"></i>
    </div>
</div>
<script src="/script/admin-doctorInfo.js"></script>
</body>
</html>
