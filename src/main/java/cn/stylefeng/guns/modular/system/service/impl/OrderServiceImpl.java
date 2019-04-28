package cn.stylefeng.guns.modular.system.service.impl;

import cn.stylefeng.guns.modular.system.model.Order;
import cn.stylefeng.guns.modular.system.dao.OrderMapper;
import cn.stylefeng.guns.modular.system.service.IOrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author dick
 * @since 2019-02-03
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    @Override
    public List<Map<String, Object>> selectOrder() {
        return this.baseMapper.selectOrder();
    }

    @Override
    public Integer selectReputation(Integer orderId) {
        return this.baseMapper.selectReputation(orderId);
    }

    @Override
    public int selectScore(Integer orderId) {
        return this.baseMapper.selectScore(orderId);
    }

    @Override
    public int selectPlaceId(Integer orderId) {
        return this.baseMapper.selectPlaceId(orderId);
    }

    @Override
    public int selectTempScore(Integer userId) {
        return this.baseMapper.selectTempScore(userId);
    }

    @Override
    public int selectGrade(Integer userId) {
        return this.baseMapper.selectGrade(userId);
    }

    @Override
    public int isHasGetOrder(Integer userId, Integer placeId) {
        return this.baseMapper.isHasGetOrder(userId, placeId);
    }

    @Override
    public void getOrder(Integer userId, Integer orderId) {
        this.baseMapper.getOrder(userId, orderId);
    }

    @Override
    public List<Map<String,Object>> getOrderList(Integer userId) {
        return this.baseMapper.selectGetOrderList(userId);
    }

    @Override
    public List<Map<String, Object>> publishOrderList(Integer userId) {
        return this.baseMapper.selectPublishOrderList(userId);
    }

    @Override
    public Integer selectUserScore(Integer userId) {
        return this.baseMapper.selectUserScore(userId);
    }

    @Override
    public Integer selectUserTempScore(Integer userId) {
        return this.baseMapper.selectTempScore(userId);
    }

    @Override
    public void updateUserTempScore(Integer userId, Integer tempScore) {
        this.baseMapper.updateUserTempScore(userId,tempScore);
    }

    @Override
    public Integer selectOrderGrade(Integer orderId) {
        return this.baseMapper.selectOrderGrade(orderId);
    }

    @Override
    public Integer selectOrderNum(Integer userId) {
        return this.baseMapper.selectOrderNum(userId);
    }

    @Override
    public Integer selectGetOrderNum(Integer userId) {
        return this.baseMapper.selectGetOrderNum(userId);
    }

    @Override
    public void finishOrder(Integer status, String content, Integer id) {
        this.baseMapper.finishOrder(status, content, id);
    }

    @Override
    public void updateUserScore(Integer score, Integer userId) {
        this.baseMapper.updateUserScore(score, userId);
    }

    @Override
    public Integer selectUserFlag(Integer userId) {
        return this.baseMapper.selectUserFlag(userId);
    }

    @Override
    public void updateGetOrderInfo(Integer userId, Integer orderNum, Integer grade) {
        this.baseMapper.updateGetOrderInfo(userId,orderNum,grade);
    }
}
