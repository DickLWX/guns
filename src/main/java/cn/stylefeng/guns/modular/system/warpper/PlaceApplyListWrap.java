package cn.stylefeng.guns.modular.system.warpper;

import cn.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper;

import java.util.List;
import java.util.Map;

public class PlaceApplyListWrap extends BaseControllerWrapper {

    public PlaceApplyListWrap(List<Map<String, Object>> muti){
        super(muti);
    }

    @Override
    protected void wrapTheMap(Map<String, Object> map) {
        //map.put("address", ConstantFactory.me().getPlaceAddress((Integer)map.get("placeid")));
        map.put("statusname", ConstantFactory.me().getPlaceApplyList((Integer)map.get("status")));

    }
}
