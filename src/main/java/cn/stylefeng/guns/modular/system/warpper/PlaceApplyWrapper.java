package cn.stylefeng.guns.modular.system.warpper;

import cn.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import cn.stylefeng.guns.core.util.MagicUtil;
import cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper;
import cn.stylefeng.roses.core.util.ToolUtil;

import java.util.List;
import java.util.Map;

public class PlaceApplyWrapper extends BaseControllerWrapper {

    public PlaceApplyWrapper(List<Map<String, Object>> muti){
        super(muti);
    }

    @Override
    protected void wrapTheMap(Map<String, Object> map) {
        map.put("userName", ConstantFactory.me().getUserNameById((Integer) map.get("userid")));
        if (ToolUtil.isEmpty(map.get("adminid")) || map.get("adminid").equals(MagicUtil.ZERO)){
            map.put("adminName",MagicUtil.NO_VALUE_STRING);
        }else {
            map.put("adminName", ConstantFactory.me().getUserNameById((Integer) map.get("adminid")));
        }
        map.put("statusName", ConstantFactory.me().getPlaceApplyStatusName((Integer) map.get("status")));
    }
}
