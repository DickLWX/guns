package cn.stylefeng.guns.modular.system.warpper;

import cn.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper;

import java.util.List;
import java.util.Map;

public class GetOrderWrapper extends BaseControllerWrapper {

    public GetOrderWrapper(List<Map<String, Object>> muti){
        super(muti);
    }

    @Override
    protected void wrapTheMap(Map<String, Object> map) {
        map.put("name", ConstantFactory.me().getUserNameById((Integer)map.get("userid")));
        map.put("passname", ConstantFactory.me().getUserNameById((Integer)map.get("adminid")));
    }
}
