package cn.stylefeng.guns.modular.system.transfer;

import cn.stylefeng.guns.modular.system.model.User;

public class UserInfoDto extends User {

    private Integer version;

    private Integer score;

    private Integer tempScore;

    private Integer grade;

    private Integer orderNum;

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getTempScore() {
        return tempScore;
    }

    public void setTempScore(Integer tempScore) {
        this.tempScore = tempScore;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }
}
