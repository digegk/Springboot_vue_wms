package com.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wms.entity.Record;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wms
 */
public interface RecordService extends IService<Record> {
    IPage pageC(IPage<Record> page, Wrapper Wrapper);

}
