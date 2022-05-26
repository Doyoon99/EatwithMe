package EWM.EatWithMe.configuration;

import EWM.EatWithMe.service.userService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebFluxSecurity
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final userService userService;


    //규칙 설정
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                    .antMatchers("/login", "/signUp", "/accss_denied", "resources/**").permitAll()
                    .antMatchers("/userAccess").hasRole("USER")
                    .antMatchers("/userAccess").hasRole("ADMIN")
                    .and()

                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login_proc")
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
