package EWM.EatWithMe.mapper;

import EWM.EatWithMe.domain.Promiseinfodata;
import EWM.EatWithMe.domain.Storedata;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PromiseinfoMapper {
    @Insert("INSERT INTO promiseinfo(promise_id, promise_date, minpers, maxpers, starttime, endtime, title, detail, approve) VALUES(#{promiseinfo.promise_id}, #{promiseinfo.promise_date}, #{promiseinfo.minpers}, #{promiseinfo.maxpers}, #{promiseinfo.starttime}, #{promiseinfo.endtime}, #{promiseinfo.title}, #{promiseinfo.detail}, #{promiseinfo.approve})")
    int insert(@Param("promiseinfo") Promiseinfodata promiseinfodata);

    @Select("SELECT * FROM promiseinfo")

    @Results(id = "PromiseinfoMap", value = {
            @Result(property = "id", column = "promise_id"),
            @Result(property = "date", column = "promise_date"),
            @Result(property = "min", column = "minpers"),
            @Result(property = "max", column = "maxpers"),
            @Result(property = "start", column = "starttime"),
            @Result(property = "end", column = "endtime"),
            @Result(property = "title", column = "title"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "approve", column = "approve")
    })
    List<Storedata> getAll();

    @Select("SELECT * FROM promiseinfo WHERE promise_id=#{promise_id}")
    @ResultMap("PromiseinfoMap")
    Storedata getById(@Param("promise_id") int id);
}
