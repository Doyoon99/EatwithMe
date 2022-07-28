package EWM.EatWithMe.controller;

import EWM.EatWithMe.domain.Promiseinfodata;
import EWM.EatWithMe.domain.Userdata;
import EWM.EatWithMe.mapper.PromiseinfoMapper;
import EWM.EatWithMe.mapper.UserMapper;
import EWM.EatWithMe.service.userService;

import lombok.Data;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
public class ewmController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PromiseinfoMapper promiseinfoMapper;

    //TEST API
    @GetMapping("/api/test")
    @ResponseBody
    public Userdata userTest() {
        return userService.testUser();
    }

    //메인화면 API
    @GetMapping("/api/welcome")
    @ResponseBody
    public String apiWelcome(@RequestParam String id, @RequestParam String pw) { return "Welcome" + id + pw;}

    //회원가입 API
    @GetMapping("/api/signUp")
    @ResponseBody
    public String apiSignUp(@RequestParam String id, @RequestParam String name, @RequestParam String pw, @RequestParam String school) {
        return "성공 " + id + " " + name + " " + pw + " " + school;
    }

    //로그인 API
    @GetMapping("/api/login")
    @ResponseBody
    public String apiLogin(@RequestParam String id, @RequestParam String pw) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        Userdata useraccount = userMapper.getUserAccount(id);

        if (useraccount == null) {
            return "실패";
        }

        if (!(passwordEncoder.matches(pw, useraccount.getPassword()))) {
            return "실패";
        }

        return "성공 " + id + " " + pw;
    }

    //선택한 약속 정보 하나씩 가져오는 API
    @GetMapping("/api/matching")
    @ResponseBody
    public Promiseinfodata apiMatching(@RequestParam int promiseId) {
        Promiseinfodata promiseinfodata = promiseinfoMapper.getById(promiseId);
        return promiseinfodata;
    }

    //선택한 약속 정보 전부 가져오는 API
    @GetMapping("/api/promise")
    @ResponseBody
    public List<Promiseinfodata> apiPromise() {
        return promiseinfoMapper.getAll();
    }

    //약속 정보 등록 API
    @GetMapping("/api/register")
    @ResponseBody
    public Promiseinfodata promise(@RequestParam String date, @RequestParam int min, @RequestParam int max, @RequestParam String start, @RequestParam String end, @RequestParam String title, @RequestParam String detail) {
        Promiseinfodata promiseinfodata = new Promiseinfodata();
        promiseinfodata.setDate(date);
        promiseinfodata.setMin(min);
        promiseinfodata.setMax(max);
        promiseinfodata.setStart(start);
        promiseinfodata.setEnd(end);
        promiseinfodata.setTitle(title);
        promiseinfodata.setDetail(detail);

        //promiseinfoMapper.insert(promiseinfodata);

        return promiseinfodata;
    }
}
