package cn.stylefeng.guns.modular.system.service.impl;

import cn.stylefeng.guns.core.enums.PlaceApplyStatusEnum;
import cn.stylefeng.guns.modular.system.model.Orderapply;
import cn.stylefeng.guns.modular.system.dao.OrderapplyMapper;
import cn.stylefeng.guns.modular.system.service.IOrderapplyService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.base.Objects;
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

    /*
        快递点通过获拒绝接单人申请
     */
    @Override
    public void passOrderApply(Integer orderApplyId, Integer adminId, Integer status) {
        // 如果成功，需要修改用户类型为接单人
        if (Objects.equal(status, 2)){
            //通过
            this.baseMapper.passOrderApply(orderApplyId, adminId, status);
            // 更改用户角色
        }
        if (Objects.equal(status, 1)){
            this.baseMapper.passOrderApply(orderApplyId, adminId, status);
            //拒绝
        }
    }

    /**
     * 获得指定快递点已经拥有的接单人
     * @param id
     * @return
     */
    @Override
    public List<Map<String, Object>> selectGetOrderList(Integer id) {
        return this.baseMapper.selectGetOrderList(id);
    }
}
