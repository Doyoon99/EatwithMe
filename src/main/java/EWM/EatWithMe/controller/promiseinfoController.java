package EWM.EatWithMe.controller;

import EWM.EatWithMe.domain.Promisedata;
import EWM.EatWithMe.domain.Promiseinfodata;
import EWM.EatWithMe.domain.Storedata;
import EWM.EatWithMe.mapper.PromiseinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/promiseinfo")
public class promiseinfoController {

    @Autowired
    private PromiseinfoMapper promiseinfoMapper;

    @GetMapping("")
    public List<Promiseinfodata> getAll(){
        return promiseinfoMapper.getAll();
    }

    @PostMapping("")
    public Promiseinfodata post(@RequestBody Promiseinfodata promiseinfodata) {

        promiseinfoMapper.insert(promiseinfodata);

        return promiseinfodata;
    }




}
