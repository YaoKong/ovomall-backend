"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url
from django.urls import path
from Mall import views
from backend import settings
from django.views.static import serve

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.hello),
    path('media/<path>', serve, {'document_root':settings.MEDIA_ROOT}),
    url(r'^api/login$', views.login,name='login'),
    url(r'^api/register$', views.register, name='register'),
    url(r'^api/getAddress$', views.getAddress, name='getAddress'),
    url(r'^api/addAddress$', views.addAddress, name='addAddress'),
    url(r'^api/deleteAddress$', views.deleteAddress, name='deleteAddress'),
    url(r'^api/charge$', views.charge, name='charge'),
    url(r'^api/getInfo$', views.getInfo, name='getInfo'),
    url(r'^api/createOrder$', views.createOrder, name='createOrder'),
    url(r'^api/deleteOrder$', views.deleteOrder, name='deleteOrder'),
    url(r'^api/getOrder$', views.getOrder, name='getOrder'),
    url(r'^api/finishOrder$', views.finishOrder, name='finishOrder'),
    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    url(r'^api/uploadAvatar$', views.uploadAvatar, name='uploadAvatar'),
    url(r'^api/updateUserInfo$', views.updateUserInfo, name='updateUserInfo'),
    url(r'^api/changePassword$', views.changePassword, name='changePassword'),
    url(r'^api/searchByName', views.searchByName, name='searchByName'),
    url(r'^api/getGoods$', views.getGoods, name='getGoods'),
    url(r'^api/addRemark$', views.addRemark, name='addRemark'),
    url(r'^api/getRemark$', views.getRemark, name='getRemark'),
]

