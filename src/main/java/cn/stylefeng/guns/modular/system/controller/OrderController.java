package cn.stylefeng.guns.modular.system.controller;

import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.core.shiro.ShiroUser;
import cn.stylefeng.guns.modular.system.service.IPlaceapplyService;
import cn.stylefeng.guns.modular.system.transfer.OrderDto;
import cn.stylefeng.guns.modular.system.warpper.OrderWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
import com.google.common.base.Objects;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import cn.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import cn.stylefeng.guns.modular.system.model.Order;
import cn.stylefeng.guns.modular.system.service.IOrderService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 订单控制器
 *
 * @author fengshuonan
 * @Date 2019-02-03 14:29:52
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    private String PREFIX = "/system/order/";

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IPlaceapplyService placeapplyService;

    /**
     * 跳转到订单首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "order.html";
    }

    /**
     * 跳转到添加订单
     */
    @RequestMapping("/order_add")
    public String orderAdd() {
        return PREFIX + "order_add.html";
    }

    /**
     * 跳转到修改订单
     */
    @RequestMapping("/order_update/{orderId}")
    public String orderUpdate(@PathVariable Integer orderId, Model model) {
        Order order = orderService.selectById(orderId);
        model.addAttribute("item",order);
        LogObjectHolder.me().set(order);
        return PREFIX + "order_edit.html";
    }

    /**
     * 获取订单列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> result = orderService.selectOrder();
        //return orderService.selectList(null);
        return new OrderWrapper(result).wrap();
    }

    /**
     * 新增订单
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(OrderDto orderDto) {
        Order order = new Order();
        BeanUtils.copyProperties(orderDto,order);
        ShiroUser user = ShiroKit.getUser();
        order.setUserid(user.getId());
        Integer placeId = placeapplyService.findPlaceIdByAddress(orderDto.getPlacename());
        if (!Objects.equal(placeId, null)) {
            order.setPlaceid(placeId);
            order.setCreatedate(new Date());
            orderService.insert(order);
        }
        return SUCCESS_TIP;
    }

    /**
     * 删除订单
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer orderId) {
        orderService.deleteById(orderId);
        return SUCCESS_TIP;
    }

    /**
     * 修改订单
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Order order) {
        orderService.updateById(order);
        return SUCCESS_TIP;
    }

    /**
     * 订单详情
     */
    @RequestMapping(value = "/detail/{orderId}")
    @ResponseBody
    public Object detail(@PathVariable("orderId") Integer orderId) {
        return orderService.selectById(orderId);
    }
}
