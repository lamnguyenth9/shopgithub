class Shoe {
  List<Shoes>? shoes;

  Shoe({this.shoes});

  Shoe.fromJson(Map<String, dynamic> json) {
    if (json['shoes'] != null) {
      shoes = <Shoes>[];
      json['shoes'].forEach((v) {
        shoes!.add(new Shoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shoes != null) {
      data['shoes'] = this.shoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shoes {
  int? id;
  String? image;
  String? name;
  String? description;
  double? price;
  String? color;

  Shoes(
      {this.id,
      this.image,
      this.name,
      this.description,
      this.price,
      this.color});

  Shoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['color'] = this.color;
    return data;
  }
}
