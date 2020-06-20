import 'package:blocsample/blocs/product_bloc.dart';
import 'package:blocsample/blocs/dart_bloc.dart';
import 'package:blocsample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: ()=>Navigator.pushNamed(context, "/cart"),
          )
        ]
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    //Stream değiştiği zaman bunun içindeki builder tekrardan çalışır
    return StreamBuilder(
      initialData: ProductBloc().getAll(),
      stream: ProductBloc().getStream,
      builder: (context,snapshot){
        return snapshot.data.length>0?buildProductListItems(snapshot):Center(child: Text("Data yok"),);
        
      },

    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context,index){
          final list = snapshot.data;//sonrasında referansını değiştirmemiz gerekmediği için final
          return ListTile(
            title: Texgit at(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: (){
                cartBloc.addToCart(Cart(list[index],1));
              }

            ),
          );

        });

  }

}