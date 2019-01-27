package cn.stylefeng.guns.core.enums;

public enum DeptEnum {

    ADMINISTRATOR(24, "超级管理员"),  CLIENT(25, "普通用户"), GETORDER(26, "接单人"), PLACE(27, "快递点");

    int code;

    String message;

    DeptEnum(int code,String message){
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
