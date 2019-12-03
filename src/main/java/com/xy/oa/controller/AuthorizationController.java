package com.xy.oa.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.gson.Gson;
import com.xy.oa.common.SysResult;
import com.xy.oa.entity.SysUser;
import com.xy.oa.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
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

    /**
     * 查询当前角色下面的所有用户
     *
     * @param roleId
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("getUsersByRoleId")
    public String getUsersByRoleId(Long roleId, Page page, Model model) {
        Page<SysUser> pageInfo = sysUserService.pageByRoleId(new Page<>(page.getCurrent(), page.getSize()),
                roleId);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("url", "authorization/getUsersByRoleId");

        Gson gson = new Gson();
        Map<String, Object> params = new HashMap<>();
        params.put("roleId", roleId);
        model.addAttribute("params", gson.toJson(params));

        return "authorization/authorization_user_list";
    }

    /**
     * 查询当前拥有当前角色的所有用户
     *
     * @return
     */
    @RequestMapping("getNoAuthUsersByRoleId")
    public String getNoAuthUsersByRoleId(Long roleId,
                                         String userName,
                                         @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(name = "datemin", required = false) LocalDate datemin,
                                         @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(name = "datemax", required = false) LocalDate datemax,
                                         Page page, Model model) {
        model.addAttribute("datemin", datemin);
        model.addAttribute("datemin", datemax);

        Page<SysUser> pageInfo = sysUserService.getNoAuthUsersByRoleId(new Page<>(page.getCurrent(), page.getSize()),
                roleId, userName, null, null);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("url", "authorization/getNoAuthUsersByRoleId");
        Gson gson = new Gson();
        Map<String, Object> params = new HashMap<>();
        params.put("datemin", datemax != null ? datemin.toString() : null);
        params.put("datemax", datemax != null ? datemax.toString() : null);
        params.put("roleId", roleId);
        params.put("userName", userName);
        model.addAttribute("params", gson.toJson(params));
        model.addAttribute("userName", userName);
        model.addAttribute("roleId", roleId);

        return "authorization/authorization_noauth_user_list";
    }

    @RequestMapping("batchAddUserToRole")
    @ResponseBody
    public SysResult batchAddUserToRole(@RequestParam List<Long> idList, Long roleId) {
        boolean flag = sysUserService.batchAddUserToRole(idList, roleId);
        SysResult sysResult = SysResult.init(flag, SysResult.UPDATE);
        return sysResult;

    }
}
