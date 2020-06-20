import 'package:blocsample/models/product.dart';

class ProductService{

  //Static tanımlı product listesi
  static List<Product> products = new List<Product>();

  static ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  ProductService._internal();

  //Product list döndüren bir metod
  static List<Product> getAll(){
    products.add(new Product(1, "Monster", 7000));
    products.add(new Product(1, "Monster", 7000));
    products.add(new Product(1, "Monster", 7000));
    return products;
  }



}