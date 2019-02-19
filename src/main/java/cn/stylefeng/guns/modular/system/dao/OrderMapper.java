package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Order;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单表 Mapper 接口
 * </p>
 *
 * @author dick
 * @since 2019-02-03
 */
public interface OrderMapper extends BaseMapper<Order> {

    List<Map<String,Object>> selectOrder();
}
