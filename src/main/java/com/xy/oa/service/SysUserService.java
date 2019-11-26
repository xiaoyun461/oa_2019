package com.xy.oa.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xy.oa.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-24
 */
public interface SysUserService extends IService<SysUser> {

    Page<SysUser> pageByRoleId(Page page, Long roleId);

}
