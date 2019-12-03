package com.xy.oa.mapper;

import com.xy.oa.entity.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author xiaoyun461
 * @since 2019-11-21
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    List<SysMenu> listMenusByUserId(Long userId);
}
