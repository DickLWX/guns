package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Placeapply;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 快递点申请表 Mapper 接口
 * </p>
 *
 */
public interface PlaceapplyMapper extends BaseMapper<Placeapply> {

    /*
       根据快递点地址列出快递点列表
    */
    List<Map<String, Object>> selectPlaceApply(@Param("address") String address, @Param("status") Integer status);

    /**
     * 通过快递点申请
     * @param placeApplyId
     * @param adminId
     */
    @Update("update sys_placeapply set status = #{status} , adminid = #{adminId}, reviewdate = now() where id = #{placeApplyId}")
    void passPlaceApply(@Param("placeApplyId") Integer placeApplyId, @Param("adminId") Integer adminId, @Param("status") Integer status);

    /*
        根据快递点申请表找到该条记录信息
     */
    @Select("select * from sys_placeapply where id = #{id}")
    Map<String,String> selectPlaceAppyById(@Param("id")Integer id);

    /*
        向快递点表插入信息
     */
    @Insert("insert into sys_place(userid, address, description, createdate, deleteflag) values(#{userId}, #{address}, #{description},now(),0)")
    void insertPlace(@Param("userId")Integer userId, @Param("address")String address, @Param("description")String description);

    /*
        更新快递点的删除字段 0：未删除 1：已删除
     */
    @Update("update sys_place set deleteflag = #{deleteFlag}")
    void deletePlace(@Param("deleteFlag")Integer deleteFlag);

    /*
        通过快递点地址找到快递点id
     */
    @Select("select id from sys_place where address = #{address} and deleteflag = 0")
    Integer selectPlaceId(@Param("address")String address);

    /*
        根据快递点id获得快递点地址
     */
    @Select("select address from sys_place where id = #{id} and deleteflag = 0")
    String selectPlaceAddressById(@Param("id")Integer id);

    /*
        获取所有快递点
     */
    @Select("select * from sys_place where deleteflag = 0")
    List<Map<String, String>> selectAllPlace();

    @Select("select id from sys_place where userid = #{userId} and deleteflag = 0")
    Integer selectPlaceIdByUserId(@Param("userId")Integer userId);

    @Select("select * from sys_placeapply where userid = #{userId} and deleteflag = 0")
    List<Map<String,Object>> getPlaceApplyList(@Param("userId")Integer userId);

    @Update("update sys_user set roleid = #{roleId} where id = #{userId}")
    void bePlace(@Param("userId")Integer userId,@Param("roleId")Integer roleId);

    @Select("select count(1) from sys_place where address = #{address}")
    Integer countPlaceAddress(@Param("address")String address);
}
