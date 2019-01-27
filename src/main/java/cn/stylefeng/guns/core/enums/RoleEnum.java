package cn.stylefeng.guns.core.enums;

public enum RoleEnum {
    ADMINISTRATOR(1, "超级管理员"),  CLIENT(5, "普通用户"), GETORDER(6, "接单人"), PLACE(7, "快递点");

    int code;
    String message;

    RoleEnum(int code, String message) {
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
