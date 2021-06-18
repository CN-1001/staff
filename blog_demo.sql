/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : blog_demo

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2021-06-17 12:04:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('1');

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `first_picture` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK292449gwg5yf7ocdlmswv9w4j` (`type_id`),
  KEY `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`),
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('22', '', '', '内容nnnnnnnnnnn', '2021-04-20 00:55:49', '', '原创', '\0', '\0', '\0', '测试博客', '2021-06-11 22:51:13', null, '14', '1');
INSERT INTO `t_blog` VALUES ('25', '\0', '', 'shirodemo03 项目\r\n\r\n```\r\nsubject     用户\r\nSecurityManager   管理所有用户\r\nRealm      连接数据\r\n```\r\n\r\n```\r\nSubject currentUser = SecurityUtils.getSubject();   创建 对象\r\nSession session = currentUser.getSession();  通过对象获取session\r\nUsernamePasswordToken token = new UsernamePasswordToken(username, password);  封装对象\r\ncurrentUser.isAuthenticated()   判断用户是否被认证\r\ncurrentUser.login()  登录\r\ncurrentUser.getPrincipal()     获得当前用户的认证\r\ncurrentUser.hasRole( \"schwartz\" )  有什么权限\r\ncurrentUser.isPermitted( \"lightsaber:weild\" )  获得当前的权限\r\ncurrentUser.logout()  注销\r\n```\r\n\r\n### shiro环境\r\n\r\n- 两个配置类\r\n- shiro 依赖\r\n\r\n#### 1 导入依赖\r\n\r\n```pom\r\n		<dependency>\r\n            <groupId>org.apache.shiro</groupId>\r\n            <artifactId>shiro-spring</artifactId>\r\n            <version>1.7.1</version>\r\n        </dependency>\r\n```\r\n\r\n\r\n\r\n#### 2  创建两个配置文件\r\n\r\n- 创建 realm 对象，自定义的  1\r\n- DefaultWebSecurityManager   2   默认的web 安全管理\r\n- ShiroFilterFactoryBean 3  安全过滤器工厂\r\n\r\nShiroConfig\r\n\r\n```\r\n@Configuration\r\npublic class ShiroConfig {\r\n\r\n\r\n   //ShiroFilterFactoryBean 3  安全过滤器工厂\r\n   @Bean\r\n    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier(\"securityManager\") DefaultWebSecurityManager defaultWebSecurityManager){\r\n        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();\r\n\r\n        //设置安全管理器\r\n        bean.setSecurityManager(defaultWebSecurityManager);\r\n        return bean;\r\n    }\r\n\r\n    //DefaultWebSecurityManager   2   默认的web 安全管理\r\n    @Bean(name=\"securityManager\")\r\n    public DefaultWebSecurityManager defaultWebSecurityManager(@Qualifier(\"userRealm\")UserRealm userRealm){\r\n        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();\r\n        //关联 UserRealm\r\n        defaultWebSecurityManager.setRealm(userRealm);\r\n\r\n\r\n        return defaultWebSecurityManager;\r\n    }\r\n\r\n    // 创建 realm 对象，自定义的  1\r\n    @Bean\r\n    public UserRealm userRealm(){\r\n        return new UserRealm();\r\n    }\r\n\r\n}\r\n```\r\n\r\nUserRealm 自定义类\r\n\r\n```\r\npublic class UserRealm extends AuthorizingRealm {\r\n\r\n    //授权\r\n    @Override\r\n    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {\r\n        return null;\r\n    }\r\n\r\n    //认证\r\n    @Override\r\n    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {\r\n        return null;\r\n    }\r\n}\r\n```\r\n\r\n#### 整合\r\n\r\nshirologindemo\r\n\r\n```\r\nC:\\Users\\11711\\Desktop\\框架\\安全框架\\Shiro框架\\shirologindemo\r\n```\r\n\r\n\r\n\r\n```pom\r\n		<dependency>\r\n            <groupId>com.github.theborakompanioni</groupId>\r\n            <artifactId>thymeleaf-extras-shiro</artifactId>\r\n            <version>2.0.0</version>\r\n        </dependency>\r\n```\r\n\r\n\r\n\r\n```html\r\n<h1>首页</h1>\r\n\r\n<h2 th:text=\"${msg}\"></h2>\r\n<a href=\"/toLogin\">登录</a>\r\n<hr>\r\n<div shiro:hasPermission=\"user:add\">\r\n    <a th:href=\"@{/user/add}\">add</a>\r\n</div>\r\n\r\n<div shiro:hasPermission=\"user:update\">\r\n    <a th:href=\"@{/user/update}\">update</a>\r\n</div>\r\n```\r\n\r\n', '2021-04-20 06:44:43', '', '原创', '', '', '\0', 'Shiro笔记', '2021-04-20 09:23:26', '1', '15', '1');
INSERT INTO `t_blog` VALUES ('26', '\0', '\0', '## 逆向工程\r\n\r\n### 1 导入依赖\r\n\r\n```pom\r\n<dependencies>\r\n<!--        web -->\r\n        <dependency>\r\n            <groupId>org.springframework.boot</groupId>\r\n            <artifactId>spring-boot-starter-web</artifactId>\r\n        </dependency>\r\n<!--    mysql-->\r\n        <dependency>\r\n            <groupId>mysql</groupId>\r\n            <artifactId>mysql-connector-java</artifactId>\r\n            <scope>runtime</scope>\r\n        </dependency>\r\n<!---->\r\n\r\n<!--        mybatis plus-->\r\n        <dependency>\r\n            <groupId>org.mybatis.spring.boot</groupId>\r\n            <artifactId>mybatis-spring-boot-starter</artifactId>\r\n            <version>2.1.4</version>\r\n        </dependency>\r\n\r\n<!--        代码生成器依赖-->\r\n        <dependency>\r\n            <groupId>com.baomidou</groupId>\r\n            <artifactId>mybatis-plus-generator</artifactId>\r\n            <version>3.3.1</version>\r\n        </dependency>\r\n\r\n<!--        freemarker 依赖-->\r\n        <dependency>\r\n            <groupId>org.freemarker</groupId>\r\n            <artifactId>freemarker</artifactId>\r\n            <version>2.3.31</version>\r\n        </dependency>\r\n\r\n\r\n    </dependencies>\r\n```\r\n\r\n### 2 创建一个包 generator\r\n\r\n- 创建一个 CodeGenerator 类\r\n\r\n```java\r\npackage com.zjh.generator;\r\n\r\nimport com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;\r\nimport com.baomidou.mybatisplus.core.toolkit.StringPool;\r\nimport com.baomidou.mybatisplus.core.toolkit.StringUtils;\r\nimport com.baomidou.mybatisplus.generator.AutoGenerator;\r\nimport com.baomidou.mybatisplus.generator.InjectionConfig;\r\nimport com.baomidou.mybatisplus.generator.config.*;\r\nimport com.baomidou.mybatisplus.generator.config.po.TableInfo;\r\nimport com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;\r\nimport com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;\r\n\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\nimport java.util.Scanner;\r\n\r\n// 演示例子，执行 main 方法控制台输入模块表名回车自动生成对应项目目录中\r\npublic class CodeGenerator {\r\n\r\n    /**\r\n     * <p>\r\n     * 读取控制台内容\r\n     * </p>\r\n     */\r\n    public static String scanner(String tip) {\r\n        Scanner scanner = new Scanner(System.in);\r\n        StringBuilder help = new StringBuilder();\r\n        help.append(\"请输入\" + tip + \"：\");\r\n        System.out.println(help.toString());\r\n        if (scanner.hasNext()) {\r\n            String ipt = scanner.next();\r\n            if (StringUtils.isNotBlank(ipt)) {\r\n                return ipt;\r\n            }\r\n        }\r\n        throw new MybatisPlusException(\"请输入正确的\" + tip + \"！\");\r\n    }\r\n\r\n    public static void main(String[] args) {\r\n        // 代码生成器\r\n        AutoGenerator mpg = new AutoGenerator();\r\n\r\n        // 全局配置\r\n        GlobalConfig gc = new GlobalConfig();\r\n        String projectPath = System.getProperty(\"user.dir\");\r\n        gc.setOutputDir(projectPath + \"/src/main/java\");\r\n        gc.setAuthor(\"zhh\");\r\n        gc.setOpen(false);\r\n        // gc.setSwagger2(true); 实体属性 Swagger2 注解\r\n        mpg.setGlobalConfig(gc);\r\n\r\n        // 数据源配置\r\n        DataSourceConfig dsc = new DataSourceConfig();\r\n        dsc.setUrl(\"jdbc:mysql://localhost:3306/demo?useUnicode=true&useSSL=false&characterEncoding=utf8\");\r\n        // dsc.setSchemaName(\"public\");\r\n        dsc.setDriverName(\"com.mysql.jdbc.Driver\");\r\n        dsc.setUsername(\"root\");\r\n        dsc.setPassword(\"root\");\r\n        mpg.setDataSource(dsc);\r\n\r\n        // 包配置\r\n        PackageConfig pc = new PackageConfig();\r\n//        pc.setModuleName(scanner(\"模块名\"));\r\n        pc.setParent(\"com.zjh\").setEntity(\"pojo\")\r\n            .setMapper(\"mapper\")\r\n            .setService(\"service\")\r\n            .setServiceImpl(\"service.impl\")\r\n            .setController(\"controller\");\r\n        mpg.setPackageInfo(pc);\r\n\r\n        // 自定义配置\r\n        InjectionConfig cfg = new InjectionConfig() {\r\n            @Override\r\n            public void initMap() {\r\n                // to do nothing\r\n            }\r\n        };\r\n\r\n        // 如果模板引擎是 freemarker\r\n        String templatePath = \"/templates/mapper.xml.ftl\";\r\n        // 如果模板引擎是 velocity\r\n        // String templatePath = \"/templates/mapper.xml.vm\";\r\n\r\n        // 自定义输出配置\r\n        List<FileOutConfig> focList = new ArrayList<>();\r\n        // 自定义配置会被优先输出\r\n        focList.add(new FileOutConfig(templatePath) {\r\n            @Override\r\n            public String outputFile(TableInfo tableInfo) {\r\n                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！\r\n//                return projectPath + \"/src/main/resources/mapper/\" + pc.getModuleName()\r\n//                        + \"/\" + tableInfo.getEntityName() + \"Mapper\" + StringPool.DOT_XML;\r\n                return projectPath + \"/src/main/resources/mapper/\"\r\n                        + \"/\" + tableInfo.getEntityName() + \"Mapper\" + StringPool.DOT_XML;\r\n            }\r\n        });\r\n        /*\r\n        cfg.setFileCreate(new IFileCreate() {\r\n            @Override\r\n            public boolean isCreate(ConfigBuilder configBuilder, FileType fileType, String filePath) {\r\n                // 判断自定义文件夹是否需要创建\r\n                checkDir(\"调用默认方法创建的目录，自定义目录用\");\r\n                if (fileType == FileType.MAPPER) {\r\n                    // 已经生成 mapper 文件判断存在，不想重新生成返回 false\r\n                    return !new File(filePath).exists();\r\n                }\r\n                // 允许生成模板文件\r\n                return true;\r\n            }\r\n        });\r\n        */\r\n        cfg.setFileOutConfigList(focList);\r\n        mpg.setCfg(cfg);\r\n\r\n        // 配置模板\r\n        TemplateConfig templateConfig = new TemplateConfig();\r\n\r\n        // 配置自定义输出模板\r\n        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别\r\n        // templateConfig.setEntity(\"templates/entity2.java\");\r\n        // templateConfig.setService();\r\n        // templateConfig.setController();\r\n\r\n        templateConfig.setXml(null);\r\n        mpg.setTemplate(templateConfig);\r\n\r\n        // 策略配置\r\n        StrategyConfig strategy = new StrategyConfig();\r\n\r\n        strategy.setNaming(NamingStrategy.underline_to_camel);\r\n        strategy.setColumnNaming(NamingStrategy.underline_to_camel);\r\n//        strategy.setSuperEntityClass(\"你自己的父类实体,没有就不用设置!\");\r\n        strategy.setEntityLombokModel(true);\r\n        strategy.setRestControllerStyle(true);\r\n        // 公共父类\r\n//        strategy.setSuperControllerClass(\"你自己的父类控制器,没有就不用设置!\");\r\n        // 写于父类中的公共字段\r\n        strategy.setSuperEntityColumns(\"id\");\r\n        strategy.setInclude(scanner(\"表名，多个英文逗号分割\").split(\",\"));\r\n        strategy.setControllerMappingHyphenStyle(true);\r\n        strategy.setTablePrefix(pc.getModuleName() + \"_\");\r\n        mpg.setStrategy(strategy);\r\n        mpg.setTemplateEngine(new FreemarkerTemplateEngine());\r\n        mpg.execute();\r\n    }\r\n\r\n}\r\n\r\n```\r\n\r\n### 3 运行 CodeGenerator 完成', '2021-04-20 09:36:59', '', '原创', '', '', '\0', '逆向工程', '2021-04-20 12:43:59', null, '15', '1');
INSERT INTO `t_blog` VALUES ('27', '', '', '## SSM整合\r\n\r\n#### 1、创建一个maven项目 ssm\r\n\r\n#### 2、导入依赖\r\n\r\n```xml\r\n <dependencies>\r\n        <dependency>\r\n            <groupId>junit</groupId>\r\n            <artifactId>junit</artifactId>\r\n            <version>4.13.1</version>\r\n            <scope>test</scope>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>mysql</groupId>\r\n            <artifactId>mysql-connector-java</artifactId>\r\n            <version>5.1.47</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>com.mchange</groupId>\r\n            <artifactId>c3p0</artifactId>\r\n            <version>0.9.5.5</version>\r\n        </dependency>\r\n\r\n        <dependency>\r\n            <groupId>javax.servlet</groupId>\r\n            <artifactId>servlet-api</artifactId>\r\n            <version>2.5</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>org.projectlombok</groupId>\r\n            <artifactId>lombok</artifactId>\r\n            <version>1.18.18</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>javax.servlet.jsp</groupId>\r\n            <artifactId>javax.servlet.jsp-api</artifactId>\r\n            <version>2.3.3</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>javax.servlet.jsp.jstl</groupId>\r\n            <artifactId>jstl</artifactId>\r\n            <version>1.2</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>org.mybatis</groupId>\r\n            <artifactId>mybatis</artifactId>\r\n            <version>3.5.6</version>\r\n        </dependency>\r\n\r\n        <dependency>\r\n            <groupId>org.mybatis</groupId>\r\n            <artifactId>mybatis-spring</artifactId>\r\n            <version>2.0.6</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>org.springframework</groupId>\r\n            <artifactId>spring-webmvc</artifactId>\r\n            <version>5.1.9.RELEASE</version>\r\n        </dependency>\r\n        <dependency>\r\n            <groupId>org.springframework</groupId>\r\n            <artifactId>spring-jdbc</artifactId>\r\n            <version>5.1.9.RELEASE</version>\r\n        </dependency>\r\n    </dependencies>\r\n```\r\n\r\n#### 创建包\r\n\r\n- com.zjh\r\n  - dao\r\n    - UserMapper\r\n  - pojo\r\n    - User\r\n  - service\r\n    - UserService\r\n    - UserServiceImpl\r\n  - controller\r\n    - UserController\r\n- resourcces\r\n  - com.zjh.dao\r\n    - UserMapper.xml\r\n  - db.properties\r\n  - mybatis-config.xml\r\n  - applicationContext.xml\r\n  - spring-dao.xml\r\n  - spring-service.xml\r\n  - spring-mvc.xml\r\n\r\n#### 3、写配置文件\r\n\r\n##### Mybatis层面的配置文件\r\n\r\n###### 1、db.properties\r\n\r\n```properties\r\njdbc.driver = com.mysql.jdbc.Driver\r\njdbc.url = jdbc:mysql://localhost:3306/demo\r\njdbc.username = root\r\njdbc.password = roo\r\n```\r\n\r\n\r\n\r\n###### 2、mybaits-config.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE configuration\r\n        PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\r\n<configuration>\r\n\r\n    配置别名\r\n    <typeAliases>\r\n        <package name=\"com.zjh.pojo\"/>\r\n    </typeAliases>\r\n\r\n    映射路径\r\n    <mappers>\r\n        <mapper resource=\"com/zjh/dao/UserMapper.xml\"/>\r\n    </mappers>\r\n\r\n</configuration>\r\n```\r\n\r\n\r\n\r\n###### 3、spring-dao.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\r\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n       xmlns:context=\"http://www.springframework.org/schema/context\"\r\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd\">\r\n\r\n    1.加载db.properties资源文件\r\n    <context:property-placeholder location=\"classpath:db.properties\"/>\r\n    2.c3p0 的数据源配置\r\n    <bean id=\"dataSource\" class=\"com.mchange.v2.c3p0.ComboPooledDataSource\">\r\n        <property name=\"driverClass\" value=\"${jdbc.driver}\"/>\r\n        <property name=\"jdbcUrl\" value=\"${jdbc.url}\"/>\r\n        <property name=\"user\"  value=\"${jdbc.username}\"/>\r\n        <property name=\"password\" value=\"${jdbc.password}\"/>\r\n    </bean>\r\n    3.sqlSessionFactory\r\n    <bean id=\"sqlSessionFactory\" class=\"org.mybatis.spring.SqlSessionFactoryBean\">\r\n        <property name=\"dataSource\" ref=\"dataSource\"/>\r\n        <property name=\"configLocation\" value=\"classpath:mybatis-config.xml\"/>\r\n\r\n    </bean>\r\n\r\n    4.自动扫描包 MapperScannerConfigurer\r\n    <bean class=\"org.mybatis.spring.mapper.MapperScannerConfigurer\">\r\n        <property name=\"sqlSessionFactoryBeanName\" value=\"sqlSessionFactory\"/>\r\n        <property name=\"basePackage\" value=\"com.zjh.dao\"/>\r\n    </bean>\r\n\r\n</beans>\r\n```\r\n\r\n- - \r\n\r\n##### 4、UserMapper接口\r\n\r\n```java\r\npublic interface UserMapper {\r\n    //查询所有用户\r\n    List<User> queryAllUser();\r\n    //添加一个用户\r\n    int addUser(User user);\r\n    //修改一个用户\r\n    int updateUser(User user);\r\n    //删除一个用户\r\n    int deleteUser(@Param(\"id\") int id);\r\n    //根据id查询用户\r\n    User queryUserById(@Param(\"id\")int id);\r\n\r\n    //根据用户名查询\r\n    User queryUserByName(@Param(\"username\")String username);\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n##### 5、UserMapper.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper\r\n        PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\r\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\r\n<mapper namespace=\"com.zjh.dao.UserMapper\">\r\n\r\n    <select id=\"queryAllUser\" resultType=\"user\">\r\n        select * from user;\r\n    </select>\r\n\r\n    <insert id=\"addUser\" parameterType=\"user\">\r\n        insert into user(username,password)\r\n        values(#{username},#{password})\r\n    </insert>\r\n\r\n    <update id=\"updateUser\" parameterType=\"user\">\r\n        update user set password = #{password}\r\n        where id=#{id} ;\r\n    </update>\r\n\r\n    <delete id=\"deleteUser\">\r\n        delete from user where id = #{id};\r\n    </delete>\r\n\r\n    <select id=\"queryUserById\" resultType=\"user\">\r\n        select * from user where id = #{id}\r\n    </select>\r\n\r\n    <select id=\"queryUserByName\" resultType=\"user\">\r\n        select * from user where username = #{username};\r\n    </select>\r\n\r\n\r\n</mapper>\r\n```\r\n\r\n\r\n\r\n##### 6、Service层面的配置\r\n\r\n###### UserService接口\r\n\r\n```xml\r\npublic interface UserService {\r\n\r\n    //查询所有用户\r\n    List<User> queryAllUser();\r\n    //添加一个用户\r\n    int addUser(User user);\r\n    //修改一个用户\r\n    int updateUser(User user);\r\n    //删除一个用户\r\n    int deleteUser(int id);\r\n    //根据id查询用户\r\n    User queryUserById(int id);\r\n\r\n    //根据用户名查询\r\n    User queryUserByName(String username);\r\n\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n###### 7、UserServiceImpl实现类\r\n\r\n```java\r\npublic class UserServiceImpl implements UserService {\r\n\r\n    private UserMapper userMapper;\r\n\r\n    public void setUserMapper(UserMapper userMapper) {\r\n        this.userMapper = userMapper;\r\n    }\r\n\r\n    public List<User> queryAllUser() {\r\n        return userMapper.queryAllUser();\r\n    }\r\n\r\n    public int addUser(User user) {\r\n        return userMapper.addUser(user);\r\n    }\r\n\r\n    public int updateUser(User user) {\r\n        return userMapper.updateUser(user);\r\n    }\r\n\r\n    public int deleteUser(int id) {\r\n        return userMapper.deleteUser(id);\r\n    }\r\n\r\n    public User queryUserById(int id) {\r\n        return userMapper.queryUserById(id);\r\n    }\r\n\r\n    public User queryUserByName(String username) {\r\n        return userMapper.queryUserByName(username);\r\n    }\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n###### 8、spring-service.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\r\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n       xmlns:context=\"http://www.springframework.org/schema/context\"\r\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd\">\r\n\r\n    <context:component-scan base-package=\"com.zjh.service\"/>\r\n\r\n    <bean id=\"userService\" class=\"com.zjh.service.UserServiceImpl\">\r\n        <property name=\"userMapper\" ref=\"userMapper\"/>\r\n    </bean>\r\n\r\n</beans>\r\n\r\n```\r\n\r\n###### 9、web.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<web-app xmlns=\"http://xmlns.jcp.org/xml/ns/javaee\"\r\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n         xsi:schemaLocation=\"http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd\"\r\n         version=\"4.0\">\r\n\r\n    前端控制器\r\n    <servlet>\r\n        <servlet-name>DispactherServlet</servlet-name>\r\n        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>\r\n        <init-param>\r\n            <param-name>contextConfigLocation</param-name>\r\n            <param-value>classpath:applicationContext.xml</param-value>\r\n        </init-param>\r\n        <load-on-startup>1</load-on-startup>\r\n    </servlet>\r\n    <servlet-mapping>\r\n        <servlet-name>DispactherServlet</servlet-name>\r\n        <url-pattern>/</url-pattern>\r\n    </servlet-mapping>\r\n\r\n    过滤器\r\n    <filter>\r\n        <filter-name>encoding</filter-name>\r\n        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>\r\n        <init-param>\r\n            <param-name>encoding</param-name>\r\n            <param-value>utf-8</param-value>\r\n        </init-param>\r\n    </filter>\r\n\r\n    <filter-mapping>\r\n        <filter-name>encoding</filter-name>\r\n        <url-pattern>/*</url-pattern>\r\n    </filter-mapping>\r\n\r\n\r\n\r\n</web-app>\r\n\r\n```\r\n\r\n###### 10、spring-mvc.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\r\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n       xmlns:context=\"http://www.springframework.org/schema/context\"\r\n       xmlns:mvc=\"http://www.springframework.org/schema/mvc\"\r\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/mvc https://www.springframework.org/schema/mvc/spring-mvc.xsd\">\r\n\r\n    <context:component-scan base-package=\"com.zjh.controller\"/>\r\n    <mvc:default-servlet-handler/>\r\n    <mvc:annotation-driven/>\r\n\r\n    <bean id=\"internalResourceViewResolver\" class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\">\r\n        <property name=\"prefix\" value=\"/WEB-INF/jsp/\"/>\r\n        <property name=\"suffix\" value=\".jsp\"/>\r\n\r\n    </bean>\r\n\r\n\r\n</beans>\r\n\r\n```\r\n\r\n###### 11、applicationContext.xml\r\n\r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\r\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd\">\r\n\r\n    <import resource=\"classpath:spring-dao.xml\"/>\r\n    <import resource=\"classpath:spring-service.xml\"/>\r\n    <import resource=\"classpath:spring-mvc.xml\"/>\r\n\r\n</beans>\r\n\r\n```\r\n\r\n###### 12、UserController\r\n\r\n```java\r\npackage com.zjh.controller;\r\n\r\nimport com.zjh.pojo.User;\r\nimport com.zjh.service.UserService;\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.stereotype.Controller;\r\nimport org.springframework.ui.Model;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\n\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\n\r\n@Controller\r\npublic class UserController {\r\n    @Autowired\r\n    private UserService userService;\r\n\r\n    @RequestMapping(\"/queryAllUser\")\r\n    public String queryAllUser(Model model){\r\n        List<User> users = userService.queryAllUser();\r\n        model.addAttribute(\"users\",users);\r\n        return \"user\";\r\n    }\r\n\r\n\r\n    @RequestMapping(\"/toAddUser\")\r\n    public String toAddUser(){\r\n        return \"addUser\";\r\n    }\r\n\r\n    @RequestMapping(\"/addUser\")\r\n    public String addUser(User user){\r\n        userService.addUser(user);\r\n        return \"redirect:queryAllUser\";\r\n    }\r\n\r\n    @RequestMapping(\"/toUpdateUser\")\r\n    public String toUpdateUser(int id,Model model){\r\n        User user = userService.queryUserById(id);\r\n\r\n        model.addAttribute(\"user\",user);\r\n        return \"updateUser\";\r\n    }\r\n\r\n    @RequestMapping(\"/updateUser\")\r\n    public String updateUser(User user){\r\n        int i = userService.updateUser(user);\r\n\r\n        return \"redirect:queryAllUser\";\r\n    }\r\n\r\n    @RequestMapping(\"/deleteUser\")\r\n    public String deleteUser(int id){\r\n\r\n        userService.deleteUser(id);\r\n\r\n        return \"redirect:queryAllUser\";\r\n    }\r\n\r\n    @RequestMapping(\"/queryUserByName\")\r\n    public String queryUserByName(String username,Model model){\r\n\r\n        User user = userService.queryUserByName(username);\r\n        if(user==null){\r\n            System.out.println(\"没有此人！！！\");\r\n            model.addAttribute(\"error\",\"没有此人！！！\");\r\n            return \"redirect:queryAllUser\";\r\n        }\r\n        System.out.println(\"查询的用户对象：\"+user);\r\n        List<User> users = new ArrayList<User>();\r\n        users.add(user);\r\n\r\n        model.addAttribute(\"users\",users);\r\n        return \"user\";\r\n    }\r\n\r\n\r\n\r\n}\r\n\r\n\r\n```\r\n\r\n', '2021-04-20 12:25:52', '', '原创', '\0', '\0', '\0', 'ssm整合', '2021-04-20 12:44:13', null, '15', '1');
INSERT INTO `t_blog` VALUES ('28', '', '', '## 什么是面向对象？\r\n\r\n#### 面向过程 & 面向对象\r\n\r\n- 面向过程思想 （线性思维）\r\n  - 步骤清晰简单，第一步做什么，第二步做什么...\r\n  - 面向过程适合处理一些较为简单的问题\r\n- 面向对象\r\n  - 分类的思维模式，思考问题首先会解决问题需要那些分类，然后对这些分类进行单独思考。最后，才对某个分类下的细节进行面向过程的思索。\r\n  - 面向对象适合处理复杂的问题，适合处理需要多人协作的问题。\r\n\r\n\r\n\r\n#### 什么是面向对象\r\n\r\n- **面向对象编程**（Object-Oriented Programming，OOP）\r\n- **面向对象编程的本质就是：** 以类的方式组织代码，以对象的形式组织（封装）数据。\r\n\r\n\r\n\r\n- 抽象\r\n\r\n\r\n\r\n- 三大特征\r\n  - 封装\r\n  - 继承\r\n  - 多态\r\n\r\n#### 构造器\r\n\r\n##### 构造器：\r\n\r\n1. 和类名相同\r\n\r\n2. 没有返回值\r\n\r\n   ##### 作用:\r\n\r\n   1. new 本质在调用构造方法\r\n   2. 初始化对象的值\r\n\r\n   注意点：\r\n\r\n   1. 在定义有参构造之后，如果想要使用无参构造，就需要在定义一个无参构造\r\n\r\n   快捷键：Alt + Insert\r\n\r\n\r\n\r\n继承\r\n\r\nObject 在java中，所有的类，都默认直接或间接继承Object\r\n\r\n\r\n\r\n#### 重写\r\n\r\n- 重写需要有继承关系，子类重写父类的方法\r\n  - 方法名必须相同\r\n  - 参数列表必须相同\r\n  - 修饰符范围可以扩大\r\n\r\n\r\n\r\n#### 多态\r\n\r\n- 多态注意事项：\r\n  - 多态是方法的多态，属性没有多态\r\n  - 父类和子类，要有联系，就比如，鱼不能转换成人 ， 类型转换异常 ClassCastException\r\n  - 存在的条件：首先要有继承关系，方法需要重写，如果调用的都是各自的方法就有任何区别了，父类的引用指向子类对象\r\n    - 不能重写的方法\r\n      - static 方法，属于类，它不属于实例\r\n      - final 常量 不可变的；\r\n      - private方法；\r\n\r\n、\r\n\r\n#### instanceof \r\n\r\n- instanceof 	（类型转换） 引用类型，判断一个对象是什么类型的\r\n  - System.out.println(student instanceof Student);\r\n\r\n\r\n\r\n#### 抽象\r\n\r\n- 不能new抽象类，只能靠子类去实现它：约束\r\n- 抽象类中可以有普通方法\r\n- 抽象方法必须在抽象类中\r\n- 抽象的抽象： 约束\r\n\r\n#### 接口\r\n\r\n- 作用\r\n  - 约束\r\n  - 定义一些方法，让不同的人实现\r\n  - public abstract 方法都是抽象的\r\n  - public static final 属性都是常量\r\n  - 接口不能被实例化，接口中没有构造方法\r\n  - implements可以实现多个接口\r\n  - 必须重写接口中的所有方法\r\n  - ', '2021-04-20 13:04:53', '', '原创', '', '', '', '面向对象', '2021-04-20 13:04:53', '0', '15', '2');
INSERT INTO `t_blog` VALUES ('29', '\0', '\0', '# jwt\r\n\r\n- 开放的行业标准.\r\n- 三部分组成：头，负载 ，盐\r\n  - HS256 编码\r\n\r\n\r\n\r\n英文\r\n\r\n```\r\ncurrentTimeMillis    当前的时间/ 毫秒\r\nsetSubject           设置主题\r\nsetIssuedAt          设置发行时间  地点/时间\r\nsignWith             签名\r\nsetExpiration		 设置过期时间\r\nparser               解析\r\nparseClaimsJws       解析token\r\n```\r\n\r\n\r\n\r\n### 使用jwt生成令牌Token：\r\n\r\n- 创建一个项目 jjtwdemo\r\n\r\n- 依赖\r\n\r\n  ```pom\r\n  jjwt 依赖\r\n  <!-- https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt -->\r\n  <dependency>\r\n      <groupId>io.jsonwebtoken</groupId>\r\n      <artifactId>jjwt</artifactId>\r\n      <version>0.9.1</version>\r\n  </dependency>\r\n  \r\n  		<dependency>\r\n              <groupId>org.springframework.boot</groupId>\r\n              <artifactId>spring-boot-starter-web</artifactId>\r\n          </dependency>\r\n  ```\r\n\r\n  String s = Base64Codec.BASE64.decodeToString(token);\r\n\r\n  System.out.println(s);\r\n\r\n#### 1 生成Token\r\n\r\n1. 通过 jwts.builder() 创建 JwtBuilder 构建对象，构建信息，生成 token 令牌\r\n\r\n   ```java\r\n    @Test\r\n       public void testCreateToken(){\r\n   \r\n           //1 通过 jwts.builder(); 创建一个JwtBuilder构建对象\r\n           JwtBuilder jwtBuilder = Jwts.builder()\r\n                   //声明的标识{\"jti\":\"888\"}  id\r\n                   .setId(\"8888\")\r\n                   //主题，用户{\"sub\":\"Rose\"}\r\n                   .setSubject(\"Rose\")\r\n                   //创建日期 {\"ita\":\"xxxxxxxx\"}\r\n                   .setIssuedAt(new Date())\r\n                   //使用 signWith 准备签名 ，参数是 （算法，\"盐\"）\r\n                   .signWith(SignatureAlgorithm.HS256,\"xxxx\");\r\n           //2 上面jwt的构建对象就好了 ，有了jwt的构建对象后 ，就可以去生成 jwt 令牌了\r\n           //3 通过 jwtBuilder.compact() 生成令牌\r\n           String token = jwtBuilder.compact();\r\n           System.out.println(token);\r\n   \r\n           System.out.println(\"--------------------------------\");\r\n           //4 通过 Base64Codec.BASE64.decodeToString(token) 将 生成的token 转义出来\r\n           //签名是无法解译 出来的，因为他涉及到了 盐，所以转义出来是，乱码\r\n           String s = Base64Codec.BASE64.decodeToString(token);\r\n           System.out.println(s);\r\n   \r\n       }\r\n   \r\n   ```\r\n\r\n   \r\n\r\n#### 2 解析token\r\n\r\n\r\n\r\n```java\r\n  @Test\r\n    public void testParseToken(){\r\n        // 1 token 令牌\r\n        String token = \"eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI4ODg4Iiwic3ViIjoiUm9zZSIsImlhdCI6MTYxNzQzMDc2OH0.CmtESIwwVlJPy5HEDHwAQAhyn5rgS4ZNKnkMj60h68s\";\r\n        // 2 通过 Jwts.parser() 解析 token\r\n        \r\n        Claims claims = Jwts.parser()//解析 token 获取负载中 声明的 对象\r\n                //2.1 然后呢 我们需要准备 密钥，也就是 盐\r\n                .setSigningKey(\"xxxx\") //设置盐\r\n                //2.2 有了密钥后 ，把token 放进去\r\n                .parseClaimsJws(token)  //解析的 token\r\n                // 2.3 然后我们拿到 解析后的主体\r\n                .getBody();               //获得body\r\n\r\n        System.out.println(\"id:\"+claims.getId());  //id\r\n        System.out.println(\"subject:\"+claims.getSubject());  //主题\r\n        System.out.println(\"issuedAt:\"+claims.getIssuedAt()); //时间\r\n    }\r\n\r\n```\r\n\r\n\r\n\r\n#### 3 设置Token 失效时间\r\n\r\n```java\r\n//设置\r\n@Test\r\n    void contextLoads() {\r\n        //获得当前的系统时间 System.currentTimeMillis();\r\n        long now = System.currentTimeMillis();\r\n        long time= now + 60 * 1000;\r\n        JwtBuilder builder = Jwts.builder()\r\n                .setId(\"999\")\r\n                .setSubject(\"王洋\")\r\n                .setIssuedAt(new Date())\r\n                .signWith(SignatureAlgorithm.HS256,\"1111\")\r\n                //设置 过期时间 .setExpiration(new Date(time));\r\n                .setExpiration(new Date(time));\r\n        String token = builder.compact();\r\n        System.out.println(token);\r\n    }\r\n```\r\n\r\n```java\r\n//打印\r\n @Test\r\n    public void testParserToken(){\r\n\r\n        Claims claims = Jwts.parser()\r\n                .setSigningKey(\"1111\")\r\n                .parseClaimsJws(\"eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5OTkiLCJzdWIiOiLnjovmtIsiLCJpYXQiOjE2MTc0NDQzNTUsImV4cCI6MTYxNzQ0NDQxNX0.mhTEZkwq3iwIzRzYPgU5_SmL9EAsErnmZOYyHd5tLjU\")\r\n                .getBody();\r\n\r\n        System.out.println(claims.getSubject());\r\n        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(\"yyy-mm-dd HH:mm:ss\");\r\n        System.out.println(\"失效时间：\"+simpleDateFormat.format(claims.getExpiration()));\r\n\r\n    }\r\n\r\n```\r\n\r\n#### 4 自定义 设置 Token 声明\r\n\r\n .claim(\"roles\",\"开发人员\")    自定义 声明\r\n\r\nclaims.get(\"roles\");  获得 自定义 声明\r\n\r\n```java\r\n//自定义 设置 token   \r\n// claim（） 自定义 声明\r\n@Test\r\n    void contextLoads() {\r\n        //获得当前的系统时间 System.currentTimeMillis();\r\n        long now = System.currentTimeMillis();\r\n        long time= now + 60 * 1000;\r\n        JwtBuilder builder = Jwts.builder()\r\n                .setId(\"999\")\r\n                .setSubject(\"王洋\")\r\n                .setIssuedAt(new Date())\r\n                .signWith(SignatureAlgorithm.HS256,\"1111\")\r\n                //设置 过期时间 .setExpiration(new Date(time));\r\n                .setExpiration(new Date(time))\r\n                //通过 claim（） 自定义 声明\r\n                .claim(\"roles\",\"开发人员\")\r\n                .claim(\"authority\",\"管理员\")\r\n                ;\r\n        String token = builder.compact();\r\n        System.out.println(token);\r\n        System.out.println(new SimpleDateFormat().format(now));\r\n        System.out.println(new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(now));\r\n    }\r\n```\r\n\r\n```java\r\n// 通过 claims.get(\"roles\");  获得 自定义 声明\r\n    @Test\r\n    public void testParserToken(){\r\n\r\n        Claims claims = Jwts.parser()\r\n                .setSigningKey(\"1111\")\r\n                .parseClaimsJws(\"eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5OTkiLCJzdWIiOiLnjovmtIsiLCJpYXQiOjE2MTc0NDU4MjgsImV4cCI6MTYxNzQ0NTg4OCwicm9sZXMiOiLlvIDlj5HkurrlkZgiLCJhdXRob3JpdHkiOiLnrqHnkIblkZgifQ.SVsxOdAN0sjsdcrL4Lx31rtqGbOpQqRCjfuQJ5ifUVw\")\r\n                .getBody();\r\n\r\n        System.out.println(claims.getSubject());\r\n        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(\"yyy-mm-dd HH:mm:ss\");\r\n        System.out.println(\"失效时间：\"+simpleDateFormat.format(claims.getExpiration()));\r\n\r\n        //获得 自定义 声明 通过 claims.get(\"roles\");\r\n        Object roles = claims.get(\"roles\");\r\n        System.out.println(roles);\r\n\r\n    }\r\n```\r\n\r\n\r\n\r\n#### 5 自定义 jwt 工具类\r\n\r\n```java\r\npackage com.zjh.utils;\r\n\r\nimport com.zjh.pojo.User;\r\nimport io.jsonwebtoken.Claims;\r\nimport io.jsonwebtoken.Jwts;\r\nimport io.jsonwebtoken.SignatureAlgorithm;\r\n\r\nimport java.util.HashMap;\r\nimport java.util.Map;\r\n\r\npublic class JwtUtils {\r\n\r\n    public static final String CLAIM_KEY_USERNAME = \"sub\";\r\n    private static final String CLAIM_KEY_CREATED = \"created\";\r\n\r\n    //生成 token\r\n    public String generateToken(User user){\r\n        Map<String,Object> map = new HashMap<String, Object>();\r\n        map.put(CLAIM_KEY_USERNAME,user.getUsername());\r\n        map.put(\"set\",user.getSex());\r\n        return Jwts.builder()\r\n                .setClaims(map)\r\n                .signWith(SignatureAlgorithm.HS256,\"1111\")\r\n                .compact();\r\n    }\r\n\r\n    //获得 用户名字\r\n    public String getTokenUser(String token){\r\n        Claims body = Jwts.parser()\r\n                .setSigningKey(\"1111\")\r\n                .parseClaimsJws(token)\r\n                .getBody();\r\n\r\n        Object username = body.get(\"sub\");\r\n        String s = username.toString();\r\n\r\n        return s;\r\n\r\n    }\r\n\r\n\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n```java\r\njwt:\r\n  # JWT 存储的请求头\r\n  tokenHeader: Authorization\r\n  # jwt 加密使用的密钥 盐\r\n  secret: zh-secret\r\n  # JWT 的过期时间  （60*60*24）\r\n  expiration: 604800\r\n  # JWT 负载中拿到的开头\r\n  tokenHead: Bearer\r\n\r\n```\r\n\r\n', '2021-04-20 23:51:47', '', '原创', '', '', '', 'jwt使用', '2021-04-20 23:51:47', '0', '15', '1');

-- ----------------------------
-- Table structure for t_blog_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_copy`;
CREATE TABLE `t_blog_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` int(20) NOT NULL,
  `commentabled` int(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `first_picture` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `published` int(10) NOT NULL,
  `recommend` int(10) NOT NULL,
  `share_statement` int(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK292449gwg5yf7ocdlmswv9w4j` (`type_id`),
  KEY `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`),
  CONSTRAINT `t_blog_copy_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `t_blog_copy_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog_copy
