package com.xtoon.boot.sys.application.assembler;

import com.xtoon.boot.sys.application.command.PermissionCommand;
import com.xtoon.boot.sys.domain.model.permission.*;
import com.xtoon.boot.sys.application.dto.PermissionDTO;
import org.apache.commons.lang3.StringUtils;

import java.util.*;

/**
 * Assembler class for the Permission.
 *
 * @author haoxin
 * @date 2021-02-17
 **/
public class PermissionDTOAssembler {

    public static PermissionDTO fromPermission(final Permission permission) {
        final PermissionDTO dto = new PermissionDTO();
        dto.setId(permission.getPermissionId()==null?null:permission.getPermissionId().getId());
        dto.setPermissionName(permission.getPermissionName()==null?null:permission.getPermissionName().getName());
        dto.setPermissionType(permission.getPermissionType()==null?null:permission.getPermissionType().getValue());
        dto.setMenuIcon(permission.getMenuIcon());
        dto.setMenuUrl(permission.getMenuUrl()==null?null:permission.getMenuUrl().getUrl());
        dto.setOrderNum(permission.getOrderNum());
        dto.setParentId(permission.getParent()==null?null:permission.getParent().getPermissionId().getId());
        dto.setParentName(permission.getParent()==null?null:permission.getParent().getPermissionName().getName());
        dto.setPermissionCodes(permission.getPermissionCodes()==null?null:permission.getPermissionCodes().getCodesString());
        dto.setPermissionLevel(permission.getPermissionLevel()==null?null:permission.getPermissionLevel().getValue());
        return dto;
    }

    public static Permission toPermission(final PermissionCommand permissionCommand, Permission parent) {
        PermissionId permissionId = null;
        if(permissionCommand.getId() != null) {
            permissionId = new PermissionId(permissionCommand.getId());
        }
        PermissionName permissionName = null;
        if(permissionCommand.getPermissionName() != null) {
            permissionName = new PermissionName(permissionCommand.getPermissionName());
        }
        PermissionTypeEnum permissionType = null;
        if(permissionCommand.getPermissionType() != null) {
            permissionType = PermissionTypeEnum.getMenuTypeEnum(permissionCommand.getPermissionType());
        }
        PermissionLevelEnum permissionLevel = null;
        if(permissionCommand.getPermissionLevel() !=null) {
            permissionLevel = PermissionLevelEnum.getMenuLevelEnum(permissionCommand.getPermissionLevel());
        }
        PermissionCodes permissionCodes = null;
        if(permissionCommand.getPermissionCodes() != null) {
            Set<String> permsSet = new HashSet<>();
            permsSet.addAll(Arrays.asList(permissionCommand.getPermissionCodes().trim().split(",")));
            permissionCodes = new PermissionCodes(permsSet);
        }
        MenuUrl menuUrl = null;
        if(!StringUtils.isEmpty(permissionCommand.getMenuUrl())) {
            menuUrl = new MenuUrl(permissionCommand.getMenuUrl());
        }
        Permission permission = new Permission(permissionId,permissionName,permissionType,permissionLevel,permissionCommand.getMenuIcon(),permissionCodes,permissionCommand.getOrderNum(),
                menuUrl,parent, null,null);
        return permission;
    }


    public static List<PermissionDTO> getPermissionList(final List<Permission> permissionList) {
        if(permissionList == null) {
            return null;
        }
        final List<PermissionDTO> List = new ArrayList<>();
        for(Permission permission : permissionList) {
            List.add(fromPermission(permission));
        }
        return List;
    }

    public static List<PermissionDTO> getMenuList(final List<Permission> permissionList) {
        if(permissionList == null) {
            return null;
        }
        final List<PermissionDTO> List = new ArrayList<>();
        for(Permission permission : permissionList) {
            if(permission.isMenu()) {
                List.add(fromPermission(permission));
            }
        }
        return List;
    }
}
