import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem({
    this.id,
    this.productId,
    this.price,
    this.title,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to remove item from the cart?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: (){
                    Navigator.of(ctx).pop(false);
                    },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: (){
                    Navigator.of(ctx).pop(true);
                  },
                ),
              ],
                ));
      },
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text('\$$price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    child: FlatButton(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.remove,
                        size: 15,
                      ),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .reduceQuantity(productId);
                      },
                    ),
                  ),
                  Text('$quantity x'),
                  Container(
                    width: 30,
                    alignment: Alignment.centerLeft,
                    child: FlatButton(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .increaseQuantity(productId);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