-- ----------------------------
INSERT INTO `t_blog_copy` VALUES ('1', '0', '0', null, null, null, null, '0', '1', '0', '学习清单', null, null, null, null);
INSERT INTO `t_blog_copy` VALUES ('2', '7418', '45656', null, null, null, '0', '0', '0', '0', '0', null, null, null, null);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags` (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  KEY `FK5feau0gb4lq47fdb03uboswm8` (`tags_id`),
  KEY `FKh4pacwjwofrugxa9hpwaxg6mr` (`blogs_id`),
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`),
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES ('22', '2');
INSERT INTO `t_blog_tags` VALUES ('22', '1');
INSERT INTO `t_blog_tags` VALUES ('22', '10');
INSERT INTO `t_blog_tags` VALUES ('25', '1');
INSERT INTO `t_blog_tags` VALUES ('26', '1');
INSERT INTO `t_blog_tags` VALUES ('27', '1');
INSERT INTO `t_blog_tags` VALUES ('28', '1');
INSERT INTO `t_blog_tags` VALUES ('29', '1');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKke3uogd04j4jx316m1p51e05u` (`blog_id`),
  KEY `FK4jj284r3pb7japogvo6h72q95` (`parent_comment_id`),
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`),
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('1', 'java');
INSERT INTO `t_tag` VALUES ('2', '标签更新测试');
INSERT INTO `t_tag` VALUES ('10', '添加标签测试');
INSERT INTO `t_tag` VALUES ('11', '标签标签');
INSERT INTO `t_tag` VALUES ('12', '博客添加标签测试');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('14', '分类测试');
INSERT INTO `t_type` VALUES ('15', 'java');
INSERT INTO `t_type` VALUES ('18', '修改测试1');
INSERT INTO `t_type` VALUES ('24', '分类新增测试');
INSERT INTO `t_type` VALUES ('25', '博客添加分类测试');
INSERT INTO `t_type` VALUES ('26', 'qwe');
INSERT INTO `t_type` VALUES ('27', 'eqwe');
INSERT INTO `t_type` VALUES ('28', 'fdsf');
INSERT INTO `t_type` VALUES ('29', 'fsdfxcf');
INSERT INTO `t_type` VALUES ('30', 'xcvxccv');
INSERT INTO `t_type` VALUES ('31', 'fg');
INSERT INTO `t_type` VALUES ('32', 'rg');
INSERT INTO `t_type` VALUES ('33', 'r');
INSERT INTO `t_type` VALUES ('34', 'gr');
INSERT INTO `t_type` VALUES ('35', 'g');
INSERT INTO `t_type` VALUES ('36', 'dfgg');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', null, null, null, null, '123', null, null, 'admin');
INSERT INTO `t_user` VALUES ('2', null, null, null, null, '111', null, null, 'root');
