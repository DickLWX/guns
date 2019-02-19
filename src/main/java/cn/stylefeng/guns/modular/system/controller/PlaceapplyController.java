package cn.stylefeng.guns.modular.system.controller;

import cn.stylefeng.guns.core.enums.PlaceApplyStatusEnum;
import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.modular.system.warpper.PlaceApplyWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import cn.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import cn.stylefeng.guns.modular.system.model.Placeapply;
import cn.stylefeng.guns.modular.system.service.IPlaceapplyService;

import java.util.List;
import java.util.Map;

/**
 * 快递点申请控制器
 *
 * @author fengshuonan
 * @Date 2018-11-12 21:32:42
 */
@Controller
@RequestMapping("/placeapply")
public class PlaceapplyController extends BaseController {

    private String PREFIX = "/system/placeapply/";

    @Autowired
    private IPlaceapplyService placeapplyService;

    /**
     * 跳转到快递点申请首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "placeapply.html";
    }

    /**
     * 跳转到快递点信息页
     */
    @RequestMapping("/place")
    public String placeindex() {
        return PREFIX + "place.html";
    }

    /**
     * 跳转到添加快递点申请
     */
    @RequestMapping("/placeapply_add")
    public String placeapplyAdd() {
        return PREFIX + "placeapply_add.html";
    }

    /**
     * 跳转到修改快递点申请
     */
    @RequestMapping("/placeapply_update/{placeapplyId}")
    public String placeapplyUpdate(@PathVariable Integer placeapplyId, Model model) {
        Placeapply placeapply = placeapplyService.selectById(placeapplyId);
        model.addAttribute("item",placeapply);
        LogObjectHolder.me().set(placeapply);
        return PREFIX + "placeapply_edit.html";
    }

    /**
     * 获取快递点申请列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String address, @RequestParam(required = false) Integer status) {
        List<Map<String, Object>> result = placeapplyService.selectPlaceApply(address, PlaceApplyStatusEnum.WAIT.getStatus());
        return new PlaceApplyWrapper(result).wrap();
    }

    /**
     * 获取快递点列表
     */
    @RequestMapping(value = "/place/list")
    @ResponseBody
    public Object placeList(@RequestParam(required = false) String address, @RequestParam(required = false) Integer status) {
        return placeapplyService.selectAllPlace();
    }

    /**
     * 新增快递点申请
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Placeapply placeapply) {
        placeapplyService.insert(placeapply);
        return SUCCESS_TIP;
    }

    /**
     * 删除快递点申请
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer placeapplyId) {
        placeapplyService.deleteById(placeapplyId);
        return SUCCESS_TIP;
    }

    /**
     * 修改快递点申请
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Placeapply placeapply) {
        placeapplyService.updateById(placeapply);
        return SUCCESS_TIP;
    }

    /**
     * 快递点申请详情
     */
    @RequestMapping(value = "/detail/{placeapplyId}")
    @ResponseBody
    public Object detail(@PathVariable("placeapplyId") Integer placeapplyId) {
        return placeapplyService.selectById(placeapplyId);
    }

    /**
     * 快递点申请通过
     */
    @RequestMapping(value = "/check")
    @ResponseBody
    public Object passApply(@RequestParam("placeapplyId")Integer placeapplyId, @RequestParam("status")Integer status) {
        Integer adminId = ShiroKit.getUser().getId();
        placeapplyService.passPlaceApply(placeapplyId, adminId, status);
        return SUCCESS_TIP;
    }
}
