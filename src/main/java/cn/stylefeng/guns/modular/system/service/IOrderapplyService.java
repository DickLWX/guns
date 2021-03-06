package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Orderapply;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 申请成为接单人 服务类
 * </p>
 *
 */
public interface IOrderapplyService extends IService<Orderapply> {

    List<Map<String,Object>> selectOrderApply(Integer id);

    void passOrderApply(Integer orderApplyId, Integer adminId, Integer status);

    List<Map<String, Object>> selectGetOrderList(Integer id);

    List<Map<String, Object>> selectOrderAoolyListByUserId(Integer userId);

    Integer countOrderApplyByAddressAndUserId(Integer userId, Integer placeId);
}
