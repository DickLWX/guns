package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Order;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author dick
 * @since 2019-02-03
 */
public interface IOrderService extends IService<Order> {
        List<Map<String,Object>> selectOrder();

        Integer selectReputation(Integer orderId);

        Integer selectScore(Integer orderId);

        Integer selectPlaceId(Integer orderId);

        Integer selectTempScore(Integer userId);

        Integer selectGrade(Integer userId);

        Integer isHasGetOrder(Integer userId,Integer placeId);

        void getOrder(Integer userId, Integer orderId);

        List<Map<String,Object>> getOrderList(Integer userId);

        List<Map<String,Object>> publishOrderList(Integer userId);

        Integer selectUserScore(Integer userId);

        Integer selectUserTempScore(Integer userId);

        void updateUserTempScore(Integer userId, Integer tempScore);

        Integer selectOrderGrade(Integer orderId);

        Integer selectOrderNum(Integer userId);

        Integer selectGetOrderNum(Integer userId);

        void finishOrder(Integer status,String content,Integer id);

        void updateUserScore(Integer score,Integer userId);

        Integer selectUserFlag(Integer userId);

        void updateGetOrderInfo(Integer userId,Integer orderNum, Integer grade);

        Integer selectOrderUserIdById(Integer orderId);

        void deleteOrder(Integer orderId);

}
