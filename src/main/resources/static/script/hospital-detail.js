window.onload = function () {
    getHospInfoDetail();
    buildCalendar();
}

let nowMonth = new Date();
let today = new Date();
today.setHours(0, 0, 0, 0);

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣기
function buildCalendar() {
    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);

    let tbody_Calendar = document.querySelector(".Calendar > tbody");
    console.log("nowMonth : " + nowMonth.getFullYear());

    document.getElementById("calYear").innerText = nowMonth.getFullYear();
    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);

    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
        nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력


        if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
            nowColumn.style.color = "#DC143C";
        }
        if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
            nowColumn.style.color = "#0000CD";
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
        }


        if (nowDay < today) {                       // 지난날인 경우
            nowColumn.className = "pastDay";
        } else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
            nowColumn.className = "today";
            nowColumn.onclick = function () {
                choiceDate(this);
            }
        } else {                                      // 미래인 경우
            nowColumn.className = "futureDay";
            nowColumn.onclick = function () {
                choiceDate(this);
            }
        }
    }
}

// 날짜 선택, 각 날짜의 timeSlots
let selectDate = null; // 날짜 저장 (Date 타입)
let selectDay = null;   // 요일 저장 (String 타입)
let formattedDate = null;

function choiceDate(nowColumn) {
    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면

        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
    }
    nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
    // 클릭된 날짜 및 요일 저장

    selectDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), parseInt(nowColumn.innerText)); // 선택된 날짜 저장
    let dayNames = ["일", "월", "화", "수", "목", "금", "토"];
    selectDay = dayNames[selectDate.getDay()]; // 선택된 요일 저장
    formattedDate = selectDate.getFullYear() + "-" + leftPad(selectDate.getMonth() + 1) + "-" + leftPad(selectDate.getDate());  // --> 선택된 날짜: Thu Aug 17 2023 00:00:00 GMT+0900 (한국 표준시) 값 변경

    console.log("선택된 날짜:", formattedDate);  // String
    console.log("선택된 요일:", selectDay);

    document.querySelector('.time-slots-table').style.display = 'block';        // css

    let ykiho = document.getElementById("hospital-name").getAttribute("ykiho");
    console.log("ykiho : ", ykiho);

    $.ajax({
        url: "/timeSlotsDateGetByYkiho",
        method: "GET",
        data: {
            ykiho: ykiho,
            date: selectDate
        }
    }).done(res => {
        console.log(res);
        console.log(res.slots);
        res.slots.forEach(slot => {

            // 이제 slot.date ... 필요한거 받아와서 화면에 처리
        })
    }

    ).fail(function() {
        console.error("timeSlotsGet");
    });
}

// 화면에 나타내기
// function updateAvailableTimeSlots(data) {
//     const timeSlotsTable = document.querySelector('.time-slots-table');
//     let timeSlotsContent = '<h2 class="time-slots-info">예약 가능 타임 테이블</h2>';
//
//     data.forEach(timeSlot => {
//         timeSlotsContent += `
//             <div class="time-slot-card">
//                 <div class="time-slot-content">
//                     ${timeSlot.time} (${timeSlot.count}/${timeSlot.enable})
//                 </div>
//             </div>
//         `;
//     });
//
//     timeSlotsTable.innerHTML = timeSlotsContent;
// }

// 이전달 버튼 클릭
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    buildCalendar();    // 달력 다시 생성
}

// 다음달 버튼 클릭
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    buildCalendar();    // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}

// document.getElementById("booking-btn").onclick = function() {
//     let ykiho = this.getAttribute("data-ykiho");
//     location.href = `/appointment/booking?ykiho=${ykiho}&treatmentDate=${formattedDate}&treatmentDay=${selectDay}`;
// }

function getHospInfoDetail(){
    const url = window.location.href;
    const ykiho = url.split('ykiho=')[1].split('&')[0];
    $.ajax({
        method: 'GET',
        url: `/hospital/detail?ykiho=${ykiho}`,
    }).done(res => {
        console.log(res)
    })
}