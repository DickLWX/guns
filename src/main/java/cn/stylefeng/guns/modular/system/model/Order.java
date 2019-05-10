package cn.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * <p>
 * 订单表
 * </p>
 *
 */
@TableName("sys_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单表主键Id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 发单人id
     */
    private Integer userid;
    /**
     * 快递点Id
     */
    private Integer placeid;

    /**
     * 接单人id
     */
    private Integer getid;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 送达地址
     */
    private String address;
    /**
     * 悬赏积分
     */
    private Integer score;
    /**
     * 货物尺寸
     */
    private String size;
    /**
     * 收件人名字
     */
    private String name;
    /**
     * 货物重量
     */
    private Integer weight;
    /**
     * 所需信誉积分
     */
    private Integer reputation;
    /**
     * 创建时间
     */
    private Date createdate;
    /**
     * 最迟期限
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date limitdate;
    /**
     * 订单完成时间
     */
    private Date finishdate;
    /**
     * 信誉分
     */
    private Integer grade;
    /**
     * 评论
     */
    private String content;
    /**
     * 订单状态0：未被接单 1：已接单 2：完成 3：超时
     */
    private Integer status;
    /**
     * 删除标记0:未删除 1:已删除
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

    public Integer getPlaceid() {
        return placeid;
    }

    public void setPlaceid(Integer placeid) {
        this.placeid = placeid;
    }

    public Integer getGetid() {
        return getid;
    }

    public void setGetid(Integer getid) {
        this.getid = getid;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Integer getReputation() {
        return reputation;
    }

    public void setReputation(Integer reputation) {
        this.reputation = reputation;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getLimitdate() {
        return limitdate;
    }

    public void setLimitdate(Date limitdate) {
        this.limitdate = limitdate;
    }

    public Date getFinishdate() {
        return finishdate;
    }

    public void setFinishdate(Date finishdate) {
        this.finishdate = finishdate;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
        return "Order{" +
        ", id=" + id +
        ", userid=" + userid +
        ", placeid=" + placeid +
        ", getid=" + getid +
        ", mobile=" + mobile +
        ", address=" + address +
        ", score=" + score +
        ", size=" + size +
        ", name=" + name +
        ", weight=" + weight +
        ", reputation=" + reputation +
        ", createdate=" + createdate +
        ", limitdate=" + limitdate +
        ", finishdate=" + finishdate +
        ", grade=" + grade +
        ", content=" + content +
        ", status=" + status +
        ", deleteflag=" + deleteflag +
        "}";
    }
}
