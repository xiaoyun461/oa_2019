package com.xy.oa.test.base;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xy.oa.entity.SysMenu;
import com.xy.oa.entity.SysUser;
import com.xy.oa.mapper.SysMenuMapper;
import com.xy.oa.mapper.SysUserMapper;
import com.xy.oa.service.SysUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class ServiceTest {
    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Test
    public void getUserByRoleIdTest() {
        Page<SysUser> sysUserPage = sysUserService.pageByRoleId(new Page(1, 2), 3L);
        System.out.println(sysUserPage.getRecords());
    }

    @Test
    public void getNoAuthUsersByRoleId() {
        Page<SysUser> sysUserPage = sysUserMapper.pageNoAuthByRoleId(new Page(1, 10), 2L, "", null, LocalDate.now().toString());
        System.out.println(sysUserPage.getRecords());
    }

    @Test
    public void test1() {
        boolean b = sysUserService.batchAddUserToRole(Arrays.asList(1L, 2L), 3L);
        System.out.println(b);
    }

    @Test
    public void listMenusByUserId() {
        List<SysMenu> sysMenu = sysMenuMapper.listMenusByUserId(101L);
        sysMenu.forEach(System.out::println);
    }
}
