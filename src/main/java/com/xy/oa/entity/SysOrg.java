package com.xy.oa.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
@Data
public class SysOrg extends Model<SysOrg> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "org_id", type = IdType.AUTO)
    private Long orgId;

    private Long orgParentId;

    private String orgParentName;

    private String orgName;

    private String orgDesc;
    @TableLogic
    private Boolean flag;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
