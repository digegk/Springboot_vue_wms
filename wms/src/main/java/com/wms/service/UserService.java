package com.wms.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wms.entity.User;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wms
 */
public interface UserService extends IService<User> {

    IPage pageC(IPage<User> page, Wrapper Wrapper);
}
