package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Orderapply;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 申请成为接单人 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2019-02-14
 */
public interface IOrderapplyService extends IService<Orderapply> {

    List<Map<String,Object>> selectOrderApply(Integer id);
}
