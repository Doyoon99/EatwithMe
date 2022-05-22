package EWM.EatWithMe;

import lombok.Data;

@Data //lombok에서 자동으로 getter 와 setter를 만들도록 지정
public class Userdata {
    //private int idx;
    private String id;
    private String name;
    private String pw;
    private String school;
    private String googleId;
}
