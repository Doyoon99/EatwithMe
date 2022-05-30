package EWM.EatWithMe.mapper;

import EWM.EatWithMe.domain.Userdata;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Insert("INSERT INTO userdata(user_id, user_name, user_pw, school, google_id, USER_AUTH, APPEND_DATE, UPDATE_DATE) VALUES(#{userdata.id}, #{userdata.name}, #{userdata.pw}, #{userdata.school}, #{userdata.googleId}, #{userdata.userAuth}, #{userdata.appendDate}, #{userdata.updateDate})")
    //@Options(useGeneratedKeys = true, keyProperty = "idx")
    int insert(@Param("userdata") Userdata userdata);
    // sql insert 구문은 입력이 성공하면 입력된 데이터의 개수를 반환한다.
    // 따라서 입력이 성공하면 1, 아니면 0이 반환되게 된다.

    // @Options : 데이터를 전송하여 db에 insert 할 때 return값을 입력한 값으로 지정하고 싶을 때, name, address는 입력값을 return받을 수 있지만
    //            id의 경우 sql문이 입력된 후에 반환받을 수 있다. 따라서 별도의 옵션 지정이 필요하다.
    //            위에 처럼 입력을 하면 자동 생성된 id값이 자바 객체에 입력되어 생성되게 된다.


    @Select("SELECT * FROM userdata")
    @Results(id = "UserMap", value = {
            //@Result(property = "idx", column = "idx"),
            @Result(property = "id", column = "user_id"),
            @Result(property = "name", column = "user_name"),
            @Result(property = "pw", column = "user_pw"),
            @Result(property = "school", column = "school"),
            @Result(property = "googleId", column = "google_id"),
            @Result(property = "userAuth", column = "USER_AUTH"),
            @Result(property = "appendDate", column = "APPEND_DATE"),
            @Result(property = "updateDate", column = "UPDATE_DATE")
    })
    List<Userdata> getAll();
    // user table에 있는 모든 내용을 list로 반환함
    // @Results : 자바 객체의 property(속성) 이름과 db table의 column name을 mapping 해주어야 함.
    // id의 경우 자바 객체와 db에서의 이름이 같기 때문에 따로 설정을 해주지 않아도 알아서 mapping 된다.
    // Results 재활용 id = "UserMap"

    @Select("SELECT * FROM userdata WHERE user_id=#{user_id}")
    @ResultMap("UserMap")
    Userdata getById(@Param("user_id") int id);

    @Select("SELECT * FROM userdata WHERE user_id=#{user_id}")
    @ResultMap("UserMap")
    Userdata getUserAccount(String id);

    void saveUser(Userdata userdata);

}
