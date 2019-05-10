package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Applyordernum;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 接单人申请接单数表 服务类
 * </p>
 *
 */
public interface IApplyordernumService extends IService<Applyordernum> {

    List<Map<String, Object>> selectAllList();

    List<Map<String, Object>> selectListByUserId(Integer userId);

    void updateStatus(Integer id, Integer status, Integer adminId);

    Integer selectRoleIdByUserId(Integer userId);

    void updateGetOrder(Integer userId,Integer num);

}
