import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context); // get the cart data

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: cart.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final item = cart.cartItems[index];
                return ListTile(
                  leading: Image.asset(item['image']!),
                  title: Text(item['name']!),
                  subtitle: Text(item['price']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeFromCart(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item['name']} removed')),
                      );
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.cartItems.isEmpty
          ? SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total: ₹${cart.getTotalPrice().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
    );
  }
}
