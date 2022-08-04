package EWM.EatWithMe.controller;

import EWM.EatWithMe.FlaskResponseDto;
import EWM.EatWithMe.domain.Storedata;
import EWM.EatWithMe.mapper.StoreMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/store")
public class StoreController {
    @Autowired
    private StoreMapper storeMapper;

    @PostMapping("")
    public Storedata post(@RequestBody Storedata store) {
        storeMapper.insert(store);

        return store;
    }

    @GetMapping("")
    public List<Storedata> getAll(){
        return storeMapper.getAll();
    }

    @GetMapping("/{store_id}")
    public Storedata getById(@PathVariable("store_id") int store_id){
        return storeMapper.getById(store_id);
    }

    @GetMapping("/random")
    public FlaskResponseDto getRandom() {return new FlaskResponseDto(storeMapper.storeRandom());}


}
