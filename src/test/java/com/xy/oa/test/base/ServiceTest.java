package com.xy.oa.test.base;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xy.oa.entity.SysUser;
import com.xy.oa.service.SysUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class ServiceTest {
    @Autowired
    private SysUserService sysUserService;


    @Test
    public void getUserByRoleIdTest() {
        Page<SysUser> sysUserPage = sysUserService.pageByRoleId(new Page(1, 1), 3L);
        System.out.println(sysUserPage.getRecords());
    }
}
