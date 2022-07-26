package com.xtoon.boot.sys.domain.model.role;

import com.xtoon.boot.sys.domain.model.role.Role;
import com.xtoon.boot.sys.domain.model.role.RoleCode;
import com.xtoon.boot.sys.domain.model.role.RoleId;
import com.xtoon.boot.sys.domain.model.role.RoleName;

import java.util.List;

/**
 * 角色-Repository接口
 *
 * @author haoxin
 * @date 2021-02-14
 **/
public interface RoleRepository {

    /**
     * 获取角色
     *
     * @param roleId
     * @return
     */
    Role find(RoleId roleId);

    /**
     * 获取角色
     *
     * @param roleName
     * @return
     */
    Role find(RoleName roleName);

    /**
     * 获取角色
     *
     * @param roleCode
     * @return
     */
    Role find(RoleCode roleCode);

    /**
     * 保存
     *
     * @param role
     */
    RoleId store(Role role);

    /**
     * 删除
     *
     * @param roleIds
     */
    void remove(List<RoleId> roleIds);

}
