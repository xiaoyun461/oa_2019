package com.xy.oa.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xy.oa.common.*;

@RequestMapping("shiro")
@Controller
@Slf4j
public class ShiroConreoller {

    @RequestMapping("login")
    public String login(User user) {
        log.info("userName:{},password:{}", user.getUsername(), user.getPassword());

        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            System.out.println("当前用户我登陆");

            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());

            token.setRememberMe(true);
            try {
                subject.login(token);
            } catch (AuthenticationException e) {
                log.info("认证失败");
                return "login";
            }
        }
        log.info("认证成功");
        User user1 = (User) subject.getPrincipal();
        log.info("user:{}", user);
        return "shiro/shiroIndex";
    }

    @RequestMapping("toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("toIndex")
    public String toIndex() {
        return "index";
    }

    @RequiresPermissions("shiro/toAdd")
    @RequestMapping("toAdd")
    public String toAdd() {
        return "index";
    }

    @RequiresPermissions("shiro/toUpdate")
    @RequestMapping("toUpdate")
    public String toUpdate() {
        return "index";
    }
}

