package cn.stylefeng.guns.modular.system.service.impl;

import cn.stylefeng.guns.modular.system.model.Feedback;
import cn.stylefeng.guns.modular.system.dao.FeedbackMapper;
import cn.stylefeng.guns.modular.system.service.IFeedbackService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户反馈表 服务实现类
 * </p>
 *
 */
@Service
public class FeedbackServiceImpl extends ServiceImpl<FeedbackMapper, Feedback> implements IFeedbackService {

    @Override
    public Integer selectUserRoleId(Integer userId) {
        return this.baseMapper.selectUserRoleId(userId);
    }

    @Override
    public List<Map<String, Object>> selectListByuserId(Integer userId) {
        return this.baseMapper.selectListByuserId(userId);
    }

    @Override
    public List<Map<String, Object>> selectList() {
        return this.baseMapper.selectList();
    }

    @Override
    public Feedback selectFeedBackById(Integer id) {
        return this.baseMapper.selectFeedBackById(id);
    }

    @Override
    public void updateFeedBack(Integer id, Integer adminId, String content) {
         this.baseMapper.updateFeedBack(id, adminId, content);
    }
}
