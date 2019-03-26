class Category{
  static const NAME_KEY = 'name';

  String id;
  String name;

  Category(){
    name = 'motherboard';
  }
  Category.fromFirestore(Map<String, dynamic> json){
    name = json[NAME_KEY];
  }
}