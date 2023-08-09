package com.spring.kiddiecare.controller;


import com.spring.kiddiecare.domain.hospital.AppoRepository;
import com.spring.kiddiecare.domain.hospital.AppoRequestDto;
import com.spring.kiddiecare.domain.hospital.Appointment;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static com.spring.kiddiecare.util.RandomUtil.createRanNum;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/admin/appo")
public class AppointmentController {

    private final AppoRepository appoRepository;


    @PostMapping(value = "write", consumes = {"application/json"})
    public Map wrtie(@RequestBody AppoRequestDto appoDto) {
        JSONObject json = new JSONObject();

        int randNumber = Integer.parseInt(createRanNum());

        appoDto.setNo(randNumber);
        appoDto.setPatientId(1);
        appoDto.setGuardian(1);
        appoDto.setTimeSlotNo(1);
        appoDto.setSymptom("");

        System.out.println(appoDto);
        Appointment appo = new Appointment(appoDto);
        appoRepository.save(appo);

        json.put("write", "success");

        return json.toMap();
    }


}
