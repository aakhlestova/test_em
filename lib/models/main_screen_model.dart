import 'dart:convert';

MainScreen mainScreenFromJson(String str) => MainScreen.fromJson(json.decode(str));

String mainScreenToJson(MainScreen data) => json.encode(data.toJson());


class MainScreen {
  MainScreen({
    this.homeStore,
    this.bestSeller,
  });

  List<HomeStore>? homeStore;
  List<BestSeller>? bestSeller;

  factory MainScreen.fromJson(Map<String, dynamic> json) => MainScreen(
    homeStore: List<HomeStore>.from(json["home_store"].map((x) => HomeStore.fromJson(x))),
    bestSeller: List<BestSeller>.from(json["best_seller"].map((x) => BestSeller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "home_store": List<dynamic>.from(homeStore!.map((x) => x.toJson())),
    "best_seller": List<dynamic>.from(bestSeller!.map((x) => x.toJson())),
  };
}

class BestSeller {
  BestSeller({
    this.id,
    this.isFavorites,
    this.title,
    this.priceWithoutDiscount,
    this.discountPrice,
    this.picture,
  });

  int? id;
  bool? isFavorites;
  String? title;
  int? priceWithoutDiscount;
  int? discountPrice;
  String? picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
    id: json["id"],
    isFavorites: json["is_favorites"],
    title: json["title"],
    priceWithoutDiscount: json["price_without_discount"],
    discountPrice: json["discount_price"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_favorites": isFavorites,
    "title": title,
    "price_without_discount": priceWithoutDiscount,
    "discount_price": discountPrice,
    "picture": picture,
  };
}

class HomeStore {
  HomeStore({
    this.id,
    this.isNew,
    this.title,
    this.subtitle,
    this.picture,
    this.isBuy,
  });

  int? id;
  bool? isNew;
  String? title;
  String? subtitle;
  String? picture;
  bool? isBuy;

  factory HomeStore.fromJson(Map<String, dynamic> json) => HomeStore(
    id: json["id"],
    isNew: json["is_new"] == null ? null : json["is_new"],
    title: json["title"],
    subtitle: json["subtitle"],
    picture: json["picture"],
    isBuy: json["is_buy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_new": isNew == null ? null : isNew,
    "title": title,
    "subtitle": subtitle,
    "picture": picture,
    "is_buy": isBuy,
  };
}
