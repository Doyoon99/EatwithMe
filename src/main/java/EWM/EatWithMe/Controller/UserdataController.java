package EWM.EatWithMe.Controller;

import EWM.EatWithMe.Domain.Userdata;
import org.apache.catalina.User;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserdataController {
    private Map<String, Userdata> userMap;

    @PostConstruct
    public void init() {
        userMap = new HashMap<String, Userdata>();
        //key와 3개의 value값
        userMap.put("1", new Userdata("1", "홍길동", "gildong", "숙명여자대학교", "gildong"));
        userMap.put("2", new Userdata("2", "홍길자", "gilja", "숙명여자대학교", "gilja"));
        userMap.put("3", new Userdata("3", "홍길순", "gilsun", "숙명여자대학교", "gilsun"));
    }

    @GetMapping("/user/{id}")  //데이터를 조회할 때 사용함
    public Userdata getUserdata(@PathVariable("id") String id) {
        return userMap.get(id);
    }

    @GetMapping("/user/all")
    public List<Userdata> getUserdataList() {
        return new ArrayList<Userdata>(userMap.values());
    }

    @PutMapping("/user/{id}") //데이터를 삽입할 때 사용함
    public void putUserdata(@PathVariable("id") String id, @RequestParam("name") String name, @RequestParam("pw") String pw,
                            @RequestParam("school") String school, @RequestParam("googleID") String googleID) {
        Userdata userdata = new Userdata(id, name, pw, school, googleID);
        userMap.put(id, userdata);
    }

    @PostMapping("/user/{id}")
    public void postUserdata(@PathVariable("id") String id, @RequestParam("name") String name, @RequestParam("pw") String pw,
                             @RequestParam("school") String school, @RequestParam("googleID") String googleID) {
        Userdata userdata = userMap.get(id);
        userdata.setName(name);
        userdata.setPw(pw);
        userdata.setSchool(school);
        userdata.setGoogleId(googleID);
    }

    @DeleteMapping("/user/{id}")
    public void deleteUserProfile(@PathVariable("id") String id) {
        userMap.remove(id);
    }
}
