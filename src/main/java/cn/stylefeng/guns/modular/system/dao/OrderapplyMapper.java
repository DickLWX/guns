package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Orderapply;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 申请成为接单人 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2019-02-14
 */
public interface OrderapplyMapper extends BaseMapper<Orderapply> {

    List<Map<String, Object>> selectOrderApply(@Param("id")Integer id);

    void passOrderApply(@Param("orderApplyId") Integer orderApplyId, @Param("adminId") Integer adminId, @Param("status") Integer status);

    List<Map<String, Object>> selectGetOrderList(@Param("id")Integer id);

}
