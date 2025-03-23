class MyFavoriteModel {
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
  int? favoritesId;
  int? favoritesUsersid;
  int? favoritesItemsid;
  int? usersId;

  MyFavoriteModel(
      {this.itemsId,
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
      this.favoritesId,
      this.favoritesUsersid,
      this.favoritesItemsid,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = (json['items_price'] as num?)?.toDouble();
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCatogries = json['items_catogries'];
    favoritesId = json['favorites_id'];
    favoritesUsersid = json['favorites_usersid'];
    favoritesItemsid = json['favorites_itemsid'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['items_catogries'] =itemsCatogries;
    data['favorites_id'] = favoritesId;
    data['favorites_usersid'] = favoritesUsersid;
    data['favorites_itemsid'] = favoritesItemsid;
    data['users_id'] = usersId;
    return data;
  }
}