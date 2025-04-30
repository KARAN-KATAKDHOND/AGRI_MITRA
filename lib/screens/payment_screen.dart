import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'Card';
  final _formKey = GlobalKey<FormState>();

  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final upiController = TextEditingController();

  Timer? _timer;
  int _remainingSeconds = 300;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remainingSeconds = 300;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void _showSuccessDialog(double amount) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Icon(Icons.check_circle, color: Colors.purple, size: 50),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Payment Successful!", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Amount Paid: ₹${amount.toStringAsFixed(2)}")
          ],
        ),
        actions: [
          TextButton(
            child: Text("Done"),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/home'));
            },
          )
        ],
      ),
    );
  }

  void _payNow(double amount) {
    if (_formKey.currentState!.validate()) {
      _showSuccessDialog(amount);
    }
  }

  Widget _buildPaymentForm() {
    switch (_selectedMethod) {
      case 'Card':
        return Column(
          children: [
            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null ||
                    !(value.length == 12 || value.length == 16)) {
                  return 'Card number must be 12 or 16 digits';
                }
                return null;
              },
            ),
            TextFormField(
              controller: expiryController,
              decoration: InputDecoration(labelText: 'Expiry MM/YY'),
              validator: (value) => value!.isEmpty ? 'Enter expiry date' : null,
            ),
            TextFormField(
              controller: cvvController,
              decoration: InputDecoration(labelText: 'CVV'),
              obscureText: true,
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.length != 3 ? 'CVV must be 3 digits' : null,
            ),
          ],
        );
      case 'UPI':
        return TextFormField(
          controller: upiController,
          decoration: InputDecoration(labelText: 'Enter UPI ID'),
          validator: (value) =>
              value == null || !value.contains('@') ? 'Invalid UPI ID' : null,
        );
      case 'Netbanking':
        return DropdownButtonFormField(
          items: ['SBI', 'HDFC', 'ICICI', 'Axis Bank']
              .map((bank) => DropdownMenuItem(child: Text(bank), value: bank))
              .toList(),
          onChanged: (_) {},
          validator: (value) => value == null ? 'Select a bank' : null,
          decoration: InputDecoration(labelText: 'Select Bank'),
        );
      case 'QR':
        return Column(
          children: [
            Text('Scan the QR below to pay'),
            SizedBox(height: 10),
            Image.asset('assets/images/QR.jpg', height: 150),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: (300 - _remainingSeconds) / 300,
              backgroundColor: Colors.grey[300],
              color: Colors.purple,
            ),
            SizedBox(height: 5),
            Text('Time remaining: ${_formatTime(_remainingSeconds)}')
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final totalAmount = cart.getTotalPrice();

    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amount: ₹${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Choose Payment Method:'),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: ['Card', 'UPI', 'QR', 'Netbanking']
                    .map((method) => ChoiceChip(
                          label: Text(method),
                          selected: _selectedMethod == method,
                          onSelected: (selected) {
                            setState(() {
                              _selectedMethod = method;
                              if (method == 'QR') {
                                _startTimer();
                              } else {
                                _timer?.cancel();
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              _buildPaymentForm(),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _payNow(totalAmount),
                  child: Text('Pay Now'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
