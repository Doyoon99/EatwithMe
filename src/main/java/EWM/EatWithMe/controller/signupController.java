package EWM.EatWithMe.controller;

import EWM.EatWithMe.domain.Userdata;
import EWM.EatWithMe.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

public class signupController {
    @Autowired
    userService userService;

    //회원가입 폼
    @GetMapping("/signUp")
    public String signUpForm() {
        return "signup";
    }

    //회원가입 진행
    @PostMapping("/signUp")
    public String signUp(Userdata userdata) {
        userService.joinUser(userdata);
        return "redirect:/login";
    }

}
