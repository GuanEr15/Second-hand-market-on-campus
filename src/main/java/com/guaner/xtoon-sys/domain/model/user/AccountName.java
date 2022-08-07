package com.xtoon.boot.sys.domain.model.user;

import com.xtoon.boot.common.domain.ValueObject;
import org.apache.commons.lang3.StringUtils;

/**
 * 账号名
 *
 * @author haoxin
 * @date 2021-02-08
 **/
public class AccountName implements ValueObject<AccountName> {

    /**
     * 账号名
     */
    private String name;

    public AccountName(String name) {
        if(StringUtils.isEmpty(name)) {
            throw new IllegalArgumentException("账号名不能为空");
        }
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public boolean sameValueAs(AccountName other) {
        return other != null && this.name.equals(other.name);
    }

    @Override
    public String toString() {
        return name;
    }
}
