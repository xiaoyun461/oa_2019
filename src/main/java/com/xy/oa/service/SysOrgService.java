package com.xy.oa.service;

import com.xy.oa.entity.SysOrg;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
public interface SysOrgService extends IService<SysOrg> {

    boolean delById(Long orgId);

    boolean batchDel(List<Long> idList);
}
