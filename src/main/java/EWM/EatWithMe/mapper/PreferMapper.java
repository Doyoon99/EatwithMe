package EWM.EatWithMe.mapper;

import EWM.EatWithMe.domain.Preferdata;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PreferMapper {
    @Insert("INSERT INTO prefer(user_id, store_id, rating) VALUES(#{prefer.user_id}, #{prefer.store_id}, #{prefer.rating})")
    int insert(@Param("prefer") Preferdata prefer);

    @Select("SELECT * FROM prefer")

    @Results(id = "PreferMap", value = {
            @Result(property = "user_id", column = "user_id"),
            @Result(property = "store_id", column = "store_id"),
            @Result(property = "rating", column = "rating")
    })
    List<Preferdata> getAll();

    @Select("SELECT * FROM prefer WHERE user_id=#{user_id}")
    @ResultMap("PreferMap")
    Preferdata getById(@Param("user_id") int user_id);
}
