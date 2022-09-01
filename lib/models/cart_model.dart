import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.basket,
    this.delivery,
    this.id,
    this.total,
  });

  List<Basket>? basket;
  String? delivery;
  String? id;
  int? total;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    basket: List<Basket>.from(json["basket"].map((x) => Basket.fromJson(x))),
    delivery: json["delivery"],
    id: json["id"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "basket": List<dynamic>.from(basket!.map((x) => x.toJson())),
    "delivery": delivery,
    "id": id,
    "total": total,
  };
}

class Basket {
  Basket({
    this.id,
    this.images,
    this.price,
    this.title,
  });

  int? id;
  String? images;
  int? price;
  String? title;

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
    id: json["id"],
    images: json["images"],
    price: json["price"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": images,
    "price": price,
    "title": title,
  };
}
