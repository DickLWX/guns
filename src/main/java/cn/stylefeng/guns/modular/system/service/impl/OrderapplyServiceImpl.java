package cn.stylefeng.guns.modular.system.service.impl;

import cn.stylefeng.guns.modular.system.model.Orderapply;
import cn.stylefeng.guns.modular.system.dao.OrderapplyMapper;
import cn.stylefeng.guns.modular.system.service.IOrderapplyService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 申请成为接单人 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2019-02-14
 */
@Service
public class OrderapplyServiceImpl extends ServiceImpl<OrderapplyMapper, Orderapply> implements IOrderapplyService {

    @Override
    public List<Map<String, Object>> selectOrderApply(Integer id) {
        return this.baseMapper.selectOrderApply(id);
    }
}
