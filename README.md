
说明：本项目采用C#语言开发，使用SqlServer数据库，并且采用了EntityFramework框架。连接字符串的存放位置：Exam001\Exam001\App.congif

技术博客：https://daixiang.blog.csdn.net

 - 登录界面

输入用户名：daixiang，密码：123456，点击登录按钮登录进入主界面，账户名密码错误会提示“用户名或密码错误”，代码调用存储过程实现登录。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200520222208834.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1YW54aWFuZzAx,size_16,color_FFFFFF,t_70#pic_center)

 - 主界面

主界面可以直接进行数据的“删除”与“查询”操作。
删除数据：在数据行上右键“删除”或选中记录行点击“删除”按钮，可进行数据的删除操作。
查询数据：查询时，“货物代码”、“商品名称”不是必填，“商品类型”必选，输入/选择后，点击“查询”按钮可进行多条件查询。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200520222328716.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1YW54aWFuZzAx,size_16,color_FFFFFF,t_70#pic_center)
 - 查询界面

查询：查询时，“货物代码”、“商品名称”不是必填，“商品类型”必选，输入/选择后，点击“查询”按钮可进行多条件查询。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200520222340380.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1YW54aWFuZzAx,size_16,color_FFFFFF,t_70#pic_center)

 - 删除界面

删除数据：在数据行上右键“删除”或选中记录行点击“删除”按钮，可进行对数据的删除操作。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200520222429136.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1YW54aWFuZzAx,size_16,color_FFFFFF,t_70#pic_center)

 - 添加商品界面

添加商品：用户在主界面点击“增加”按钮，进入添加商品界面，库存量和售价只接收数字输入，输入信息后点击“提交”即可完成商品的添加，提交时会校验字段，为空不允许提交。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200520222438270.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1YW54aWFuZzAx,size_16,color_FFFFFF,t_70#pic_center)
 - 修改商品界面

修改商品：选中数据行，点击修改，进入数据修改界面，填写信息后点击“提交”存储信息。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200520222515202.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1YW54aWFuZzAx,size_16,color_FFFFFF,t_70#pic_center)
