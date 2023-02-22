# 使用方法
## Django
```
1.MySql创建名为mallDatabase的数据库，字符集为utf8，并运行目录下mallDatabase.sql文件导入数据。(也可使用别的名字，但需要在/backend/settings.py下自定义)
2.数据库用户名为root，密码为admin(同样可以在setting.py下修改)
3.控制台运行python manage.py runserver启动服务器
```
_如遇到跨域限制需pip install django-cors-headers_