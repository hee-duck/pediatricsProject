<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: regul
  Date: 2023-08-15
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/script/postcode.js"></script>
    <script src="/script/user-update.js"></script>
</head>
<c:import url="header.jsp"/>
<body>
<div class="container">
    <section id="main-section">
        <div id="form">
            <div id="div-id">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" value="${user.id}" readonly>
            </div>
<%--            <div id="div-pw">--%>
<%--                <label for="password">비밀번호</label>--%>
<%--                <input type="password" id="password" name="password">--%>
<%--            </div>--%>
            <div id="div-pw-new">
                <label for="password-new">새 비밀번호</label>
                <input type="password" id="password-new" name="password-new">
            </div>
            <div id="div-pwChk">
                <label for="passwordChk">비밀번호확인</label>
                <input type="password" id="passwordChk" name="passwordChk">
                <button id="pw-update" onclick="passwordUpdate()">비밀번호 변경</button>
            </div>
            <div id="div-name">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="${user.name}" readonly>
            </div>
            <div id="div-birth">
                <label for="birth">생년월일</label>
                <input type="text" id="birth" name="birth" value="${user.birth}" readonly>
            </div>
            <div id="div-phone">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" value="${user.phone}">
                <button id="send" onclick="sendCode()">인증번호발송</button>
            </div>
            <div id="div-code">
                <input type="text" id="code" name="code">
                <button id="verify" onclick="verify()">인증하기</button>
                <button id="phone-update" onclick="phoneUpdate()">전화번호 변경</button>
            </div>
            <div id="div-email">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${user.email}">
                <button id="email-update" onclick="emailUpdate()">이메일 변경</button>
            </div>

            <div class="form-group">
                <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1"
                       id="addr1" value="${user.postcode}" type="text" readonly="readonly">
                <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i>
                    우편번호 찾기
                </button>
            </div>
            <div class="form-group">
                <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" value="${user.addr}" type="text"
                       readonly="readonly"/>
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" value="${user.addr_detail}" type="text"/>
                <button id="addr-update" onclick="addrUpdate()">주소 변경</button>
            </div>

        </div>
    </section>
</div>
</body>
</html>
