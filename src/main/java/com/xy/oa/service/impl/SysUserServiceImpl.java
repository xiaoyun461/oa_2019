package com.xy.oa.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xy.oa.entity.SysMenu;
import com.xy.oa.entity.SysRoleUser;
import com.xy.oa.entity.SysUser;
import com.xy.oa.mapper.SysMenuMapper;
import com.xy.oa.mapper.SysUserMapper;
import com.xy.oa.service.SysRoleUserService;
import com.xy.oa.service.SysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
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

    @Autowired
    private SysRoleUserService roleUserService;
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public Page<SysUser> pageByRoleId(Page page, Long roleId) {
        return this.baseMapper.pageByRoleId(page, roleId);
    }

    @Override
    public Page<SysUser> getNoAuthUsersByRoleId(Page page, Long roleId, String userName, LocalDate datemin, LocalDate datemax) {
        return this.baseMapper.pageNoAuthByRoleId(page, roleId, userName, datemin != null ? datemin.toString() : null, datemax != null ? datemax.toString() : null);
    }

    @Override
    public boolean batchAddUserToRole(List<Long> idList, Long roleId) {
        List<SysRoleUser> list = new ArrayList<>();
        idList.stream().forEach(userId ->
        {
            SysRoleUser sysRoleUser = new SysRoleUser();
            sysRoleUser.setUserId(userId);
            sysRoleUser.setRoleId(roleId);
            list.add(sysRoleUser);
        });
        return roleUserService.saveBatch(list);

    }

    @Override
    public List<SysMenu> listMenusByUserId(Long userId) {
        return sysMenuMapper.listMenusByUserId(userId);
    }
}
