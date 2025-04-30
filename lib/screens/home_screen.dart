import 'package:flutter/material.dart';
import '../model/cart_model.dart'; // import the cart model
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Spade',
      'price': '1800₹',
      'image': 'assets/images/spade.jpg',
    },
    {
      'name': 'Tractor Plough',
      'price': '25000₹',
      'image': 'assets/images/tractor_plough.jpg',
    },
    {
      'name': 'Seed Drill',
      'price': '9500₹',
      'image': 'assets/images/seed_drill.jpg',
    },
    {
      'name': 'Harvester Blade',
      'price': '7200₹',
      'image': 'assets/images/harvester_blade.jpg',
    },
    {
      'name': 'Irrigation Pump',
      'price': '10500₹',
      'image': 'assets/images/irrigation_pump.jpg',
    },
    {
      'name': 'Crop Sprayer',
      'price': '3700₹',
      'image': 'assets/images/crop_sprayer.jpg',
    },
    {
      'name': 'Fertilizer Spreader',
      'price': '4200₹',
      'image': 'assets/images/fertilizer_spreader.jpg',
    },
    {
      'name': 'Tiller',
      'price': '9800₹',
      'image': 'assets/images/tiller.jpg',
    },
    {
      'name': 'Watering Can',
      'price': '500₹',
      'image': 'assets/images/watering_can.jpg',
    },
    {
      'name': 'Weeder',
      'price': '1600₹',
      'image': 'assets/images/weeder.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Getting the screen width for dynamic sizing
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Agri Mitra'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Updated DrawerHeader with user profile photo and name
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                children: [
                  // Profile photo in CircleAvatar
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/kk.jpg'),
                    backgroundColor: Colors.grey.shade200,
                  ),

                  SizedBox(width: 10), // Space between photo and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Karan Katakdhond', // Replace with dynamic name if needed
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Farmer', // You can add a user role here if needed
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text('Orders'),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Learning'),
              onTap: () {
                Navigator.pushNamed(context, '/learning');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),

            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                /*ElevatedButton(
  onPressed: () {
    Provider.of<CartModel>(context, listen: false).addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${product['name']} added to cart"),
    ));
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(vertical: 14),
  ),
  child: Text('Add to Cart'),
),*/
                return Card(
                  elevation: 15.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          product['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(product['price']!),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: screenWidth *
                                  0.8, // Set dynamic width for button
                              child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addToCart({
                                    'name': product['name']!,
                                    'price': product['price']!,
                                    'image': product['image']!,
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            '${product['name']} added to cart')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Text('Add to Cart'),
                              ),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/payment');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Text('Buy Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
