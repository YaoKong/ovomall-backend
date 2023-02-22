
# Create your models here.
from django.db import models


class User(models.Model):
    sexChoice = (
        ('male', '男'),
        ('female', '女'),
        ('unknown', '保密'),
    )
    username = models.CharField(max_length=15)
    pwd = models.CharField(max_length=20)
    tel = models.CharField(max_length=15)
    userID = models.AutoField(primary_key=True)
    email = models.CharField(max_length=30, unique=True)
    url = models.CharField(max_length=1000, default='')
    sex = models.CharField(max_length=7, choices=sexChoice)
    balance = models.FloatField(default=0)
    def __str__(self):
        return self.username

class Item(models.Model):
    userID = models.ForeignKey(User, models.CASCADE)
    addressID = models.IntegerField()
    itemID = models.AutoField(primary_key=True)

    statusChoice = (
        ('pending', '待收货'),
        ('finishing', '已完成'),
    )

    payment = models.FloatField()
    status = models.CharField(max_length=9, choices=statusChoice)

    def __str__(self):
        return self.itemID



class Goods(models.Model):
    goodsID = models.AutoField(primary_key=True)
    goodsName = models.CharField(max_length=100, default='')
    modelNum = models.CharField(max_length=100, default='')
    price = models.FloatField(default=0)
    url = models.CharField(max_length=1000, default='')
    description = models.CharField(max_length=1000, default='')
    def __str__(self):
        return self.goodsID

class Item_Goods(models.Model):
    goodsID = models.ForeignKey(Goods, models.CASCADE)
    itemID = models.ForeignKey(Item, models.CASCADE)
    total = models.IntegerField()
    def __str__(self):
        return self.goodsID


class Address(models.Model):
    receiver = models.CharField(max_length=20, default='')
    userID = models.ForeignKey(User, models.CASCADE)
    tel = models.CharField(max_length=15)
    zipCode = models.CharField(max_length=20)
    province = models.CharField(max_length=20, default='')
    city = models.CharField(max_length=20, default='')
    detail = models.CharField(max_length=100, default='')
    def __str__(self):
        return self.tel
class Remark(models.Model):
    goodsID = models.ForeignKey(Goods, models.CASCADE)
    userID = models.ForeignKey(User, models.CASCADE)
    rate = models.IntegerField()
    content = models.CharField(max_length=1000, default='')
    def __str__(self):
        return self.content