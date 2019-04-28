package cn.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户反馈表
 * </p>
 *
 * @author stylefeng
 * @since 2019-03-24
 */
@TableName("sys_feedback")
public class Feedback extends Model<Feedback> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户Id
     */
    private Integer userid;
    /**
     * 反馈内容
     */
    private String content;
    /**
     * 处理人id
     */
    private Integer adminId;
    /**
     * 回复内容
     */
    private String reviewcontent;
    /**
     * 创建时间
     */
    private Date createdate;
    /**
     * 回复时间
     */
    private Date reviewdate;
    /**
     * 0:未删除 1：删除
     */
    private Integer deleteflag;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getReviewcontent() {
        return reviewcontent;
    }

    public void setReviewcontent(String reviewcontent) {
        this.reviewcontent = reviewcontent;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getReviewdate() {
        return reviewdate;
    }

    public void setReviewdate(Date reviewdate) {
        this.reviewdate = reviewdate;
    }

    public Integer getDeleteflag() {
        return deleteflag;
    }

    public void setDeleteflag(Integer deleteflag) {
        this.deleteflag = deleteflag;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Feedback{" +
        ", id=" + id +
        ", userid=" + userid +
        ", content=" + content +
        ", adminId=" + adminId +
        ", reviewcontent=" + reviewcontent +
        ", createdate=" + createdate +
        ", reviewdate=" + reviewdate +
        ", deleteflag=" + deleteflag +
        "}";
    }
}
