import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../constants.dart';
import '../router.router.dart';



Widget myDrawer(BuildContext context, String name, String email,String companyName) {
  return Container(
    width: 250,
    child: Drawer(
      child: Column(
        children: [
          // SizedBox(
          //   height: 8.0,
          // ),
          UserAccountsDrawerHeader(
            accountName: AutoSizeText(
              name,
              maxLines: 1,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail:
                AutoSizeText(
                  companyName,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          // ListTile(
          //   leading: const Icon(Bootstrap.people, color: Colors.black),
          //   title: const Text(
          //     'Visitor Information',
          //     style: TextStyle(fontWeight: FontWeight.w300),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.visitorList);
          //   },
          // ),
          // role != 'web user'
          //     ? ListTile(
          //         leading: const Icon(Bootstrap.person, color: Colors.black),
          //         title: const Text(
          //           'Team Members',
          //           style: TextStyle(fontWeight: FontWeight.w300),
          //         ),
          //         onTap: () {
          //           Navigator.pushNamed(context, Routes.teamMemberList);
          //         },
          //       )
          //     : Container(),
          // ListTile(
          //   leading: const Icon(Bootstrap.cart, color: Colors.black),
          //   title: const Text(
          //     'Products',
          //     style: TextStyle(fontWeight: FontWeight.w300),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.productList);
          //   },
          // ),
          // // role != 'web user'
          //      ListTile(
          //         leading:
          //             const Icon(Icons.person_pin_outlined, color: Colors.black),
          //         title: const Text(
          //           'Designations',
          //           style: TextStyle(fontWeight: FontWeight.w300),
          //         ),
          //         onTap: () {
          //           Navigator.pushNamed(context, Routes.listDesignation);
          //         },
          //       ),
          //
          // ListTile(
          //   leading:
          //   const Icon(Icons.event, color: Colors.black),
          //   title: const Text(
          //     'Event',
          //     style: TextStyle(fontWeight: FontWeight.w300),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.listEventView);
          //   },
          // ),

          // ListTile(
          //   leading:
          //   const Icon(Icons.qr_code_2, color: Colors.black),
          //   title: const Text(
          //     ' Attendence QR',
          //     style: TextStyle(fontWeight: FontWeight.w300),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.attendenceScanner);
          //   },
          // ),
          ListTile(
            leading:
            const Icon(Icons.start, color: Colors.black),
            title: const Text(
              'Session Defaults',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            onTap: () {
              Navigator.pushNamed(context, Routes.sessionDefault);
            },
          ),
          // ListTile(
          //   leading:
          //   const Icon(Icons.qr_code_2, color: Colors.black),
          //   title: const Text(
          //     ' Gift QR',
          //     style: TextStyle(fontWeight: FontWeight.w300),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.tlcGiftScanner);
          //   },
          // ),


              // : Container(),

          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black),
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
    ),
  );
}
