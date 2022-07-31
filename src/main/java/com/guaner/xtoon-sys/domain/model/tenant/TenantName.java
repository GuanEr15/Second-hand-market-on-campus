package com.xtoon.boot.sys.domain.model.tenant;

import com.xtoon.boot.common.domain.ValueObject;
import org.apache.commons.lang3.StringUtils;

/**
 * 租户名
 *
 * @author haoxin
 * @date 2021-02-08
 **/
public class TenantName implements ValueObject<TenantName> {

    /**
     * 租户名
     */
    private String name;

    public TenantName(String name) {
        if(StringUtils.isEmpty(name)) {
            throw new IllegalArgumentException("租户名不能为空");
        }
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public boolean sameValueAs(TenantName other) {
        return other != null && this.name.equals(other.name);
    }

    @Override
    public String toString() {
        return name;
    }
}
