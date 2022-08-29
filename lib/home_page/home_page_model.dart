class HomePageModel {
  List<HomeStore>? homeStore;
  List<BestSeller>? bestSeller;

  HomePageModel({this.homeStore, this.bestSeller});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    if (json['home_store'] != null) {
      homeStore = <HomeStore>[];
      json['home_store'].forEach((v) {
        homeStore!.add(HomeStore.fromJson(v));
      });
    }
    if (json['best_seller'] != null) {
      bestSeller = <BestSeller>[];
      json['best_seller'].forEach((v) {
        bestSeller!.add(BestSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeStore != null) {
      data['home_store'] = homeStore!.map((v) => v.toJson()).toList();
    }
    if (bestSeller != null) {
      data['best_seller'] = bestSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeStore {
  int? id;
  bool? isNew;
  String? title;
  String? subtitle;
  String? picture;
  bool? isBuy;

  HomeStore(
      {this.id,
        this.isNew,
        this.title,
        this.subtitle,
        this.picture,
        this.isBuy});

  HomeStore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isNew = json['is_new'];
    title = json['title'];
    subtitle = json['subtitle'];
    picture = json['picture'];
    isBuy = json['is_buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_new'] = isNew;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['picture'] = picture;
    data['is_buy'] = isBuy;
    return data;
  }
}

class BestSeller {
  int? id;
  bool? isFavorites;
  String? title;
  int? priceWithoutDiscount;
  int? discountPrice;
  String? picture;

  BestSeller(
      {this.id,
        this.isFavorites,
        this.title,
        this.priceWithoutDiscount,
        this.discountPrice,
        this.picture});

  BestSeller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isFavorites = json['is_favorites'];
    title = json['title'];
    priceWithoutDiscount = json['price_without_discount'];
    discountPrice = json['discount_price'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_favorites'] = isFavorites;
    data['title'] = title;
    data['price_without_discount'] = priceWithoutDiscount;
    data['discount_price'] = discountPrice;
    data['picture'] = picture;
    return data;
  }
}
