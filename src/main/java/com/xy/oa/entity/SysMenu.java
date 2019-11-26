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
public class SysMenu extends Model<SysMenu> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "menu_id", type = IdType.AUTO)
    private Long menuId;

    private Long menuParentId;

    private String menuName;

    private Integer menuType;

    private String menuPath;

    private String menuDesc;

    private Boolean isPublish;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public Long getMenuParentId() {
        return menuParentId;
    }

    public void setMenuParentId(Long menuParentId) {
        this.menuParentId = menuParentId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getMenuType() {
        return menuType;
    }

    public void setMenuType(Integer menuType) {
        this.menuType = menuType;
    }

    public String getMenuPath() {
        return menuPath;
    }

    public void setMenuPath(String menuPath) {
        this.menuPath = menuPath;
    }

    public String getMenuDesc() {
        return menuDesc;
    }

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    public Boolean getPublish() {
        return isPublish;
    }

    public void setPublish(Boolean isPublish) {
        this.isPublish = isPublish;
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
        return this.menuId;
    }

    @Override
    public String toString() {
        return "SysMenu{" +
        "menuId=" + menuId +
        ", menuParentId=" + menuParentId +
        ", menuName=" + menuName +
        ", menuType=" + menuType +
        ", menuPath=" + menuPath +
        ", menuDesc=" + menuDesc +
        ", isPublish=" + isPublish +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
