package EWM.EatWithMe.service;

import EWM.EatWithMe.mapper.UserMapper;
import EWM.EatWithMe.domain.Userdata;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;


@Service
@RequiredArgsConstructor
public class userService implements UserDetailsService {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:sss");
    Date time = new Date();
    String localTime = format.format(time);

    @Autowired
    UserMapper userMapper;

    @Transactional
    public void joinUser(Userdata userdata) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        userdata.setPw((passwordEncoder.encode(userdata.getPw())));
        userdata.setUserAuth("USER");
        userdata.setAppendDate(localTime);
        userdata.setUpdateDate(localTime);
//        userMapper.saveUser(userdata);
        userMapper.insert(userdata);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //여기서 받은 유저 패스워드와 비교하여서 로그인 인증
//        System.out.println(username);
        Userdata useraccount = userMapper.getUserAccount(username);
        if (useraccount == null) {
            throw new UsernameNotFoundException("User not authorized");
        }
        System.out.println(useraccount.getId());

//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        !passwordEncoder.encode(userdata.getPw()).equals(useraccount.getPassword()) {
//            throw new UsernameNotFoundException("비밀번호가 틀렸습니다.");
//        }

        return useraccount;
    }
}
