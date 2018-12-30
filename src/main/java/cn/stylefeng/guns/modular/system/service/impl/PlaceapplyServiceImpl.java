package cn.stylefeng.guns.modular.system.service.impl;

import cn.stylefeng.guns.modular.system.model.Placeapply;
import cn.stylefeng.guns.modular.system.dao.PlaceapplyMapper;
import cn.stylefeng.guns.modular.system.service.IPlaceapplyService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 快递点申请表 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-11-12
 */
@Service
public class PlaceapplyServiceImpl extends ServiceImpl<PlaceapplyMapper, Placeapply> implements IPlaceapplyService {

    @Override
    public List<Map<String, Object>> selectPlaceApply(String address, Integer status) {
        return this.baseMapper.selectPlaceApply(address, status);
    }

    /**
     * 通过快递点申请
     * @param placeApplyId
     * @param adminId
     */
    @Override
    public void passPlaceApply(Integer placeApplyId, Integer adminId, Integer status) {
        this.baseMapper.passPlaceApply(placeApplyId, adminId, status);
    }
}
