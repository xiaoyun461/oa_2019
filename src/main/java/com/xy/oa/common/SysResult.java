package com.xy.oa.common;

import lombok.Data;

@Data
public class SysResult {

    public static final String ADD = "添加";
    public static final String DELETE = "删除";
    public static final String UPDATE = "增加";


    public static final String SUCCESS = "成功";
    public static final String ERROR = "失败";


    private boolean result;
    private String data;

    public static SysResult init(boolean result, String data) {
        SysResult sysResult = new SysResult();
        StringBuffer sb = new StringBuffer(data);
        if (result) {
            sysResult.setData(sb.append(SUCCESS).toString());
        } else {
            sysResult.setData(sb.append(ERROR).toString());
        }
        sysResult.setResult(result);
        return sysResult;
    }
}
