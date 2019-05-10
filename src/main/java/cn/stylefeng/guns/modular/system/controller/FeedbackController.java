package cn.stylefeng.guns.modular.system.controller;

import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.core.shiro.ShiroUser;
import cn.stylefeng.guns.core.util.NoticeUtil;
import cn.stylefeng.guns.core.util.SensitiveWordUtil;
import cn.stylefeng.roses.core.base.controller.BaseController;
import com.google.common.base.Objects;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import cn.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import cn.stylefeng.guns.modular.system.model.Feedback;
import cn.stylefeng.guns.modular.system.service.IFeedbackService;

import java.io.IOException;
import java.util.Date;

/**
 * feedback控制器
 *
 */
@Controller
@RequestMapping("/feedback")
public class FeedbackController extends BaseController {

    private String PREFIX = "/system/feedback/";

    @Autowired
    private IFeedbackService feedbackService;

    /**
     * 跳转到feedback首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "feedback.html";
    }

    /**
     * 跳转到添加feedback
     */
    @RequestMapping("/feedback_add")
    public String feedbackAdd() {
        return PREFIX + "feedback_add.html";
    }

    /**
     * 跳转到修改feedback
     */
    @RequestMapping("/feedback_update/{feedbackId}")
    public String feedbackUpdate(@PathVariable Integer feedbackId, Model model) {
        Feedback feedback = feedbackService.selectFeedBackById(feedbackId);
        model.addAttribute("item",feedback);
        LogObjectHolder.me().set(feedback);
        return PREFIX + "feedback_edit.html";
    }

    /**
     * 获取feedback列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        Integer roleId = feedbackService.selectUserRoleId(userId);
        if (Objects.equal(roleId,1)){
            return feedbackService.selectList();
        }
        return feedbackService.selectListByuserId(userId);
    }

    /**
     * 新增feedback
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Feedback feedback) throws IOException {
        ShiroUser user = ShiroKit.getUser();
        feedback.setUserid(user.getId());
        feedback.setCreatedate(new Date());
        //SensitiveWordUtil.init();
        String word = SensitiveWordUtil.replaceSensitiveWord(feedback.getContent(), '*');
        feedback.setContent(word);
        feedbackService.insert(feedback);
        //NoticeUtil.InsertNotice("意见反馈","意见反馈成功",ShiroKit.getUser().getId());
        return SUCCESS_TIP;
    }


    /**
     * 删除feedback
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer feedbackId) {
        feedbackService.deleteById(feedbackId);
        return SUCCESS_TIP;
    }

    /**
     * 修改feedback
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Feedback feedback) throws IOException {
        ShiroUser user = ShiroKit.getUser();
        Integer userId = user.getId();
        feedback.setAdminId(userId);
        feedback.setReviewdate(new Date());
       // SensitiveWordUtil.init();
        String word = SensitiveWordUtil.replaceSensitiveWord(feedback.getReviewcontent(), '*');
        feedback.setReviewcontent(word);
        feedbackService.updateFeedBack(feedback.getId(),userId,feedback.getReviewcontent());
        return SUCCESS_TIP;
    }

    /**
     * feedback详情
     */
    @RequestMapping(value = "/detail/{feedbackId}")
    @ResponseBody
    public Object detail(@PathVariable("feedbackId") Integer feedbackId) {
        return feedbackService.selectById(feedbackId);
    }
}
