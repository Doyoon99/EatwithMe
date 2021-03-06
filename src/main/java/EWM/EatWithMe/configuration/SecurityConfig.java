package EWM.EatWithMe.configuration;

import EWM.EatWithMe.service.userService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final userService userService;


    //규칙 설정
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                    .antMatchers("/signUp", "/login", "/accss_denied", "resources/**").permitAll()
                    .antMatchers("/userAccess").hasRole("USER")
                    .antMatchers("/userAccess").hasRole("ADMIN")
                    .and()

                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login_proc")
                    .usernameParameter("username") // 아이디 파라미터명 설정, default: username
                    .passwordParameter("password") // 패스워드 파라미터명 설정, default: password
                    .defaultSuccessUrl("/user_access")
                    .failureUrl("/access_denied")
                    .and()
                .csrf().disable();
    }

    //로그인 인증 처리 메소드
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
    }
}
