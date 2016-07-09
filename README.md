### myFoodPOS订餐系统
- 本项目是一个快餐店的收银系统POS，实现了对快餐产品的管理及销售功能。
- 使用到的编程语言有：Java、JSP、HTML、CSS以及Javascript，按照MVC模型分层实现各功能，有实体层、数据库层、接口层、接口实现层、动作层以及JSP页面，对应Web project中的entity/db/service/service.impl/action包以及Web Root目录，其中前四者为M（模型），动作层为C（控制器），JSP页面为V（视图层）。使用jdbc连接mysql数据库，并使用junit进行单元测试。


- 系统的用户有店长以及店员，分别有不同的职责
 - 店长负责店内产品、订单等的管理
 - 店员负责处理客户的订单及支付


- 项目的不足
 - 不够体现“快餐”系统的特殊性，与一般pos系统无异！没有外卖、送餐服务
 - 使用hibernate以及struts显得十分臃肿，应该及时替换成spring
