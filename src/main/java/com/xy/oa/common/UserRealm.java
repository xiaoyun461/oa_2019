package com.xy.oa.common;

import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import com.xy.oa.controller.ShiroConreoller;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.HashSet;
import java.util.Set;

@Slf4j
public class UserRealm extends AuthorizingRealm {
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        log.info("doGetAuthorizationInfo.....处理授权");
        User user = (User) principals.getPrimaryPrincipal();

        Set<String> stringPermissions = new HashSet<>();

        if ("admin".equals(user.getUsername())) {
            stringPermissions.add("shiro/toAdd");
            stringPermissions.add("shiro/toUpdate");
        } else if ("xiaoyun461".equals(user.getUsername())) {
            stringPermissions.add("shiro/toAdd");
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(stringPermissions);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        log.info("doGetAuthenticationInfo.....处理认证");

        String username = (String) token.getPrincipal();
        char[] cs = (char[]) token.getCredentials();

        log.info("用户名：{}" + token.getPrincipal());
        log.info("密码：{}" + token.getCredentials());

        User user = null;
        if ("admin".equals(username)) {
            user = new User(username, "038bdaf98f2037b31f1e75b5b4c9b26e");
//            user = new User(username, "admin");
        } else if ("xiaoyun461".equals(username)) {
            user = new User(username, "xiaoyun461");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getUsername()), this.getName());
        return info;
    }
}
