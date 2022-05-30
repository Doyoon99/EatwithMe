package EWM.EatWithMe.controller;

import EWM.EatWithMe.domain.Storedata;
import EWM.EatWithMe.mapper.PromiseinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/promiseinfo")
public class promiseinfoController {

    @Autowired
    private PromiseinfoMapper promiseinfoMapper;

    @GetMapping("")
    public List<Storedata> getAll(){
        return promiseinfoMapper.getAll();
    }




}
