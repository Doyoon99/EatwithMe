package EWM.EatWithMe.Service;

import EWM.EatWithMe.Domain.Userdata;
import EWM.EatWithMe.UserMapper;
import lombok.RequiredArgsConstructor;
import org.aspectj.weaver.BCException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
@RequiredArgsConstructor
public class UserService {
    SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:sss");
    Date time = new Date();
    String localTime = format.format(time);

    @Autowired
    UserMapper userMapper;

    @Transactional
    public void joinUser(Userdata userdata){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        userdata.setPw(passwordEncoder.encode(userdata.getPw()));
        userdata.setAppendDate(localTime);
        userdata.setUpdateDate(localTime);
        userMapper.saveUser(userdata);
    }
}
