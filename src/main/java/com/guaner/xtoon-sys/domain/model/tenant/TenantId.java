package com.xtoon.boot.sys.domain.model.tenant;

import com.xtoon.boot.common.domain.ValueObject;
import org.apache.commons.lang3.StringUtils;

/**
 * 租户id
 *
 * @author haoxin
 * @date 2021-02-09
 **/
public class TenantId implements ValueObject<TenantId> {

    /**
     * 平台租户
     */
    public static final String PLATFORM_TENANT = "1";

    private String id;

    public TenantId(final String id) {
        if(StringUtils.isEmpty(id)) {
            throw new IllegalArgumentException("租户id不能为空");
        }
        this.id = id;
    }

    public boolean isPlatformId() {
        return id != null && PLATFORM_TENANT.equals(id);
    }

    public String getId() {
        return id;
    }

    @Override
    public boolean sameValueAs(TenantId other) {
        return other != null && this.id.equals(other.id);
    }

    @Override
    public String toString() {
        return id;
    }
}
