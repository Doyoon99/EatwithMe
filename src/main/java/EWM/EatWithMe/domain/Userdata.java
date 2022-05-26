package EWM.EatWithMe.domain;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

@Data //lombok에서 자동으로 getter 와 setter를 만들도록 지정
public class Userdata implements UserDetails {
    //private int idx;
    private String id;
    private String name;
    private String pw;
    private String school;
    private String googleId;
    private String userAuth;
    private String appendDate;
    private String updateDate;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority(this.userAuth));
    }

    @Override
    public String getPassword() {
        return this.pw;
    }

    //security의 id
    @Override
    public String getUsername() {
        return this.id;
    }

    //Userdata의 name
    public String getName() {
        return this.name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
