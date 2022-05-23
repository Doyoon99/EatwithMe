package EWM.EatWithMe.Controller;

import EWM.EatWithMe.Domain.Userdata;
import EWM.EatWithMe.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class SignupController {
    @Autowired
    UserService userService;

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
