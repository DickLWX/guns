package cn.stylefeng.guns.core.util;

import cn.stylefeng.guns.modular.system.dao.NoticeMapper;
import cn.stylefeng.guns.modular.system.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeUtil {


    private static INoticeService noticeService;

    @Autowired
    public void setNoticeService(INoticeService noticeService) {
        this.noticeService = noticeService;
    }

    public static void InsertNotice(String title, String content, Integer aim){
        noticeService.insertNotice(title, content, aim);
    }
}
