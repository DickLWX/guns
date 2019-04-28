package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Feedback;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户反馈表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-24
 */
public interface FeedbackMapper extends BaseMapper<Feedback> {

    @Select("select roleid from sys_user where id = #{userId}")
    Integer selectUserRoleId(@Param("userId") Integer userId);

    @Select("select * from sys_feedback where userid = #{userId}")
    List<Map<String, Object>> selectListByuserId(@Param("userId")Integer userId);

    @Select("select * from sys_feedback")
    List<Map<String, Object>> selectList();

    @Select("select * from sys_feedback where id = #{id}")
    Feedback selectFeedBackById(@Param("id")Integer id);

    @Update("update sys_feedback set adminId = #{adminId}, reviewcontent = #{reviewcontent} where id = #{id}")
    void updateFeedBack(@Param("id")Integer id, @Param("adminId")Integer adminId, @Param("reviewcontent")String content);

}
