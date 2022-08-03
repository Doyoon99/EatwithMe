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

    @PostMapping("")
    public boolean post(@RequestBody Preferdata prefer) {

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
