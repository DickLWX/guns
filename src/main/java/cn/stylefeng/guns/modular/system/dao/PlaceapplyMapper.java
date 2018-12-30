package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.Placeapply;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 快递点申请表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-11-12
 */
public interface PlaceapplyMapper extends BaseMapper<Placeapply> {

    /*
       根据快递点地址列出快递点列表
    */
    List<Map<String, Object>> selectPlaceApply(@Param("address") String address, @Param("status") Integer status);

    /**
     * 通过快递点申请
     * @param placeApplyId
     * @param adminId
     */
    @Update("update sys_placeapply set status = #{status} , adminid = #{adminId}, reviewdate = now() where id = #{placeApplyId}")
    void passPlaceApply(@Param("placeApplyId") Integer placeApplyId, @Param("adminId") Integer adminId, @Param("status") Integer status);

}
