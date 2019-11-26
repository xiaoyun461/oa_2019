package com.xy.oa.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.gson.Gson;
import com.xy.oa.entity.SysUser;
import com.xy.oa.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("authorization")
public class AuthorizationController {

    @Autowired
    private SysUserService sysUserService;


    @RequestMapping("showPage")
    public String showPage() {
        return "authorization/authorization";
    }

    @RequestMapping("getUsersByRoleId")
    public String getUsersByRoleId(Long roleId, Page page, Model model) {
        Page<SysUser> pageInfo = sysUserService.pageByRoleId(new Page<>(page.getCurrent(), page.getSize()),
                roleId);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("url", "authorization/getUsersByRoleId");

        Gson gson = new Gson();
        Map<String, Object> params = new HashMap<>();
        params.put("roleId", roleId);
        model.addAttribute("params", gson.toJson(pageInfo));

        return "authorization/authorization_user_list";
    }

}
