import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // We'll use a custom back button
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(
                context, '/home'); // Go back to the previous screen
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/kk.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlue,
                      ),
                      child: const Icon(Icons.camera_alt,
                          size: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Karan Katakdhond',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('karankatakdhond@gmail.com'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            _buildOption(context, Icons.history, 'Orders History'),
            _buildOption(context, Icons.security, 'Login Security'),
            _buildOption(context, Icons.language, 'Languages'),
            _buildOption(context, Icons.location_on, 'Location'),
            _buildOption(context, Icons.subscriptions, 'Subscription'),
            _buildOption(context, Icons.feedback_outlined, 'Feedback'),
            const Divider(),
            _buildOption(context, Icons.card_giftcard, 'Referral'),
            _buildOption(context, Icons.logout, 'Log Out'),
            const SizedBox(height: 20),
            const Text('App Version 2.3', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
