package com.xtoon.boot.sys.application.impl;

import com.google.code.kaptcha.Producer;
import com.xtoon.boot.sys.application.AuthenticationApplicationService;
import com.xtoon.boot.sys.application.assembler.LoginSuccessDTOAssembler;
import com.xtoon.boot.sys.application.command.AccountLoginCommand;
import com.xtoon.boot.sys.application.command.MobileLoginCommand;
import com.xtoon.boot.sys.application.command.RegisterTenantCommand;
import com.xtoon.boot.sys.application.dto.LoginSuccessDTO;
import com.xtoon.boot.sys.domain.external.TokenGeneratorExternalService;
import com.xtoon.boot.sys.domain.model.captcha.Captcha;
import com.xtoon.boot.sys.domain.model.captcha.CaptchaCode;
import com.xtoon.boot.sys.domain.model.captcha.CaptchaRepository;
import com.xtoon.boot.sys.domain.model.captcha.Uuid;
import com.xtoon.boot.sys.domain.model.permission.PermissionRepository;
import com.xtoon.boot.sys.domain.model.role.RoleRepository;
import com.xtoon.boot.sys.domain.model.tenant.TenantCode;
import com.xtoon.boot.sys.domain.model.tenant.TenantName;
import com.xtoon.boot.sys.domain.model.tenant.TenantRepository;
import com.xtoon.boot.sys.domain.model.user.*;
import com.xtoon.boot.sys.domain.service.CaptchaValidateService;
import com.xtoon.boot.sys.domain.service.TenantRegisterService;
import com.xtoon.boot.sys.domain.specification.LoginByAccountSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.awt.image.BufferedImage;
import java.util.List;

/**
 * 身份验证应用服务实现类
 *
 * @author haoxin
 * @date 2021-05-10
 **/
@Service
public class AuthenticationApplicationServiceImpl implements AuthenticationApplicationService {

    @Autowired
    private Producer producer;

    @Autowired
    private CaptchaRepository captchaRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TokenGeneratorExternalService tokenGeneratorExternalService;

    @Autowired
    private TenantRepository tenantRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PermissionRepository permissionRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public BufferedImage getCaptcha(String uuid) {
        //生成文字验证码
        String code = producer.createText();
        captchaRepository.store(Captcha.createCaptcha(new Uuid(uuid),new CaptchaCode(code)));
        return producer.createImage(code);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public LoginSuccessDTO loginByAccount(AccountLoginCommand accountLoginCommand) {
        CaptchaValidateService captchaValidateService = new CaptchaValidateService(captchaRepository);
        if(!captchaValidateService.validate(new Uuid(accountLoginCommand.getUuid()), new CaptchaCode(accountLoginCommand.getCaptcha()))) {
            throw new RuntimeException("验证码不正确");
        }
        List<User> users = userRepository.find(new Mobile(accountLoginCommand.getAccountName()));
        if(users == null || users.isEmpty()) {
            throw new RuntimeException("用户或密码不正确");
        }
        User user = users.get(0);
        LoginByAccountSpecification loginByUserNameSpecification = new LoginByAccountSpecification(accountLoginCommand.getPassword());
        loginByUserNameSpecification.isSatisfiedBy(user);
        user.refreshToken(tokenGeneratorExternalService.generateValue());
        userRepository.store(user);
        return LoginSuccessDTOAssembler.toDTO(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public LoginSuccessDTO loginByMobile(MobileLoginCommand mobileLoginCommand) {
        if (!mobileLoginCommand.getVerificationCode().equals(mobileLoginCommand.getCorrectVerificationCode())) {
            throw new RuntimeException("验证码不正确");
        }
        List<User> users = userRepository.find(new Mobile(mobileLoginCommand.getMobile()));
        if(users == null || users.isEmpty()) {
            throw new RuntimeException("用户不存在");
        }
        User user = users.get(0);
        user.refreshToken(tokenGeneratorExternalService.generateValue());
        userRepository.store(user);
        return LoginSuccessDTOAssembler.toDTO(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void logout(String userId) {
        User user = userRepository.find(new UserId(userId));
        user.refreshToken(tokenGeneratorExternalService.generateValue());
        userRepository.store(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void registerTenant(RegisterTenantCommand registerTenantCommand) {
        CaptchaValidateService captchaValidateService = new CaptchaValidateService(captchaRepository);
        if(!captchaValidateService.validate(new Uuid(registerTenantCommand.getUuid()), new CaptchaCode(registerTenantCommand.getCaptcha()))) {
            throw new RuntimeException("验证码不正确");
        }
        TenantRegisterService tenantRegisterService = new TenantRegisterService(tenantRepository, roleRepository, permissionRepository,userRepository);
        tenantRegisterService.registerTenant(new TenantName(registerTenantCommand.getTenantName()), new TenantCode(registerTenantCommand.getTenantCode()),new Mobile(registerTenantCommand.getMobile()),
                Password.create(registerTenantCommand.getPassword()), new UserName(registerTenantCommand.getUserName()));
    }

}
