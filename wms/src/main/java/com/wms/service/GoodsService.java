package com.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wms.entity.Goods;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wms
 */
public interface GoodsService extends IService<Goods> {
    IPage pageC(IPage<Goods> page, Wrapper Wrapper);

}
