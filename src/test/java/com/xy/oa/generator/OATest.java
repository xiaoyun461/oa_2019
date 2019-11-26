package com.xy.oa.generator;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.junit.Test;

public class OATest {

    @Test
    public void main() {//        List<String> strings = new ArrayList<>();
//        boolean overwrite = true;
//
//        File configFile = new File("generatorConfig.xml");
//        ConfigurationParser cp = new ConfigurationParser(strings);
//        Configuration config = cp.parseConfiguration(configFile);
//        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, strings);
//        myBatisGenerator.generate(null);
    }

    @Test
    public void mgp() {
        //1.全局配置
        GlobalConfig config = new GlobalConfig();
        config.setActiveRecord(true)//是否支持AR模式
                .setAuthor("xiaoyun461")//设置作者
                .setOutputDir("F:\\xiaoyun2\\spring-shiro-training\\src\\main\\java")//生成路径
                .setFileOverride(true)//文件覆盖
                .setIdType(IdType.AUTO) //主键策略
                .setServiceName("%sService")//设置生成的service接口的名字的首字母是否为I 如IEmployeeService
                .setBaseResultMap(true)//生成基本的结果集
                .setBaseColumnList(true);//生成基本的列的集合 SQL片段供使用
        //2.数据源配置
        DataSourceConfig dsConfig = new DataSourceConfig();
        dsConfig.setDbType(DbType.MYSQL)//设置数据库类型 MYSQL ORACLE等
                .setDriverName("com.mysql.jdbc.Driver")
                .setUrl("jdbc:mysql://192.168.0.103:3306/oa_2018")
                .setUsername("root")
                .setPassword("123456");
        //3.策略配置
        StrategyConfig stConfig = new StrategyConfig();
        stConfig.setCapitalMode(true)//全局大写命名
//                .setDbColumnUnderline(true)//指定表名 字段名是否使用下划线
                .setNaming(NamingStrategy.underline_to_camel)//数据库表映射到实体的命名策略
//                .setTablePrefix("sys_")//表名前缀
                .setInclude(
//                        "sys_area", "sys_menu", "sys_org", "sys_role", "sys_role_menu", "sys_role_user",
                "sys_user");//生成的表 可变参数
        //4.包名策略配置
        PackageConfig pkConfig = new PackageConfig();
        pkConfig.setParent("com.xy.oa")//设置父包，后面就不用写这段包名
                .setMapper("mapper")
                .setService("service")
                .setController("controller")
                .setEntity("entity")
                .setXml("mapper");
        //5.整合配置
        AutoGenerator ag = new AutoGenerator();
        ag.setGlobalConfig(config)
                .setDataSource(dsConfig)
                .setStrategy(stConfig)
                .setPackageInfo(pkConfig);
        //6.执行
        ag.execute();
    }
}
