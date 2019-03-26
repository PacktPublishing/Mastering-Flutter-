class Product{
  Product.create(this.name);

  String name;
  String id;
  int amount;

  @override
  bool operator ==(o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}