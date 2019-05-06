package cn.stylefeng.guns.modular.system.controller;

import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.core.shiro.ShiroUser;
import cn.stylefeng.guns.modular.system.service.IPlaceapplyService;
import cn.stylefeng.guns.modular.system.transfer.OrderApplyAddDto;
import cn.stylefeng.guns.modular.system.warpper.GetOrderWrapper;
import cn.stylefeng.guns.modular.system.warpper.OrderApplyListWraper;
import cn.stylefeng.guns.modular.system.warpper.OrderApplyWrapper;
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
import cn.stylefeng.guns.modular.system.model.Orderapply;
import cn.stylefeng.guns.modular.system.service.IOrderapplyService;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 接单人申请控制器
 *
 * @author fengshuonan
 * @Date 2019-02-14 09:36:04
 */
@Controller
@RequestMapping("/orderapply")
public class OrderapplyController extends BaseController {

    private String PREFIX = "/system/orderapply/";

    @Autowired
    private IOrderapplyService orderapplyService;

    @Autowired
    private IPlaceapplyService placeapplyService;

    /**
     * 跳转到接单人申请首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "orderapply.html";
    }

    /**
     * 跳转到添加接单人申请
     */
    @RequestMapping("/orderapply_add")
    public String orderapplyAdd() {
        return PREFIX + "orderapply_add.html";
    }

    /**
     * 跳转到接单人页面
     */
    @RequestMapping("/getorder")
    public String getOrder() {
        return PREFIX + "getorder.html";
    }

    @RequestMapping("/orderapplytolist")
    public String orderApplyToList() {
        return PREFIX + "orderapplylist.html";
    }

    /**
     * 获取接单人页面列表
     */
    @RequestMapping(value = "/getorder/list")
    @ResponseBody
    public Object getOrderlist(String condition) {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        Integer placeId = placeapplyService.selectPlaceIdByUserId(userId);
        if (Objects.equal(placeId, null)){
            return null;
        }
        List<Map<String, Object>> map = orderapplyService.selectGetOrderList(placeId);
        return new GetOrderWrapper(map).wrap();
    }

    @RequestMapping(value = "/orderapplylist")
    @ResponseBody
    public Object orderApplyList() {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        List<Map<String, Object>> result = orderapplyService.selectOrderAoolyListByUserId(userId);
        return new OrderApplyListWraper(result).wrap();
    }

    /**
     * 跳转到修改接单人申请
     */
    @RequestMapping("/orderapply_update/{orderapplyId}")
    public String orderapplyUpdate(@PathVariable Integer orderapplyId, Model model) {
        Orderapply orderapply = orderapplyService.selectById(orderapplyId);
        model.addAttribute("item",orderapply);
        LogObjectHolder.me().set(orderapply);
        return PREFIX + "orderapply_edit.html";
    }

    /**
     * 获取接单人申请列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        Integer placeId = placeapplyService.selectPlaceIdByUserId(userId);
        if (Objects.equal(placeId, null)){
            return null;
        }
        List<Map<String, Object>> map = orderapplyService.selectOrderApply(placeId);
        return new OrderApplyWrapper(map).wrap();
    }

    /**
     * 新增接单人申请
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(OrderApplyAddDto dto) {
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4])|(18[0-9])|(17[0-9])|(147))\\d{8}$");
        Matcher m = p.matcher(dto.getMobile());
        if (!m.matches()){
            //throw new Exception("手机号输出错误");
            return new ErrorResponseData("手机号输入错误");
        }
        Orderapply orderapply = new Orderapply();
        BeanUtils.copyProperties(dto,orderapply);
        ShiroUser user = ShiroKit.getUser();
        orderapply.setUserid(user.getId());
        orderapply.setStatus(0);
        orderapply.setCreatedate(new Date());
        orderapply.setDeleteflag(0);
        Integer placeId = placeapplyService.findPlaceIdByAddress(dto.getPlaceaddress());
        if (!Objects.equal(placeId, null)){
            if (orderapplyService.countOrderApplyByAddressAndUserId(user.getId(),placeId) >= 1){
                return new ErrorResponseData("您已是该快递点接单人");
            }
            orderapply.setPlaceid(placeId);
            orderapplyService.insert(orderapply);
        }else{
            return new ErrorResponseData("快递点不存在");
        }

        return SUCCESS_TIP;
    }

    /**
     * 删除接单人申请
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer orderapplyId) {
        orderapplyService.deleteById(orderapplyId);
        return SUCCESS_TIP;
    }

    /**
     * 修改接单人申请
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Orderapply orderapply) {
        orderapplyService.updateById(orderapply);
        return SUCCESS_TIP;
    }

    /**
     * 接单人申请详情
     */
    @RequestMapping(value = "/detail/{orderapplyId}")
    @ResponseBody
    public Object detail(@PathVariable("orderapplyId") Integer orderapplyId) {
        return orderapplyService.selectById(orderapplyId);
    }

    /**
     * 申请成为接单人通过或者拒绝
     */
    @RequestMapping(value = "/check")
    @ResponseBody
    public Object passApply(@RequestParam("orderApplyId")Integer orderApplyId, @RequestParam("status")Integer status) {
        Integer adminId = ShiroKit.getUser().getId();
        orderapplyService.passOrderApply(orderApplyId,adminId, status);
        return SUCCESS_TIP;
    }
}
