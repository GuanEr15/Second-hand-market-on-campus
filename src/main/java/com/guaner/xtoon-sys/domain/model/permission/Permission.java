package com.xtoon.boot.sys.domain.model.permission;

import com.xtoon.boot.common.domain.Entity;
import com.xtoon.boot.common.domain.StatusEnum;

import java.util.List;

/**
 * 权限
 *
 * @author haoxin
 * @date 2021-02-08
 **/
public class Permission implements Entity<Permission> {

    public final static String ROOT_ID = "0";

    /**
     * id
     */
    private PermissionId permissionId;

    /**
     * 权限名称
     */
    private PermissionName permissionName;

    /**
     * 权限类型
     */
    private PermissionTypeEnum permissionType;

    /**
     * 权限级别
     */
    private PermissionLevelEnum permissionLevel;

    /**
     * 菜单图标
     */
    private String menuIcon;

    /**
     * 权限编码
     */
    private PermissionCodes permissionCodes;

    /**
     * 排序
     */
    private int orderNum;

    /**
     * 菜单URL
     */
    private MenuUrl menuUrl;

    /**
     * 父权限
     */
    private Permission parent;

    /**
     * 状态
     */
    private StatusEnum status;

    /**
     * 子权限
     */
    private List<Permission> subList;

    public Permission(PermissionId permissionId) {
        this.permissionId = permissionId;
    }

    public Permission(PermissionId permissionId, PermissionName permissionName, PermissionTypeEnum permissionType, PermissionLevelEnum permissionLevel, String menuIcon, PermissionCodes permissionCodes, int orderNum, MenuUrl menuUrl, Permission parent, StatusEnum status, List<Permission> subList) {
        this.permissionId = permissionId;
        this.permissionName = permissionName;
        this.permissionType = permissionType;
        this.permissionLevel = permissionLevel;
        this.menuIcon = menuIcon;
        this.permissionCodes = permissionCodes;
        this.orderNum = orderNum;
        this.menuUrl = menuUrl;
        this.parent = parent;
        this.status = status;
        this.subList = subList;
    }

    @Override
    public boolean sameIdentityAs(Permission other) {
        return other != null && permissionId.sameValueAs(other.permissionId);
    }

    /**
     * 是否是菜单
     *
     * @return
     */
    public boolean isMenu() {
        return permissionType == PermissionTypeEnum.CATALOG || permissionType == PermissionTypeEnum.MENU;
    }

    /**
     * 是否有子权限
     *
     * @return
     */
    public boolean hasSub() {
        return subList != null && !subList.isEmpty();
    }

    /**
     * 禁用
     */
    public void disable() {
        if(this.permissionType == PermissionTypeEnum.CATALOG) {
            throw new IllegalArgumentException("目录无法启用或禁用");
        }
        StatusEnum status = this.status == StatusEnum.DISABLE?StatusEnum.ENABLE:StatusEnum.DISABLE;
        this.status = status;
        if(subList != null && !subList.isEmpty()) {
            for(Permission subPermission : subList) {
                subPermission.status = status;
            }
        }
    }

    public PermissionId getPermissionId() {
        return permissionId;
    }

    public PermissionName getPermissionName() {
        return permissionName;
    }

    public PermissionTypeEnum getPermissionType() {
        return permissionType;
    }

    public PermissionLevelEnum getPermissionLevel() {
        return permissionLevel;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public PermissionCodes getPermissionCodes() {
        return permissionCodes;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public MenuUrl getMenuUrl() {
        return menuUrl;
    }

    public Permission getParent() {
        return parent;
    }

    public StatusEnum getStatus() {
        return status;
    }

    public List<Permission> getSubList() {
        return subList;
    }

}
