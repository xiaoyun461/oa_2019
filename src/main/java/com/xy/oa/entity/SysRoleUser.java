package com.xy.oa.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;

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
public class SysRoleUser extends Model<SysRoleUser> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "role_user_rel_id", type = IdType.AUTO)
    private Long roleUserRelId;

    private Long roleId;

    private Long userId;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;


    public Long getRoleUserRelId() {
        return roleUserRelId;
    }

    public void setRoleUserRelId(Long roleUserRelId) {
        this.roleUserRelId = roleUserRelId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.roleUserRelId;
    }

    @Override
    public String toString() {
        return "SysRoleUser{" +
                "roleUserRelId=" + roleUserRelId +
                ", roleId=" + roleId +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }
}
