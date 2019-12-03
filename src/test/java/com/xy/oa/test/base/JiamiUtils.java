package com.xy.oa.test.base;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;

public class JiamiUtils {


    @Test
    public void utils() {
        String algorithmName = "MD5";
        Object source = "123456";
        Object salt = ByteSource.Util.bytes("admin");
        int hashIterations = 1024;

        SimpleHash simpleHash = new SimpleHash(algorithmName, source, salt, hashIterations);
        System.out.println(simpleHash);
        System.out.println(simpleHash.toString().length());
    }
}
