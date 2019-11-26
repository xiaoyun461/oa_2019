package com.xy.oa.mapper;

import com.xy.oa.entity.SysOrg;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
public interface SysOrgMapper extends BaseMapper<SysOrg> {

    long selectCountByIds(List<Long> idList);
}
