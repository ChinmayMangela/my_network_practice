import 'package:flutter/material.dart';
import 'package:my_network_practice/users/data/models/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Details")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImageComponent(),
            SizedBox(height: 16),
            _buildNameComponent(),
            _buildAddressComponent(),
            SizedBox(height: 20),
            _buildEmailComponent(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(width: 8),
                Text(user.phone!, style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageComponent() {
    return CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage(user.image!),
    );
  }

  Widget _buildNameComponent() {
    return Text(
      '${user.firstName} ${user.lastName}',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAddressComponent() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Address',
            style:
            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            user.address!.getFormattedAddress(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailComponent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.email, color: Colors.blue),
        SizedBox(width: 8),
        Text(user.email!,
            style: TextStyle(fontSize: 16)),
      ],
    );
  }
}



