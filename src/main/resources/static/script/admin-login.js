function checkValue(htmlForm) {
    const ID = htmlForm.adminId.value;
    const PW = htmlForm.adminPw.value;

    let check = true;

    console.log(ID);
    console.log(PW);

    if (ID === "") {
        $('#error-id').show();
        $('#user_email').focus();
        check = false;

    } else if (PW === "") {
        $('#error-password').show();
        $('#user_password').focus();//포커스 이동시켜서 다시 입력하라고
        check = false;

    }

    if (check === true) {
        console.log("dd")
        $.ajax({
            method: "POST",
            url: "/admin/login/check",
            data: { adminId: ID, adminPw: PW },
            dataType: "json",
            success: function(adminLogin) {
                console.log(adminLogin);
                if (adminLogin === "success") {
                    location.href = "/admin/appointment";
                } else {
                    alert('아이디와 비밀번호가 일치하지 않습니다.');
                }
            }
        });
    }

}