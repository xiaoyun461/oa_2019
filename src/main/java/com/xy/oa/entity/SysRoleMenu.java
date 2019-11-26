package com.xy.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
public class SysRoleMenu extends Model<SysRoleMenu> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "role_menu_rel_id", type = IdType.AUTO)
    private Long roleMenuRelId;

    private Long roleId;

    private Long menuId;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


    public Long getRoleMenuRelId() {
        return roleMenuRelId;
    }

    public void setRoleMenuRelId(Long roleMenuRelId) {
        this.roleMenuRelId = roleMenuRelId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
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
        return this.roleMenuRelId;
    }

    @Override
    public String toString() {
        return "SysRoleMenu{" +
        "roleMenuRelId=" + roleMenuRelId +
        ", roleId=" + roleId +
        ", menuId=" + menuId +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
