package EWM.EatWithMe.Controller;

import EWM.EatWithMe.Domain.Userdata;
import EWM.EatWithMe.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/userdata")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @PostMapping("")
    public Userdata post(@RequestBody Userdata userdata) {
        userMapper.insert(userdata);

        return userdata;
    }

    @GetMapping("")
    public List<Userdata> getAll(){
        return userMapper.getAll();
    }

    @GetMapping("/{user_id}")
    public Userdata getById(@PathVariable("user_id") int user_id){
        return userMapper.getById(user_id);
    }
}
