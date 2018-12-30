package cn.stylefeng.guns.core.enums;

public enum PlaceApplyStatusEnum {

    WAIT(0,"待审核"),

    UNPASS(1,"未通过"),

    PASS(2,"通过");

    private int status;

    private String desc;

    PlaceApplyStatusEnum(int status, String desc){
        this.status = status;
        this.desc = desc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
