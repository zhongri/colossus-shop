package com.colossus.auth.shiro;

import com.colossus.common.model.AuthUser;
import org.apache.shiro.SecurityUtils;

import java.io.Serializable;

/**
 * @author Tlsy
 * @version commerce 0.0.1
 * @date 2017/4/20  15:22
 */
public class CustomPrincipal implements Serializable {

    private static final long serialVersionUID = -6047465617007852480L;

    private String id; // 编号
    private String phone; //手机
    private String userName; // 姓名
    private boolean mobileLogin; // 是否手机登录


    public CustomPrincipal(AuthUser user, boolean mobileLogin) {
        this.id = user.getId();
        this.phone = user.getPhone();
        this.userName = user.getUsername();
        this.mobileLogin = mobileLogin;
    }

    public String getId() {
        return id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public void setMobileLogin(boolean mobileLogin) {
        this.mobileLogin = mobileLogin;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean isMobileLogin() {
        return mobileLogin;
    }

    /**
     * 获取SESSIONID
     */
    public String getSessionid() {
        try{
            return (String) SecurityUtils.getSubject().getSession().getId();
        }catch (Exception e) {
            return "";
        }
    }

    @Override
    public String toString() {
        return id;
    }

}
