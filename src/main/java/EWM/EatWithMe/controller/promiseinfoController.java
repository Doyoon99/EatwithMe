package EWM.EatWithMe.controller;

import EWM.EatWithMe.domain.Promiseinfodata;
import EWM.EatWithMe.mapper.PromiseinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/promiseinfo")
public class promiseinfoController {

    @Autowired
    private PromiseinfoMapper promiseinfoMapper;

    @PostMapping("")
    public Promiseinfodata post(@RequestBody Promiseinfodata promiseinfo) {
        promiseinfoMapper.insert(promiseinfo);

        return promiseinfo;
    }

    @GetMapping("")
    public List<Promiseinfodata> getAll(){
        return promiseinfoMapper.getAll();
    }
}
