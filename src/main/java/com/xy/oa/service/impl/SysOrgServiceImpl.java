package com.xy.oa.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.xy.oa.entity.SysOrg;
import com.xy.oa.mapper.SysOrgMapper;
import com.xy.oa.service.SysOrgService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
@Service
public class SysOrgServiceImpl extends ServiceImpl<SysOrgMapper, SysOrg> implements SysOrgService {

    @Autowired
    private SysOrgMapper sysOrgMapper;

    @Override
    public boolean delById(Long orgId) {
        Integer count = this.baseMapper.selectCount(Wrappers.<SysOrg>lambdaQuery().eq(SysOrg::getOrgParentId, orgId).eq(SysOrg::getFlag, true));
        if (count <= 0) {
            int del = this.baseMapper.deleteById(orgId);
            if (del > 0) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean batchDel(List<Long> idList) {
        long l = sysOrgMapper.selectCountByIds(idList);
        if (l <= 0) {
            int del = this.baseMapper.deleteBatchIds(idList);
            if (del > 0) {
                return true;
            }
        }
        return false;
    }
}
