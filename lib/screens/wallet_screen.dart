import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Scan'),
              Tab(text: 'Card'),
              Tab(text: 'Net Banking'),
              Tab(text: 'UPI'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with dynamic transaction count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Transaction $index'),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}