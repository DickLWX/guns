package cn.stylefeng.guns.modular.system.controller;

import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.core.shiro.ShiroUser;
import cn.stylefeng.guns.modular.system.dao.OrderMapper;
import cn.stylefeng.guns.modular.system.service.IPlaceapplyService;
import cn.stylefeng.guns.modular.system.transfer.OrderDto;
import cn.stylefeng.guns.modular.system.warpper.GetOrderListWrapper;
import cn.stylefeng.guns.modular.system.warpper.OrderWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.core.reqres.response.ErrorResponseData;
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

import java.beans.Transient;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    @RequestMapping("/getOrderListHtml")
    public String getOrderListHtml() {
        return PREFIX + "getorder.html";
    }

    @RequestMapping("/getPubilshOrderListHtml")
    public String getPublishOrderListHtml() {
        return PREFIX + "publishorder.html";
    }

    /**
     * 跳转到修改订单
     */
    @RequestMapping("/order_update/{orderId}")
    public String orderUpdate(@PathVariable Integer orderId, Model model) {
        Order order = orderService.selectById(orderId);
        model.addAttribute("item",order);
        LogObjectHolder.me().set(order);
        return PREFIX + "finishorder.html";
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

    @RequestMapping(value = "/getOrderList")
    @ResponseBody
    public Object getOrderList(String condition) {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        List<Map<String, Object>> result = orderService.getOrderList(userId);
        return new GetOrderListWrapper(result).wrap();
    }

    @RequestMapping(value = "/getPubilshList")
    @ResponseBody
    public Object getPublishList(String condition) {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        List<Map<String, Object>> result = orderService.publishOrderList(userId);
        return new GetOrderListWrapper(result).wrap();
    }


    /**
     * 接单
     */
    @RequestMapping(value = "/getOrder")
    @ResponseBody
    @Transient
    public Object getOrder(@RequestParam Integer orderId) {
        // 判断是否有足够的积分
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        Integer score = orderService.selectScore(orderId);
        Integer tempScore = orderService.selectTempScore(userId);
        Integer grade = orderService.selectGrade(userId);
        Integer reputation = orderService.selectReputation(orderId);
        Integer orderGrade = orderService.selectOrderGrade(orderId);
        Integer orderCount = orderService.selectOrderNum(userId);
        Integer getOrderCount = orderService.selectGetOrderNum(userId);
        if (tempScore - reputation < 0){
            return new ErrorResponseData("当前可用积分不够");
        }

        if (grade < orderGrade){
            return new ErrorResponseData("信誉分不够");
        }
        // 判断是否有足够的信誉积分
        Integer placeId = orderService.selectPlaceId(orderId);
        Integer count = orderService.isHasGetOrder(userId,placeId);
        if (Objects.equal(count,0)) {
            return new ErrorResponseData("您没有该快递点的接单权限");
        }
        if (getOrderCount + 1 > orderGrade){
            return new ErrorResponseData("您已达到接单上限！");
        }
        // 判断是否有当前快递点的权限
        orderService.getOrder(userId,orderId);
        // 判断当前是否还有接单数
        return SUCCESS_TIP;
    }



    /**
     * 新增订单
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(OrderDto orderDto) {
        if (Objects.equal(orderDto.getPlacename(),null)){
            return new ErrorResponseData("快递点为空");
        }
        if (Objects.equal(orderDto.getAddress(),null)){
            return new ErrorResponseData("收货地址为空");
        }
        if (Objects.equal(orderDto.getLimitdate(),null)){
            return new ErrorResponseData("最迟期限为空");
        }
        if (Objects.equal(orderDto.getMobile(),null)){
            return new ErrorResponseData("手机号为空");
        }
        if (Objects.equal(orderDto.getScore(),null)){
            return new ErrorResponseData("悬赏积分为空");
        }
        if (Objects.equal(orderDto.getSize(),null)){
            return new ErrorResponseData("货物尺寸为空");
        }
        if (Objects.equal(orderDto.getWeight(),null)){
            return new ErrorResponseData("货物重量为空");
        }
        if (Objects.equal(orderDto.getName(),null)){
            return new ErrorResponseData("收件人姓名为空");
        }
        if (Objects.equal(orderDto.getReputation(),null)){
            return new ErrorResponseData("所需保证积分为空");
        }
        if (Objects.equal(orderDto.getGrade(),null)){
            return new ErrorResponseData("所需信誉分为空");
        }
        if (!new Date().before(orderDto.getLimitdate())){
            return new ErrorResponseData("最迟期限错误");
        }
        Order order = new Order();
        BeanUtils.copyProperties(orderDto,order);
        ShiroUser user = ShiroKit.getUser();
        order.setUserid(user.getId());
        Integer placeId = placeapplyService.findPlaceIdByAddress(orderDto.getPlacename());
        Integer score = order.getScore();
        Integer userTempScore = orderService.selectUserTempScore(user.getId());
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4])|(18[0-9])|(17[0-9])|(147))\\d{8}$");
        Matcher m = p.matcher(order.getMobile());
        if (!m.matches()){
            return new ErrorResponseData("手机号输入错误");
        }
        if (score > userTempScore){
            return new ErrorResponseData("当前可用积分不足");
        }
        orderService.updateUserTempScore(user.getId(),userTempScore - score);
        if (!Objects.equal(placeId, null)) {
            order.setPlaceid(placeId);
            order.setCreatedate(new Date());
            orderService.insert(order);
        }else {
            return new ErrorResponseData("快递点不存在");
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
     * 确认收货
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    @Transient
    public Object update(Order order) {
        Integer content = getcontent(order.getContent());
        ShiroUser user = ShiroKit.getUser();
        Integer orderId = order.getId();
        Order orderReally = orderService.selectById(orderId);

        Integer userId = user.getId();
        Integer getId = orderReally.getGetid();
        Integer userScore = orderService.selectUserScore(userId);
        Integer userTempScore = orderService.selectUserTempScore(userId);
        Integer getScore = orderService.selectUserScore(getId);
        Integer getTempScore = orderService.selectTempScore(getId);
        Integer flag = orderService.selectUserFlag(getId);
        Integer orderNum = orderService.selectOrderNum(userId);
        Integer grade = orderService.selectGrade(getId);
        Integer reputation = orderService.selectReputation(orderId);

        Integer score = orderReally.getScore();

        Date currentTime = new Date();
        Date limitDate = orderReally.getLimitdate();
        if (currentTime.before(limitDate)){
            //没有超时
            if (Objects.equal(flag,0)){
                orderNum = getOrderNUm(grade + content);
            }
            orderService.finishOrder(2,order.getContent(),orderId);
            orderService.updateUserScore(userScore - score, userId);
            orderService.updateUserScore(getScore + score, getId);
            orderService.updateUserTempScore(getId, getTempScore + score);
            orderService.updateGetOrderInfo(getId,orderNum,grade + content);
        }else {
            if (Objects.equal(flag,0)){
                orderNum = getOrderNUm(grade + content);
            }
            orderService.finishOrder(3,order.getContent(),orderId);
            orderService.updateUserScore(getScore - reputation, getId);
            orderService.updateUserScore(userScore + reputation, userId);
            orderService.updateUserTempScore(userId, userTempScore + reputation);
            orderService.updateGetOrderInfo(getId,orderNum,grade + content);
        }

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

    public static Integer getcontent(String content){
        if (Objects.equal(content,"极差")){
            return -2;
        }
        if (Objects.equal(content,"差")){
            return -1;
        }
        if (Objects.equal(content,"一般")){
            return 0;
        }
        if (Objects.equal(content,"好")){
            return 1;
        }
        if (Objects.equal(content,"极好")){
            return 2;
        }
        return null;
    }

    public static Integer getOrderNUm(Integer grade){
        if (grade < 0){
            return 0;
        }
        if (grade == 0){
            return 1;
        }
        if (grade >= 1 && grade < 5){
            return 2;
        }
        if (grade >= 5 && grade < 10){
            return 3;
        }
        if (grade >= 10 && grade < 30){
            return 4;
        }
        if (grade >= 30 && grade < 60){
            return 5;
        }
        if (grade >= 60 && grade < 100){
            return 6;
        }
        if (grade >= 100 && grade < 200){
            return 7;
        }
        if (grade >= 200 && grade < 300){
            return 8;
        }
        if (grade >= 300 && grade < 500){
            return 9;
        }
        if (grade >= 500 && grade < 1000){
            return 10;
        }
        if (grade >= 1000 && grade < 4000){
            return 11;
        }
        if (grade >= 4000 && grade < 10000){
            return 12;
        }
        return 13;
    }
}
