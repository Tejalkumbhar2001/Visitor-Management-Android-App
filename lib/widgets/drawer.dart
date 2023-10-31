import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../constants.dart';
import '../router.router.dart';

Widget myDrawer(BuildContext context, String name, String email, String role) {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: AutoSizeText(
            name,
            maxLines: 1,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          accountEmail: AutoSizeText(
            email,
            maxLines: 1,
            style: const TextStyle(fontSize: 14),
          ),
          arrowColor: Colors.black87,
          currentAccountPicture: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://img.freepik.com/premium-vector/man-character_665280-46970.jpg',
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                'https://babich.biz/content/images/2016/03/user-profile-bg.jpg',
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Bootstrap.house, color: Colors.black),
          title: const Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, Routes.homePage);
          },
        ),
        ListTile(
          leading: const Icon(Bootstrap.people, color: Colors.black),
          title: const Text(
            'Visitor Information',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.visitorList);
          },
        ),
        role != 'web user'
            ? ListTile(
                leading: const Icon(Bootstrap.person, color: Colors.black),
                title: const Text(
                  'Team Members',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.teamMemberList);
                },
              )
            : Container(),
        ListTile(
          leading: const Icon(Bootstrap.cart, color: Colors.black),
          title: const Text(
            'Products',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.productList);
          },
        ),
        role != 'web user'
            ? ListTile(
                leading:
                    const Icon(Icons.person_pin_outlined, color: Colors.black),
                title: const Text(
                  'Designations',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.listDesignation);
                },
              )
            : Container(),
        const Divider(thickness: 1),
        ListTile(
          leading: const Icon(Iconsax.logout, color: Colors.black),
          title: const Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to log out?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        logout(context); // Close the dialog
                      },
                      child: Text('Logout'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
