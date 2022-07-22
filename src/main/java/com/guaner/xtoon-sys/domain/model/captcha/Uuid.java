package com.xtoon.boot.sys.domain.model.captcha;

import com.xtoon.boot.common.domain.ValueObject;
import org.apache.commons.lang3.StringUtils;

/**
 * uuid
 *
 * @author haoxin
 * @date 2021-05-10
 **/
public class Uuid implements ValueObject<Uuid> {

    private String id;

    public Uuid(final String id) {
        if(StringUtils.isEmpty(id)) {
            throw new IllegalArgumentException("uuid不能为空");
        }
        this.id = id;
    }

    public String getId() {
        return id;
    }

    @Override
    public boolean sameValueAs(Uuid other) {
        return other != null && this.id.equals(other.id);
    }

    @Override
    public String toString() {
        return id;
    }
}
