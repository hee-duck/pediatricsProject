<%-- 병원 상세페이지에서 예약하기 버튼을 클릭하고 예약 정보를 입력하는 페이지 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사용자 예약 페이지</title>
    <style>
        .term-title {
            cursor: pointer;
            /*background-color: #f5f5f5;*/
            /*padding: 10px;*/
            border: 1px solid #e5e5e5;
            margin: 0;
        }

        .term-content {
            border: 1px solid #e5e5e5;
            /*padding: 10px;*/
            margin-top: -1px;
        }

        .children-card {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }

        .children-card h4 {
            margin-top: 0;
        }

        .children-card p {
            margin-bottom: 10px;
        }

        .children-card .select-children {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/script/user-booking.js"></script>
</head>
<c:import url="header.jsp"></c:import>
<body>
<h3>진료예약</h3>

<form action="/reserve" method="post">
    <p>병원명</p>
    <input type="text" id="hospitalName" value="${hospitalName}" readonly>
    <p>진료날짜</p>
    <input type="text" id="treatmentDate" value="${param.treatmentDate}" readonly>
    <p>진료일</p>
    <input type="text" id="treatmentDay" value="${param.treatmentDay}" readonly>
    <p>진료시간</p>
    <input type="text" id="treatmentTime" value="${param.slotTime}" readonly>
    <p>보호자명</p>
    <input type="text" id="guardian" value=${userName} readonly>
    <input type="hidden" id="parentId" value="${parentId}" />
    <p>자녀정보</p>
    <div id="childrenContainer"></div>
    <p>증상</p>
    <input type="text" id="symptom" value="symptom">
    <p>참고사항</p>
    <input type="text" id="note" value="note"><br/>

    <div class="form-area">
        <h4>약관동의</h4>
        <div class="term-section">
            <h5 class="term-title">(필수) 이용약관 <button class="view-btn">보기</button></h5>
            <div class="term-content">
                <c:import url="userTerm.jsp"></c:import>
            </div>
            <input type="checkbox" id="userTerm" required> 동의
        </div>
        <div class="term-section">
            <h5 class="term-title">(필수) 개인정보처리방침 <button class="view-btn">보기</button></h5>
            <div class="term-content">
                <c:import url="privacyTerm.jsp"></c:import>
            </div>
            <input type="checkbox" id="privacyTerm" required> 동의
        </div>
        <div class="term-section">
            <h5 class="term-title">(필수) 위치기반서비스 이용약관 <button class="view-btn">보기</button></h5>
            <div class="term-content">
                <c:import url="locationTerm.jsp"></c:import>
            </div>
            <input type="checkbox" id="locationTerm" required> 동의
        </div>
    </div>

    <input type="submit" id="payBtn" value="결제하기 패스하고 예약꽂기">
</form>
</body>
</html>