package com.spring.kiddiecare.controller;

import com.spring.kiddiecare.domain.hospitalAdmin.Admin;
import com.spring.kiddiecare.domain.hospitalAdmin.AdminRepository;
import com.spring.kiddiecare.domain.hospitalAdmin.AdminRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@RequiredArgsConstructor
@Controller
@SessionAttributes({"log"}) // 세션을 사용하고 있다라는걸 바인딩 해줘야함
@RequestMapping("admin")
public class AdminLogController {

    private final AdminRepository adminRepository;

    @SessionScope
    @PostMapping(value = "login/check")
    public ModelAndView login(@ModelAttribute AdminRequestDto adminDto, WebRequest request) {
        boolean sessionIsNull = Optional.ofNullable(request.getAttribute("log", WebRequest.SCOPE_SESSION)).isEmpty();
        Optional<String> adminId = Optional.ofNullable(adminDto.getAdminId());
        Optional<String> adminPw = Optional.ofNullable(adminDto.getAdminPw());
        ModelAndView modelAndView = new ModelAndView();

        if (!sessionIsNull){
            return new ModelAndView("redirect:/");
        }

        if(adminId.isEmpty() || adminPw.isEmpty()){
            return new ModelAndView("redirect:/login");
        }

        Admin admin = adminRepository.findByAdminIdAndAdminPw(adminId.get(), adminPw.get());
        if (admin != null) {
            modelAndView.setViewName("redirect:/");
            modelAndView.addObject("log", admin.getAdminName());
            return modelAndView;
        } else {
            return new ModelAndView("redirect:/");
        }
    }

//    @SessionScope
//    @PostMapping(value = "login/check")
//    public ModelAndView login(@ModelAttribute AdminRequestDto adminDto, WebRequest request) {
//        return Optional.ofNullable(request.getAttribute("log", WebRequest.SCOPE_SESSION))
//                .filter(__ -> adminDto.getAdminId() != null && adminDto.getAdminPw() != null)
//                .map(__ -> adminRepository.findByAdminIdAndAdminPw(adminDto.getAdminId(), adminDto.getAdminPw()))
//                .map(admin -> {
//                    ModelAndView modelAndView = new ModelAndView("redirect:/");
//                    modelAndView.addObject("log", admin.getAdminName());
//                    return modelAndView;
//                })
//                .orElseGet(() -> {
//                    return new ModelAndView("redirect:/");
//                });
//    }

    @GetMapping("logout")
    public String logout(WebRequest request, SessionStatus status){ // 세션에 대한 권한을 준다. 없으면 remove가 실행되지 않는다.
        status.setComplete();
        request.removeAttribute("log",WebRequest.SCOPE_SESSION);// scope는 지정 되어있음
        return "redirect:/"; //약속된 키워드임 ㅇㅇ
    }
}
