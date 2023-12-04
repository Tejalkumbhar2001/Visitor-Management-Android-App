// import 'package:flutter/material.dart';
//
// import '../widgets/page_tile_bar.dart';
// import '../widgets/under_part.dart';
// import '../widgets/upside.dart';
//
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: size.width,
//           height: size.height,
//           child: SingleChildScrollView(
//             child: Stack(
//               children: [
//                 const Upside(
//                   imgUrl: "assets/images/login.png",
//                 ),
//                 const PageTitleBar(title: 'Login to your account'),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 320.0),
//                   child: Container(
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         topRight: Radius.circular(50),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           height: 15,
//                         ),
//
//                         Form(
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                 controller: model.usernameController,
//                                 focusNode: model.focusNode,
//                                 decoration: InputDecoration(
//                                   labelText: 'Username',
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(10.0),
//                                   ),
//                                   prefixIcon: const Icon(Icons
//                                       .person), // Icon for the username field
//                                 ),
//                                 autofillHints: const [
//                                   AutofillHints.username
//                                 ],
//                                 onEditingComplete: () {
//                                   TextInput.finishAutofillContext();
//                                   FocusManager.instance.primaryFocus
//                                       ?.unfocus();
//                                 },
//                                 validator: (value) =>
//                                     model.validateUsername(value),
//                               ),
//                               TextFormField(
//                                 controller: model.passwordController,
//                                 obscureText: model.obscurePassword,
//                                 decoration: InputDecoration(
//                                   labelText: 'Password',
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(10.0),
//                                   ),
//                                   prefixIcon: const Icon(Icons
//                                       .password), // Icon for the password field
//                                   suffixIcon: InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         model.obscurePassword =
//                                         !model.obscurePassword;
//                                       });
//                                     },
//                                     child: Icon(
//                                       model.obscurePassword
//                                           ? Icons.visibility
//                                           : Icons.visibility_off,
//                                     ),
//                                   ),
//                                 ),
//                                 autofillHints: const [
//                                   AutofillHints.password
//                                 ],
//                                 onEditingComplete: () {
//                                   TextInput.finishAutofillContext();
//                                   FocusManager.instance.primaryFocus
//                                       ?.unfocus();
//                                 },
//                                 validator: (value) =>
//                                     model.validatePassword(value),
//                               ),
//
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty
//                                       .all<Color>(Colors
//                                       .blue), // Set the background color to blue
//                                 ),
//                                 onPressed: () {
//                                   FocusManager.instance.primaryFocus
//                                       ?.unfocus();
//                                   if (model.formGlobalKey.currentState!
//                                       .validate()) {
//                                     model.formGlobalKey.currentState!
//                                         .save();
//                                     model.loginwithUsernamePassword(
//                                         context);
//                                   }
//                                 },
//                                 child: const Text(
//                                   'Login',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               UnderPart(
//                                 title: "Don't have an account?",
//                                 navigatorText: "Register here",
//                                 onTap: () {
//
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               const Text(
//                                 'Forgot password?',
//                                 style: TextStyle(
//                                     color: Color(0xfff1bb274),
//                                     fontFamily: 'OpenSans',
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 13),
//                               ),
//                               const SizedBox(height: 20,)
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// }
