package EWM.EatWithMe.controller;

import EWM.EatWithMe.mapper.PreferMapper;
import EWM.EatWithMe.domain.Preferdata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/prefer")
public class PreferController {
    @Autowired
    private PreferMapper preferMapper;

    @GetMapping("/save")
    public boolean post(@RequestParam String user_id, @RequestParam int store_id, @RequestParam int rating) {

        Preferdata prefer = new Preferdata();
        prefer.setUser_id(user_id);
        prefer.setStore_id(store_id);
        prefer.setRating(rating);

        preferMapper.insert(prefer);

        return true;
    }

    @GetMapping("")
    public List<Preferdata> getAll(){
        return preferMapper.getAll();
    }

    @GetMapping("/{user_id}")
    public List<Preferdata> getById(@PathVariable("user_id") int user_id){
        return preferMapper.getById(user_id);
    }
}
