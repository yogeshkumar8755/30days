class PostDAta {
  String? name;
  String? rating;
  String ?tags;
  String? price;
  String ?size;
  String ?color;
  String ?description;
  String? image;

  PostDAta(
      {required this.name,
      required this.rating,
      required this.tags,
      required this.price,
      required this.size,
      required this.color,
      required this.description,
      required this.image});

  factory PostDAta.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final rating = json['rating'];
    final tags = json['tags'];
    final price = json['price'];
    final size = json['size'];
    final color = json['color'];
    final desciption = json['desciption'];
    final image = json['image'];

    return PostDAta(
      name: name,
      rating: rating,
      tags: tags,
      price: price,
      size: size,
      color: color,
      description: desciption,
      image: image,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'rating': rating,
        "tags": tags,
        "price": price,
        "size": size,
        "color": color,
        "description": description,
        "image": image
      };
}
