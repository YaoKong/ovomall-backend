import os

from django.http import HttpResponse
from django.shortcuts import render
from backend import settings
import json
# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from Mall.models import User, Address, Item, Item_Goods, Goods, Remark


def hello(request):
    return HttpResponse('欢迎使用Django！')

@csrf_exempt
def login(request):
    #用户登录
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        email = data['email']
        password = data['pwd']
        try:
            user = User.objects.get(email=email, pwd=password)
            response['msg'] = 'OK'
            # response['user'] = user
            # response['user'] = {"username": user.username, user.tel, user.userID, user.email, user.sex, user.balance, user.url}
            response['user'] = {"username": user.username,
                                "pwd": user.pwd,
                                "tel": user.tel,
                                "userID": user.userID,
                                "email": user.email,
                                "sex": user.sex,
                                "balance": user.balance,
                                "url": user.url}

            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def register(request):
    #注册用户
    response = {}
    info = User()

    if request.method == 'POST':
        data = json.loads(request.body)
        info.username = data['username']
        info.pwd = data['pwd']
        info.email = data['email']
        info.tel = data['tel']

        try:
            user = User.objects.get(email=info.email)
            response['msg'] = 'EXIST'
            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'OK'
            info.save()
            return HttpResponse(json.dumps(response))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def getAddress(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        id = data['userID']
        try:
            address = Address.objects.filter(userID=id)
            response['msg'] = 'OK'
            response['address'] = []
            for i in address.values():
                response['address'].append(i)

            return HttpResponse(json.dumps(response))
        except Address.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def addAddress(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        address = Address(receiver=data['receiver'],
                          tel=data['tel'], zipCode=data['zipCode'],
                          province=data['province'], city=data['city'],
                          detail=data['detail'])
        address.userID = User.objects.filter(userID=data['userID']).first()
        response['msg'] = 'OK'
        address.save()
        return HttpResponse(json.dumps(response))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def deleteAddress(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        addressID = data['addressID']
        try:
            address = Address.objects.get(id=addressID)
            address.delete()
            response['msg'] = 'OK'
            return HttpResponse(json.dumps(response))
        except Address.DoesNotExist:
            response['msg'] = 'fail'
            return HttpResponse(json.dumps(response, ensure_ascii=False))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def getInfo(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        id = data['userID']
        try:
            user = User.objects.get(userID=id)
            response['msg'] = 'OK'
            response['user'] = {"username": user.username,
                                "pwd": user.pwd,
                                "tel": user.tel,
                                "userID": user.userID,
                                "email": user.email,
                                "sex": user.sex,
                                "balance": user.balance,
                                "url": user.url}

            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def charge(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        id = data['userID']
        val = data['chargeVal']
        try:
            user = User.objects.get(userID=id)
            response['msg'] = 'OK'

            user.balance += float(val)
            user.save()
            response['balance'] = user.balance

            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def createOrder(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        userID = data['userID']
        addressID = data['addressID']
        item_goods = data['item_goods']
        try:
            user = User.objects.get(userID=userID)
            if user.balance < data['payment']:
                response['msg'] = 'NOTENOUGH'
            else:
                item = Item(userID=User.objects.get(userID=userID), addressID=addressID, status='pending', payment=data['payment'])
                item.save()
                for i in item_goods:
                    print(i)
                    ig = Item_Goods(goodsID=Goods.objects.get(goodsID=(i['goodsID'])),
                                    itemID=Item.objects.get(itemID=item.itemID),
                                    total=i['total'])
                    ig.save()
                user.balance -= data['payment']
                user.save()
                response['msg'] = 'OK'

            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def getOrder(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        userID = data['userID']
        orders = Item.objects.filter(userID=userID)
        ordersArr = []
        for item in orders.values():
            itemID = item["itemID"]
            address = Address.objects.get(id=item["addressID"])
            tmpItem = {
                "itemID": itemID,
                "addressID": item["addressID"],
                "address": address.province + address.city + address.detail,
                "payment": item["payment"],
                "status": item["status"],
                "userID": userID,
                "item_goods": []
            }
            ig = Item_Goods.objects.filter(itemID=itemID)
            for tmp in ig.values():
                tmpGoods = Goods.objects.get(goodsID=tmp["goodsID_id"])

                tmpItem["item_goods"].append({
                    "goodsID": tmpGoods.goodsID,
                    "goodsName": tmpGoods.goodsName,
                    "modelNum": tmpGoods.modelNum,
                    "price": tmpGoods.price,
                    "description": tmpGoods.description,
                    "url": tmpGoods.url,
                    "total": tmp["total"],
                })
            ordersArr.append(tmpItem)

        response['orders'] = ordersArr
        response['msg'] = 'OK'
        return HttpResponse(json.dumps(response))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def finishOrder(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        itemID = data['itemID']
        try:
            order = Item.objects.get(itemID=itemID)
            order.status = 'finishing'
            order.save()
            response['msg'] = 'OK'
            return HttpResponse(json.dumps(response))
        except Item.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def deleteOrder(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        itemID = data['itemID']
        try:
            order = Item.objects.get(itemID=itemID)
            order.delete()
            response['msg'] = 'OK'
            return HttpResponse(json.dumps(response))
        except Item.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))

    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def uploadAvatar(request):
    response = {}
    if request.method == 'POST':
        print(request.FILES)
        userid = request.POST.get('userID')
        pic = request.FILES.get('file')
        pic_name = userid+pic.name
        f = open(os.path.join(settings.MEDIA_ROOT, "Avatar/", pic_name), 'wb')
        for i in pic.chunks():
            f.write(i)
        f.close()
        if userid!='':
            User.objects.filter(userID=userid).update(url='http://localhost:8000' + '/media/Avatar/'+pic_name)
        response['msg'] = 'OK'
        response['url'] = 'http://localhost:8000' + '/media/Avatar/'+pic_name
        return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def updateUserInfo(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        userID = data['userID']
        try:
            user = User.objects.get(userID=userID)

            user.username = data['username']
            user.email = data['email']
            user.tel = data['tel']
            user.sex = data['sex']
            response['msg'] = 'OK'
            response['user'] = {"username": user.username,
                                "pwd": user.pwd,
                                "tel": user.tel,
                                "userID": user.userID,
                                "email": user.email,
                                "sex": user.sex,
                                "balance": user.balance,
                                "url": user.url}
            user.save()
            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def changePassword(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        userID = data['userID']
        try:
            user = User.objects.get(userID=userID)

            if user.pwd != data['rawPwd']:
                response['msg'] = 'INCORRECT'
            else:
                user.pwd = data['newPwd']
                response['msg'] = 'OK'
                user.save()
            return HttpResponse(json.dumps(response))
        except User.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))
@csrf_exempt
def searchByName(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        name = data['name']
        try:
            goodsList = Goods.objects.filter(goodsName__contains=name)
            response['msg'] = 'OK'
            response['result'] = []
            for tmp in goodsList:
                response['result'].append({
                    "goodsID": tmp.goodsID,
                    "goodsName": tmp.goodsName,
                    "modelNum": tmp.modelNum,
                    "price": tmp.price,
                    "description": tmp.description,
                    "url": tmp.url
                })
            return HttpResponse(json.dumps(response))
        except Goods.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def getGoods(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        goodsID = data['goodsID']

        try:
            goods = Goods.objects.get(goodsID=goodsID)
            response['msg'] = 'OK'
            response['goods'] = {
                    "goodsID": goodsID,
                    "goodsName": goods.goodsName,
                    "modelNum": goods.modelNum,
                    "price": goods.price,
                    "description": goods.description,
                    "url": goods.url
                }
            return HttpResponse(json.dumps(response))
        except Goods.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def addRemark(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        goodsID = data['goodsID']
        userID = data['userID']
        try:
            goods = Goods.objects.get(goodsID=goodsID)
            user = User.objects.get(userID=userID)

            remark = Remark(userID=user, goodsID=goods, rate=data['rate'], content=data['content'])
            remark.save()
            response['msg'] = 'OK'
            return HttpResponse(json.dumps(response))
        except Goods.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))

@csrf_exempt
def getRemark(request):
    response = {}
    if request.method == 'POST':
        data = json.loads(request.body)
        goodsID = data['goodsID']
        userID = data['userID']
        try:
            goods = Goods.objects.get(goodsID=goodsID)
            user = User.objects.get(userID=userID)

            remark = Remark.objects.filter(goodsID=goods, userID=user)
            response['msg'] = 'OK'
            response['remark'] = []
            for r in remark:
                response['remark'].append({
                    "goodsID": goodsID,
                    "userID": userID,
                    "username": user.username,
                    "rate": r.rate,
                    "content": r.content
                })
            return HttpResponse(json.dumps(response))
        except Goods.DoesNotExist:
            response['msg'] = 'NOTEXIST'
            return HttpResponse(json.dumps(response))
    else:
        response['msg'] = 'fail'
        return HttpResponse(json.dumps(response, ensure_ascii=False))