import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../constants.dart';
import '../router.router.dart';

Widget myDrawer(BuildContext context, String name, String email) {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: AutoSizeText(
            name,
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          accountEmail: AutoSizeText(
            email,
            maxLines: 1,
            style: TextStyle(fontSize: 16),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/1782/1782916.png',
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home, color: Colors.black),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, Routes.homePage);
          },
        ),
        Divider(thickness: 1),
        ListTile(
          leading: Icon(Icons.people, color: Colors.black),
          title: Text(
            'Visitor Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Handle onTap for Visitor Information
          },
        ),
        Divider(thickness: 1),
        ListTile(
          leading: Icon(Icons.person_add_alt_1, color: Colors.black),
          title: Text(
            'Add Team Member',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Handle onTap for Add Team Member
          },
        ),
        Divider(thickness: 1),
        ListTile(
          leading: Icon(Icons.shopping_cart, color: Colors.black),
          title: Text(
            'Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Handle onTap for Products
          },
        ),
        Divider(thickness: 1),
        ListTile(
          leading: Icon(Icons.person_pin_outlined, color: Colors.black),
          title: Text(
            'Designations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Handle onTap for Designations
          },
        ),
        Divider(thickness: 1),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.black),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            logout(context);
          },
        ),
      ],
    ),
  );
}
