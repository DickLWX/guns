package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Order;
import com.baomidou.mybatisplus.service.IService;

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
}
