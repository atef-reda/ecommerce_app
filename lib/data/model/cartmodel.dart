class CartModel {
  double? itemsprice;
  int? itemscount;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDatetime;
  int? itemsCatogries;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;

  CartModel(
      {this.itemsprice,
      this.itemscount,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsCatogries,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = (json['itemsprice'] as num?)?.toDouble();
    itemsPrice = (json['items_price'] as num?)?.toDouble();
    itemscount = json['itemscount'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCatogries = json['items_catogries'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = itemsprice;
    data['itemscount'] = itemscount;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datetime'] = itemsDatetime;
    data['items_catogries'] = itemsCatogries;
    data['cart_id'] = cartId;
    data['cart_usersid'] = cartUsersid;
    data['cart_itemsid'] = cartItemsid;
    return data;
  }
}