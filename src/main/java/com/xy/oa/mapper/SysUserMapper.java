package com.xy.oa.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xy.oa.entity.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-24
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    Page<SysUser> pageByRoleId(Page page, @Param("roleId") Long roleId);

    Page<SysUser> pageNoAuthByRoleId(Page page, @Param("roleId") Long roleId, @Param("userName") String userName, @Param("datemin") String datemin, @Param("datemax") String datemax);
}
