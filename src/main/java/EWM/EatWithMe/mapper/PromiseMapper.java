package EWM.EatWithMe.mapper;

import EWM.EatWithMe.domain.Promisedata;
import EWM.EatWithMe.domain.Promiseinfodata;
import EWM.EatWithMe.domain.Storedata;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PromiseMapper {

    @Insert("INSERT INTO promise(user_id, store_id, promise_id) VALUES(#{promise.user_id}, #{promise.store_id}, #{promise.promise_id})")
    int insert(@Param("promise") Promisedata promisedata);

    @Select("SELECT * FROM promise")

    @Results(id = "PromiseMap", value = {
            @Result(property = "user_id", column = "user_id"),
            @Result(property = "store_id", column = "store_id"),
            @Result(property = "promise_id", column = "promise_id"),

    })
    List<Promisedata> getAll();

    @Select("SELECT * FROM promise WHERE promise_id=#{promise_id}")
    @ResultMap("PromiseMap")
    List<Promisedata> getById(@Param("promise_id") int promise_id);

}
