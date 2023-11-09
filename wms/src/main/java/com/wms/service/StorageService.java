package com.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wms.entity.Storage;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wms
 */
public interface StorageService extends IService<Storage> {
    IPage pageC(IPage<Storage> page, Wrapper Wrapper);

}
