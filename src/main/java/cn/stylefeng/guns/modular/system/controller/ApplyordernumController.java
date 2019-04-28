package cn.stylefeng.guns.modular.system.controller;

import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.core.shiro.ShiroUser;
import cn.stylefeng.guns.modular.system.warpper.ApplyordernumServiceWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.core.reqres.response.ErrorResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import cn.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import cn.stylefeng.guns.modular.system.model.Applyordernum;
import cn.stylefeng.guns.modular.system.service.IApplyordernumService;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 接单数申请控制器
 *
 * @author fengshuonan
 * @Date 2019-03-26 21:26:57
 */
@Controller
@RequestMapping("/applyordernum")
public class ApplyordernumController extends BaseController {

    private String PREFIX = "/system/applyordernum/";

    @Autowired
    private IApplyordernumService applyordernumService;

    /**
     * 跳转到接单数申请首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "applyordernum.html";
    }

    /**
     * 跳转到添加接单数申请
     */
    @RequestMapping("/applyordernum_add")
    public String applyordernumAdd() {
        return PREFIX + "applyordernum_add.html";
    }

    /**
     * 跳转到修改接单数申请
     */
    @RequestMapping("/applyordernum_update/{applyordernumId}")
    public String applyordernumUpdate(@PathVariable Integer applyordernumId, Model model) {
        Applyordernum applyordernum = applyordernumService.selectById(applyordernumId);
        model.addAttribute("item",applyordernum);
        LogObjectHolder.me().set(applyordernum);
        return PREFIX + "applyordernum_edit.html";
    }

    /**
     * 获取接单数申请列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        ShiroUser user = ShiroKit.getUser();
        Integer roleId = applyordernumService.selectRoleIdByUserId(user.getId());
        List<Map<String, Object>> result = new ArrayList<>();
        if (Objects.equals(roleId,1)){
            result = applyordernumService.selectAllList();
        }else {
            result = applyordernumService.selectListByUserId(user.getId());
        }
        return new ApplyordernumServiceWrapper(result).wrap();
    }

    /**
     * 新增接单数申请
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Applyordernum applyordernum) {
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4])|(18[0-9])|(17[0-9])|(147))\\d{8}$");
        Matcher m = p.matcher(applyordernum.getMobile());
        if (!m.matches()){
            return new ErrorResponseData("手机号输入错误");
        }
        applyordernum.setUserid(ShiroKit.getUser().getId());
        applyordernum.setCreatedate(new Date());
        applyordernumService.insert(applyordernum);
        return SUCCESS_TIP;
    }

    /**
     * 删除接单数申请
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer applyordernumId) {
        applyordernumService.deleteById(applyordernumId);
        return SUCCESS_TIP;
    }

    /**
     * 修改接单数申请
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(@RequestParam Integer applyordernumId, @RequestParam Integer status) {
        ShiroUser user = ShiroKit.getUser();
        Applyordernum applyordernum = applyordernumService.selectById(applyordernumId);
        applyordernumService.updateStatus(applyordernum.getId(),status,user.getId());
        if (Objects.equals(status, 2)) {
            applyordernumService.updateGetOrder(applyordernum.getUserid(), applyordernum.getApplynum());
        }
        return SUCCESS_TIP;
    }

    /**
     * 接单数申请详情
     */
    @RequestMapping(value = "/detail/{applyordernumId}")
    @ResponseBody
    public Object detail(@PathVariable("applyordernumId") Integer applyordernumId) {
        return applyordernumService.selectById(applyordernumId);
    }
}
