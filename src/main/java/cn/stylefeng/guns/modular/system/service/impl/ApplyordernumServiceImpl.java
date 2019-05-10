package cn.stylefeng.guns.modular.system.service.impl;

import cn.stylefeng.guns.modular.system.model.Applyordernum;
import cn.stylefeng.guns.modular.system.dao.ApplyordernumMapper;
import cn.stylefeng.guns.modular.system.service.IApplyordernumService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 接单人申请接单数表 服务实现类
 * </p>
 *
 */
@Service
public class ApplyordernumServiceImpl extends ServiceImpl<ApplyordernumMapper, Applyordernum> implements IApplyordernumService {

    @Override
    public List<Map<String, Object>> selectAllList() {
        return this.baseMapper.selectAllList();
    }

    @Override
    public List<Map<String, Object>> selectListByUserId(Integer userId) {
        return this.baseMapper.selectListByUserId(userId);
    }

    @Override
    public void updateStatus(Integer id, Integer status, Integer adminId) {
        this.baseMapper.updateStatus(id, status, adminId);
    }

    @Override
    public Integer selectRoleIdByUserId(Integer userId) {
        return this.baseMapper.selectRoleIdByUserId(userId);
    }

    @Override
    public void updateGetOrder(Integer userId, Integer num) {
        this.baseMapper.updateGetOrder(userId, num);
    }
}
