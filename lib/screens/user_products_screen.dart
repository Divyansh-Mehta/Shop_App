import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "./edit_product_screen.dart";
import "../widgets/app_drawer.dart";
import "../widgets/user_product_item.dart";
import "../providers/products_provider.dart";

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-product";

  Future<void> _refreshProduct(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, index) => Column(
              children: [
                UserProductItem(
                  productData.items[index].title,
                  productData.items[index].imageUrl,
                  productData.items[index].id,
                ),
                Divider(),
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
