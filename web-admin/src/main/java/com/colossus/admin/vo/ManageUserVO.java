package com.colossus.admin.vo;


import com.colossus.common.model.ManageUser;

import java.text.SimpleDateFormat;

/**
 * 后台用户展示VO
 *
 * @author xubin.
 * @create 2017-02-11 下午3:57
 */


public class ManageUserVO extends ManageUser {

    private static final long serialVersionUID = -4590381219897771467L;

    private String joinus;

    public String getJoinus() {

        SimpleDateFormat format = new SimpleDateFormat("yyyy MM");

        return format.format(this.getCreateTime()).toString() + "加入公司";
    }


}
