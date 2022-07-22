package com.xtoon.boot.sys.application.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xtoon.boot.common.domain.StatusEnum;
import com.xtoon.boot.common.util.Page;
import com.xtoon.boot.common.util.PageAssembler;
import com.xtoon.boot.common.util.mybatis.Query;
import com.xtoon.boot.sys.application.RoleQueryService;
import com.xtoon.boot.sys.application.assembler.RoleDTOAssembler;
import com.xtoon.boot.sys.application.dto.RoleDTO;
import com.xtoon.boot.sys.domain.model.role.RoleId;
import com.xtoon.boot.sys.domain.model.role.RoleRepository;
import com.xtoon.boot.sys.infrastructure.persistence.entity.SysRoleDO;
import com.xtoon.boot.sys.infrastructure.persistence.mapper.SysRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色查询服务实现类
 *
 * @author haoxin
 * @date 2021-05-10
 **/
@Service
public class RoleQueryServiceImpl implements RoleQueryService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Override
    public Page queryPage(Map<String, Object> params) {
        IPage<SysRoleDO> page = sysRoleMapper.queryList(new Query().getPage(params),params);
        return PageAssembler.toPage(page);
    }

    @Override
    public List<RoleDTO> listAll() {
        HashMap<String, Object> param = new HashMap<>();
        param.put("status", StatusEnum.ENABLE.getValue());
        return RoleDTOAssembler.getRoleDTOList(sysRoleMapper.queryList(param));
    }

    @Override
    public RoleDTO getById(String id) {
        return RoleDTOAssembler.fromRole(roleRepository.find(new RoleId(id)));
    }
}
