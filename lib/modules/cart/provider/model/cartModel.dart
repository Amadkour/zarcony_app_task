class CartModel {
  CartModel({
      String? productName, 
      String? image, 
      String? quantity, 
      String? price, 
      String? weight, 
      String? maxQuantity, 
      String? minQuantity,}){
    _productName = productName;
    _image = image;
    quantity = quantity;
    _price = price;
    _weight = weight;
    _maxQuantity = maxQuantity;
    _minQuantity = minQuantity;
}

  CartModel.fromJson(dynamic json) {
    _productName = json['product_name'];
    _image = json['image'];
    quantity = json['quantity'];
    _price = json['price'];
    _weight = json['weight'];
    _maxQuantity = json['max_quantity'];
    _minQuantity = json['min_quantity'];
  }
  String? _productName;
  String? _image;
  String? quantity;
  String? _price;
  String? _weight;
  String? _maxQuantity;
  String? _minQuantity;

  String? get productName => _productName;
  String? get image => _image;
  String? get price => _price;
  String? get weight => _weight;
  String? get maxQuantity => _maxQuantity;
  String? get minQuantity => _minQuantity;


}