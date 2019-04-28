package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.system.model.Placeapply;
import com.baomidou.mybatisplus.service.IService;
import io.swagger.models.auth.In;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 快递点申请表 服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-11-12
 */
public interface IPlaceapplyService extends IService<Placeapply> {

    /*
        根据快递点地址列出快递点列表
     */
    List<Map<String, Object>> selectPlaceApply( String address, Integer status);

    /*
        通过快递点申请
     */
    void passPlaceApply(Integer placeApplyId, Integer adminId, Integer status);

    Integer findPlaceIdByAddress(String address);

    List<Map<String,String>> selectAllPlace();

    Integer selectPlaceIdByUserId(Integer userId);

    List<Map<String,Object>> getPlaceApplyList(Integer userId);
}
