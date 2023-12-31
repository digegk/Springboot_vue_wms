package com.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wms.entity.Goodstype;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wms
 */
public interface GoodstypeService extends IService<Goodstype> {

    IPage pageC(IPage<Goodstype> page, Wrapper Wrapper);
}
