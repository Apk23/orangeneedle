class Product {
  String name, image;
  bool userLiked;

  double discount, price;

  Product({this.name, this.price, this.discount, this.image, this.userLiked});

  void toggleLiked() {
    userLiked = !userLiked;
  }
}
