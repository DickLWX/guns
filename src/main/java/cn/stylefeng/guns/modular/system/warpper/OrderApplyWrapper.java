package cn.stylefeng.guns.modular.system.warpper;

import cn.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper;

import java.util.List;
import java.util.Map;

public class OrderApplyWrapper extends BaseControllerWrapper {

    public OrderApplyWrapper(List<Map<String, Object>> muti){
        super(muti);
    }

    @Override
    protected void wrapTheMap(Map<String, Object> map) {
        map.put("userName", ConstantFactory.me().getUserNameById((Integer)map.get("userid")));
    }

}
