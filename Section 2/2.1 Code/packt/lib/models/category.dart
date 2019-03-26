class Category{
  static const NAME_KEY = 'name';

  String id;
  String name;

  Category(){
    name = 'motherboard';
  }
  Category.fromFirebase(Map<String, dynamic> json){
    name = json[NAME_KEY];
  }
}