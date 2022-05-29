package EWM.EatWithMe.controller;

import EWM.EatWithMe.domain.Userdata;
import EWM.EatWithMe.service.userService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class signupController {
    @Autowired
    userService userService;

    //login으로 redirect
    @GetMapping
    public String root() {
        return "redirect:/login";
    }

    @GetMapping("/")
    public String home(){
        return "signup";
    }

    //회원가입 폼
    @GetMapping("/signup")
    public String signUpForm() {
        return "signup";
    }

    //login 폼
    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/login_proc")
    public String loginAccess(Userdata userdata) {
        return "redirect:/user_access";
    }

    //로그인 실패 폼
    @GetMapping("/access_denied")
    public String accessDenied() {
        return "access_denied";
    }

    //회원가입 진행
    @PostMapping("/signup")
    public String signUp(Userdata userdata) {
        userService.joinUser(userdata);
        return "redirect:/login";
    }

    //유저 페이지
    @GetMapping("/user_access")
    public String userAccess(Model model, Authentication authentication) {
        Userdata userdata = (Userdata) authentication.getPrincipal();
        model.addAttribute("info", userdata.getUsername() + " : " + userdata.getName()+ "님");
        return "user_access";
    }

}
