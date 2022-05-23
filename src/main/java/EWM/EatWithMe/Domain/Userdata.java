package EWM.EatWithMe.Domain;

import lombok.Data;

@Data //lombok에서 자동으로 getter 와 setter를 만들도록 지정
public class Userdata {
    //private int idx;
    private String id;
    private String name;
    private String pw;
    private String school;
    private String googleId;
    private String appendDate;
    private String updateDate;

    public Userdata(String id, String name, String pw, String school, String googleId) {
        this.id = id;
        this.name = name;
        this.pw = pw;
        this.school = school;
        this.googleId = googleId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }
}