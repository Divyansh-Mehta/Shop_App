import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../screens/edit_product_screen.dart";
import "./screens/orders_screen.dart";
import "./providers/orders_provider.dart";
import "./screens/cart_screen.dart";
import "../providers/cart_provider.dart";
import "./screens/products_overview_screen.dart";
import "./screens/product_detail_screen.dart";
import "./providers/products_provider.dart";
import "./screens/user_products_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        title: "MyShop",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetail.routeName: (_) => ProductDetail(),
          CartScreen.routeName: (_) => CartScreen(),
          OrdersScreen.routeName: (_) => OrdersScreen(),
          UserProductScreen.routeName: (_) => UserProductScreen(),
          EditProductScreen.routeName: (_) => EditProductScreen(),
        },
      ),
    );
  }
}
