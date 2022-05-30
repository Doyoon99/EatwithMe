package EWM.EatWithMe.controller;


import EWM.EatWithMe.domain.Promisedata;
import EWM.EatWithMe.mapper.PromiseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController
@RequestMapping("/promise")
public class promiseController {

    @Autowired
    private PromiseMapper promiseMapper;

    @PostMapping("")
    public Promisedata post(@RequestBody Promisedata promisedata) {

        // 기존에 있는 데이터인지 확인하고, 기존에 존재하는 데이터이면 삭제하고 덮어쓰기.
        // 아니면 timestamp 받고 python에서 그냥 중복처리 해버리는것도 편할 듯.

        promiseMapper.insert(promisedata);

        return promisedata;
    }

    @GetMapping("")
    public List<Promisedata> getAll(){
        return promiseMapper.getAll();
    }

    @GetMapping("/{promise_id}")
    public List<Promisedata> getById(@PathVariable("promise_id") int promise_id){
        return promiseMapper.getById(promise_id);
    }
}
