package EWM.EatWithMe.mapper;

import EWM.EatWithMe.domain.Storedata;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface StoreMapper {

    @Insert("INSERT INTO store(store_id, store_name, category, address, phonenumber) VALUES(#{store.id}, #{store.name}, #{store.category}, #{store.address}, #{store.number})")
    int insert(@Param("store") Storedata store);

    @Select("SELECT * FROM store")

    @Results(id = "StoreMap", value = {
            @Result(property = "id", column = "store_id"),
            @Result(property = "name", column = "store_name"),
            @Result(property = "category", column = "category"),
            @Result(property = "address", column = "address"),
            @Result(property = "number", column = "phonenumber")
    })
    List<Storedata> getAll();

    @Select("SELECT * FROM store WHERE store_id=#{store_id}")
    @ResultMap("StoreMap")
    Storedata getById(@Param("store_id") int id);

    @Select("SELECT * FROM store ORDER BY RAND() LIMIT 15")
    @ResultMap("StoreMap")
    List<Storedata> storeRandom();

}
