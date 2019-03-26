class Product{
  Product.create(this.name);

  static const NAME_KEY = 'name';
  static const IMAGEURL_KEY = 'imageUrl';

  String name;
  String imageUrl;
  String id;
  int amount;

  Product.fromFirestore(Map<String, dynamic> json){
    name = json[NAME_KEY];
    imageUrl = json[IMAGEURL_KEY];
  }

  @override
  bool operator ==(o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}