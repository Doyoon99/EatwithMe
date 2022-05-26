package EWM.EatWithMe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/prefer")
public class PreferController {
    @Autowired
    private PreferMapper preferMapper;

    @PostMapping("")
    public Preferdata post(@RequestBody Preferdata prefer) {
        
        // 기존에 있는 데이터인지 확인하고, 기존에 존재하는 데이터이면 삭제하고 덮어쓰기.
        // 아니면 timestamp 받고 python에서 그냥 중복처리 해버리는것도 편할 듯.

        preferMapper.insert(prefer);

        return prefer;
    }

    @GetMapping("")
    public List<Preferdata> getAll(){
        return preferMapper.getAll();
    }

    @GetMapping("/{user_id}")
    public Preferdata getById(@PathVariable("user_id") int user_id){
        return preferMapper.getById(user_id);
    }
}
