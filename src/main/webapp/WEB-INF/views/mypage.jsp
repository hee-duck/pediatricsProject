<%--
  Created by IntelliJ IDEA.
  User: regul
  Date: 2023-08-10
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/mypage.css">
    <script src="/script/mypage.js"></script>
</head>
<c:import url="header.jsp"/>
<body>
    <div id="root">
        <aside id="sidebar">
            <div id="bar-header">
                <h2 id="h2-header">헤더</h2>
            </div>
            <div id="bar-nav">
                <ul id="ul-nav">
                    <li><div id="nav-user" name="div-user" onclick="sectionChange(this)">회원정보</div></li>
                    <li><div id="nav-children" name="div-children" onclick="sectionChange(this)">자녀관리</div></li>
                    <li><div id="nav-appo" name="div-appo" onclick="sectionChange(this)">예약내역</div></li>
                    <li><div id="nav-review" name="div-review" onclick="sectionChange(this)">후기관리</div></li>
                    <li><div id="nav-favor" name="div-favor" onclick="sectionChange(this)">찜한병원</div></li>
                </ul>
            </div>
        </aside>
        <section id="main-section">
            <div class="main-div" id="div-user">
                <p>유저</p>
                <div id="user">
                    <p>${user.name}</p>
                    <p>${user.email}</p>
                </div>
            </div>
            <div class="main-div" id="div-children">
                <p>자녀</p>
                <c:forEach items="${children}" var="child">
                    <p>이름 : ${child.name}</p>
                    <p>성별 : ${child.gender}</p>
                    <p>생년월일 : ${child.birth}</p>
                    <p>참고사항 : ${child.info}</p>
                </c:forEach>
                <div class="children">

                </div>
            </div>
            <div class="main-div" id="div-appo">
                <p>예약</p>
                <c:forEach items="${appointments}" var="appo">
                    <div class="appo">
                        <p>예약번호 : ${appo.no}</p>
                        <p>병원이름 : ${appo.hospital}</p>
                        <p>예약일정 : ${appo.date} ${appo.time}</p>
                        <p>담당의 : ${appo.doctor}</p>
                        <p>예약상태 : ${appo.appoStatus}</p>
                        <p>환자이름 : ${appo.name}</p>
                        <p>증상 : ${appo.symptom}</p>
                        <p>참고사항 : ${appo.note}</p>
                    </div>
                </c:forEach>
            </div>
            <div class="main-div" id="div-review">
                <p>후기</p>
            </div>
            <div class="main-div" id="div-favor">
                <p>찜</p>
            </div>
        </section>
    </div>
</body>
</html>
