package com.gaumn.reamls;

import com.gaumn.dao.UserInfoDao;
import com.gaumn.domain.UserInfo;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ Creat by gaumn on  2020/9/27
 **/
public class customRealm extends AuthorizingRealm {
    @Autowired
    private UserInfoDao userInfoDao;

    public void setUserInfoDao(UserInfoDao userInfoDao) {
        this.userInfoDao = userInfoDao;
    }

    //用户授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        System.out.println("调用我进行身份认证！！");

        return null;
    }
    //用户认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        System.out.println("调用我进行身份认证！！");
        //获取用户的身份信息
        String Principal= (String) token.getPrincipal();
        System.out.println("账号："+Principal);
        String credentials = new String((char[]) token.getCredentials());
        System.out.println("密码："+credentials);
        UserInfo userInfo =userInfoDao.getBytName(Principal);
        if (userInfo == null) {
            throw new UnknownAccountException(); //没有找到账号
        }

        if (Boolean.TRUE.equals(userInfo.getLocked())) {
            throw new LockedAccountException(); //账号锁定
        }
        //如果身份信息不正确，shiro会自动返回一个unknownAccountException异常
//        System.out.println("账号："+Principal);
//        System.out.println("密码匹配结果："+credentials.equals(userInfo.getUserPwd()));
//        if (userInfo==null)return null;
        SimpleAuthenticationInfo authenticationInfo= new SimpleAuthenticationInfo(userInfo,userInfo.getUserPwd(),getName());
        return authenticationInfo;
    }
}
