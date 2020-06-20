import 'dart:async';

import 'package:blocsample/data/cart_service.dart';
import 'package:blocsample/models/cart.dart';

class CartBloc{

  final cartStreamController= StreamController.broadcast();
  final cartBloc = CartBloc();

  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item){
    CartService.addToCart(item);
    //Burda sink streamcontroller'a haber veriyor
    cartStreamController.sink.add(CartService.getCart());

  }

  void removeFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }






}