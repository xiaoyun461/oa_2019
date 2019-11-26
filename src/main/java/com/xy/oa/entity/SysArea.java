package com.xy.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
public class SysArea extends Model<SysArea> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "area_id", type = IdType.AUTO)
    private Long areaId;

    private Long areaParentId;

    private String areaType;

    private String areaName;

    private String areaShortName;

    private String longitude;

    private String latitude;


    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public Long getAreaParentId() {
        return areaParentId;
    }

    public void setAreaParentId(Long areaParentId) {
        this.areaParentId = areaParentId;
    }

    public String getAreaType() {
        return areaType;
    }

    public void setAreaType(String areaType) {
        this.areaType = areaType;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaShortName() {
        return areaShortName;
    }

    public void setAreaShortName(String areaShortName) {
        this.areaShortName = areaShortName;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    @Override
    protected Serializable pkVal() {
        return this.areaId;
    }

    @Override
    public String toString() {
        return "SysArea{" +
        "areaId=" + areaId +
        ", areaParentId=" + areaParentId +
        ", areaType=" + areaType +
        ", areaName=" + areaName +
        ", areaShortName=" + areaShortName +
        ", longitude=" + longitude +
        ", latitude=" + latitude +
        "}";
    }
}
