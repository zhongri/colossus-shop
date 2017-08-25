package com.colossus.auth.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * @author Tlsy
 * @version commerce 0.0.1
 * @date 2017/4/20  15:42
 */
public class CustomUsernamePasswordToken extends UsernamePasswordToken {
    private static final long serialVersionUID = 5441806005017171601L;

    private String captcha;
    private boolean mobileLogin;

    public CustomUsernamePasswordToken() {
        super();
    }

    public CustomUsernamePasswordToken(String username, char[] password,
                                 boolean rememberMe, String host, String captcha, boolean mobileLogin) {
        super(username, password, rememberMe, host);
        this.captcha = captcha;
        this.mobileLogin = mobileLogin;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public boolean isMobileLogin() {
        return mobileLogin;
    }
}
