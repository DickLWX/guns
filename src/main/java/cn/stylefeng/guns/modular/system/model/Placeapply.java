package cn.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 快递点申请表
 * </p>
 *
 * @author stylefeng
 * @since 2018-11-12
 */
@TableName("sys_placeapply")
public class Placeapply extends Model<Placeapply> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键Id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 申请人id
     */
    private Integer userid;
    /**
     * 快递点地址
     */
    private String address;
    /**
     * 快递点描述
     */
    private String description;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 申请说明
     */
    private String introduction;
    /**
     * 申请时间
     */
    private Date createdate;
    /**
     * 管理员id
     */
    private Integer adminid;
    /**
     * 审核时间
     */
    private Date reviewdate;
    /**
     * 状态1:未通过 2：通过
     */
    private Integer status;
    /**
     * 删除标记0：未删除1：删除
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public Date getReviewdate() {
        return reviewdate;
    }

    public void setReviewdate(Date reviewdate) {
        this.reviewdate = reviewdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
        return "Placeapply{" +
        ", id=" + id +
        ", userid=" + userid +
        ", address=" + address +
        ", description=" + description +
        ", mobile=" + mobile +
        ", introduction=" + introduction +
        ", createdate=" + createdate +
        ", adminid=" + adminid +
        ", reviewdate=" + reviewdate +
        ", status=" + status +
        ", deleteflag=" + deleteflag +
        "}";
    }
}
