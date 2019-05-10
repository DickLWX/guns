package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Applyordernum;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 接单人申请接单数表 Mapper 接口
 * </p>
 *
 */
public interface ApplyordernumMapper extends BaseMapper<Applyordernum> {

    @Select("select * from sys_applyordernum where status = 0")
    List<Map<String, Object>> selectAllList();

    @Select("select * from sys_applyordernum where userid = #{userId}")
    List<Map<String, Object>> selectListByUserId(@Param("userId")Integer userId);

    @Update("update sys_applyordernum set adminid = #{adminId}, status = #{status}, reviewdate = now()")
    void updateStatus(@Param("id")Integer id, @Param("status")Integer status, @Param("adminId")Integer adminId);

    @Select("select roleid from sys_user where id = #{userId}")
    Integer selectRoleIdByUserId(@Param("userId")Integer userId);

    @Update("update sys_getorder set flag = 1, ordernum = #{num} where userid = #{userId}")
    void updateGetOrder(@Param("userId")Integer userId,@Param("num")Integer num);

}
