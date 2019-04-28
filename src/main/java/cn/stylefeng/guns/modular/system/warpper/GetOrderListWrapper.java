package cn.stylefeng.guns.modular.system.warpper;

import cn.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper;

import java.util.List;
import java.util.Map;

public class GetOrderListWrapper extends BaseControllerWrapper {

    public GetOrderListWrapper(List<Map<String, Object>> muti){
        super(muti);
    }

    @Override
    protected void wrapTheMap(Map<String, Object> map) {
        map.put("name", ConstantFactory.me().getUserNameById((Integer)map.get("userid")));
        map.put("status", ConstantFactory.me().getOrderStatus((Integer)map.get("status")));
        map.put("placename", ConstantFactory.me().getPlaceAddress((Integer)map.get("placeid")));
    }
}
