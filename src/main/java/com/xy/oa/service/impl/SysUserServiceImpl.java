package com.xy.oa.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xy.oa.entity.SysUser;
import com.xy.oa.mapper.SysUserMapper;
import com.xy.oa.service.SysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-24
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {


    @Override
    public Page<SysUser> pageByRoleId(Page page, Long roleId) {
        return this.baseMapper.pageByRoleId(page, roleId);
    }
}
