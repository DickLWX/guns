package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Feedback;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户反馈表 服务类
 * </p>
 *
 */
public interface IFeedbackService extends IService<Feedback> {

    Integer selectUserRoleId(Integer userId);

    List<Map<String, Object>> selectListByuserId(Integer userId);

    List<Map<String, Object>> selectList();

    Feedback selectFeedBackById(Integer id);

    void updateFeedBack(Integer id, Integer adminId, String content);

}
