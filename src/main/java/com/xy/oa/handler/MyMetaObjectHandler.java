package com.xy.oa.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;

import java.time.LocalDateTime;

public class MyMetaObjectHandler implements MetaObjectHandler {

    private static final String CREATE_TIME = "createTime";
    private static final String UPDATE_TIME = "updateTime";
    private static final String FLAG = "flag";

    @Override
    public void insertFill(MetaObject metaObject) {
        //避免使用metaObject.setValue()
        if (null == this.getFieldValByName(CREATE_TIME, metaObject))
            timeHandler(metaObject, CREATE_TIME);
        timeHandler(metaObject, UPDATE_TIME);
        if (null == this.getFieldValByName(FLAG, metaObject))
            this.setFieldValByName(FLAG, true, metaObject);

    }

    private void timeHandler(MetaObject metaObject, String updateTime) {
        this.setFieldValByName(updateTime, LocalDateTime.now(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        timeHandler(metaObject, UPDATE_TIME);
    }
}
