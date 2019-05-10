package cn.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 申请成为接单人
 * </p>
 *
 */
@TableName("sys_orderapply")
public class Orderapply extends Model<Orderapply> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 快递点id
     */
    private Integer placeid;
    /**
     * 申请人id
     */
    private Integer userid;
    /**
     * 申请说明
     */
    private String introduction;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 状态0：未通过1：通过
     */
    private Integer status;
    /**
     * 管理员id
     */
    private Integer adminid;
    /**
     * 创建时间
     */
    private Date createdate;
    /**
     * 审核时间
     */
    private Date reviewdate;
    /**
     * 删除标志0：未删除1：删除
     */
    private Integer deleteflag;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPlaceid() {
        return placeid;
    }

    public void setPlaceid(Integer placeid) {
        this.placeid = placeid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
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
        return "Orderapply{" +
        ", id=" + id +
        ", placeid=" + placeid +
        ", userid=" + userid +
        ", introduction=" + introduction +
        ", mobile=" + mobile +
        ", status=" + status +
        ", adminid=" + adminid +
        ", createdate=" + createdate +
        ", reviewdate=" + reviewdate +
        ", deleteflag=" + deleteflag +
        "}";
    }
}
