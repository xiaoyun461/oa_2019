package com.xy.oa.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.gson.Gson;
import com.xy.oa.common.SysResult;
import com.xy.oa.entity.SysUser;
import com.xy.oa.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-24
 */
@Controller
@RequestMapping("/sysUser")
@Slf4j
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;


    @RequestMapping("pageByCondition")
    public String pageByCondition(@RequestParam(required = false) String userName,
                                  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(name = "datemin", required = false) LocalDate datemin,
                                  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(name = "datemax", required = false) LocalDate datemax,
                                  Page page, Model model) {
        model.addAttribute("sDatemax", datemax);
        model.addAttribute("sDatemin", datemin);
        model.addAttribute("userName", userName);
        log.info("datemin:{},datemax:{}", datemin, datemax);
        LambdaQueryWrapper<SysUser> query = Wrappers.<SysUser>lambdaQuery();
        Gson gson = new Gson();
        Map<String, Object> params = new HashMap<>();

        if (StringUtils.isNotBlank(userName)) {
            query.like(SysUser::getUserName, userName);
            params.put("userName", userName);
        }

        if (null != datemax || null != datemin) {
            if (null == datemax) {
                params.put("datemin", datemin.toString() );
                datemax = LocalDate.now();
            }
            if (null == datemin) {
                params.put("datemax", datemax.toString());
                datemin = LocalDate.of(1900, 01, 01);
            }
            query.between(SysUser::getBirthday, datemin, datemax);
        }

        IPage<SysUser> pageInfo = sysUserService.page(new Page<>(page.getCurrent(), 1), query);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("url", "sysUser/pageByCondition");

        String par = gson.toJson(params);
        model.addAttribute("params", par);
        return "user/user_list";
    }

    @RequestMapping("toAdd")
    public String toAdd() {
        return "user/user_add";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public SysResult add(SysUser sysUser) {
        log.info("addSysOrg:{}", sysUser);
        boolean flag = sysUserService.save(sysUser);
        SysResult sysResult = SysResult.init(flag, SysResult.UPDATE);
        return sysResult;
    }

    @RequestMapping("toUpdate")
    public String toUpdate(Long userId, Model model) {
        SysUser sysUser = sysUserService.getById(userId);
        model.addAttribute("user", sysUser);
        return "user/user_update";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public SysResult toUpdate(SysUser SysUser) {
        boolean flag = sysUserService.updateById(SysUser);
        SysResult sysResult = SysResult.init(flag, SysResult.UPDATE);
        return sysResult;
    }

    @RequestMapping(value = "delById", method = RequestMethod.POST)
    @ResponseBody
    public SysResult delById(Long userId) {
        boolean flag = sysUserService.removeById(userId);
        SysResult sysResult = SysResult.init(flag, SysResult.DELETE);
        return sysResult;
    }

    @RequestMapping(value = "batchDel", method = RequestMethod.POST)
    @ResponseBody
    public SysResult batchDel(@RequestParam("idList") List<Long> idList) {
        boolean flag = sysUserService.removeByIds(idList);
        SysResult sysResult = SysResult.init(flag, SysResult.DELETE);
        return sysResult;
    }


}

