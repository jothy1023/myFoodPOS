#21-myFoodPOS
本项目使用到的编程语言有：Java、JSP、HTML、CSS以及Javascript，按照MVC模型分层实现各功能，有实体层、数据库层、接口层、接口实现层、动作层以及JSP页面，对应Web project中的entity/db/service/service.impl/action包以及Web Root目录，其中前四者为M（模型），动作层为C（控制器），JSP页面为V（视图层）。
	现阶段项目仅实现了MVC中的M，用到了Hibernate4.3.11，以及jdbc连接mysql数据库，并使用junit进行单元测试。
	下面说明各包的内容：
1.	entity：Food食品类，声明属性与方法；Food.hbm.xml文件，实体映射文件，Hibernate框架要求每一个类对应一个实体映射文件。
2.	db：MyHibernateSessionFactory工具类，构造会话工厂对象，	以单例模式建立会话，用于接口的实现。
3.	service：FoodDAO类，即业务逻辑接口类，声明Food类要实现的方法。
4.	service.impl：FoodDAOImpl类，实现FoodDAO接口中声明的方法，通过实例化db中的工具类，以会话工厂的模式建立会话，调用Session中的相关方法实现对数据库的操作。
此外，还需配置hibernate.cfg.xml文件，用于配置数据库连接参数，以及添加映射文件到配置文档。
最后，对项目进行单元测试，这里我们选择TDD模式，即Test Drive Development（测试驱动开发），从测试的角度来检验整个项目，尽量减少程序逻辑方面的错误，尽可能地减少项目中的bug。测试代码分别存放于test包中的entity包和service.impl包中。entity中保存TestFood类，负责生成表结构。service.impl包中保存TestServiceImpl类，负责测试产品类别的CRUD功能。
