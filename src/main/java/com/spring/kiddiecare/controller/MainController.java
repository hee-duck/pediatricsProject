package com.spring.kiddiecare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("join")
    public String join(){
        return "join";
    }

    @GetMapping("login")
    public String userLogin(){
        return "login";
    }
    @GetMapping("/admin/login")
    public String adminLogin(){return "adminLogin";}

    @GetMapping("admin/appointment")
    public String hospitalReservationForm() {
        return "hospitalAppointmentForm";
    }

}