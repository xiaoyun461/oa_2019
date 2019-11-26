package com.xy.oa.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.gson.Gson;
import com.xy.oa.common.SysResult;
import com.xy.oa.entity.SysOrg;
import com.xy.oa.service.SysOrgService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
@Controller
@RequestMapping("sysOrg")
@Slf4j
public class SysOrgController {

    @Autowired
    private SysOrgService sysOrgService;

    @ResponseBody
    @RequestMapping("findById")
    public SysOrg findById(Long orgId) {
        return sysOrgService.getById(orgId);
    }

    @RequestMapping("page")
    public String page(Page page, Model model) {
        IPage<SysOrg> pageInfo = sysOrgService.page(new Page<SysOrg>(page.getCurrent(), page.getSize()));
        model.addAttribute("pageInfo", pageInfo);
        return "org/org_list";

    }

    @RequestMapping("pageByCondition")
    public String pageByCondition(SysOrg org, Page page, Model model) {
        Gson gson = new Gson();
        Map<String, Object> params = new HashMap<>();
        LambdaQueryWrapper<SysOrg> query = Wrappers.<SysOrg>lambdaQuery();
        if (StringUtils.isNotBlank(org.getOrgParentName())) {
            query.like(SysOrg::getOrgParentName, org.getOrgParentName());
            params.put("orgParentName", org.getOrgParentName());
        }

        if (org.getFlag() != null) {
            query.eq(SysOrg::getFlag, org.getFlag());
            params.put("flag", org.getFlag());
        }
        if (StringUtils.isNotBlank(org.getOrgName())) {
            query.like(SysOrg::getOrgName, org.getOrgName());
            params.put("orgName", org.getOrgName());
        }
        IPage<SysOrg> pageInfo = sysOrgService.page(new Page<SysOrg>(page.getCurrent(), page.getSize()), query);
        log.info("{}", pageInfo.getRecords());

        String par = gson.toJson(params);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("org", org);
        model.addAttribute("url", "sysOrg/pageByCondition");
        model.addAttribute("params", par);

        return "org/org_list";

    }

    @RequestMapping("toAdd")
    public String toAdd() {
        return "org/org_add";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public SysResult add(SysOrg sysOrg) {
        log.info("addSysOrg:{}", sysOrg);
        boolean flag = sysOrgService.save(sysOrg);
        SysResult sysResult = SysResult.init(flag, SysResult.UPDATE);
        return sysResult;
    }

    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public List<SysOrg> list() {
        List<SysOrg> list = sysOrgService.list();
        return list;
    }


    @RequestMapping("toUpdate")
    public String toUpdate(Long orgId, Model model) {
        //根据id获取对象数据
        SysOrg syOrg = sysOrgService.getById(orgId);
        model.addAttribute("sysOrg", syOrg);
        return "org/org_update";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public SysResult toUpdate(SysOrg sysOrg) {
        boolean flag = sysOrgService.updateById(sysOrg);
        SysResult sysResult = SysResult.init(flag, SysResult.UPDATE);
        return sysResult;
    }

    @RequestMapping(value = "delById", method = RequestMethod.POST)
    @ResponseBody
    public SysResult delById(Long orgId) {
        boolean flag = sysOrgService.delById(orgId);
        SysResult sysResult = SysResult.init(flag, SysResult.DELETE);
        return sysResult;
    }

    @RequestMapping(value = "batchDel", method = RequestMethod.POST)
    @ResponseBody
    public SysResult batchDel(@RequestParam("idList") List<Long> idList) {
        boolean flag = sysOrgService.batchDel(idList);
        SysResult sysResult = SysResult.init(flag, SysResult.DELETE);
        return sysResult;
    }


}

