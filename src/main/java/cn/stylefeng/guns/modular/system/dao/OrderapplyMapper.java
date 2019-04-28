package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Orderapply;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 申请成为接单人 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2019-02-14
 */
public interface OrderapplyMapper extends BaseMapper<Orderapply> {

    List<Map<String, Object>> selectOrderApply(@Param("id")Integer id);

    void passOrderApply(@Param("orderApplyId") Integer orderApplyId, @Param("adminId") Integer adminId, @Param("status") Integer status);

    List<Map<String, Object>> selectGetOrderList(@Param("id")Integer id);

    @Select("select * from sys_orderapply where userid = #{userId} and deleteflag = 0")
    List<Map<String, Object>> selectOrderAoolyListByUserId(@Param("userId")Integer userId);

    @Update("update sys_user set roleid = #{roleId} where id = #{userId}")
    void beGetOrder(@Param("userId")Integer userId,@Param("roleId")Integer roleId);

    @Select("select userid from sys_orderapply where id = #{id}")
    Integer getUserIdById(@Param("id")Integer id);

    @Insert("Insert into sys_getorder(userid,ordernum,grade) values(#{userId},3,10)")
    void initGetOrder(@Param("userId")Integer userId);



}
