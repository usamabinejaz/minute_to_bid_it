import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/core.dart';

Future signInWithUsernamePassword(context,
    {required String username, required String password}) async {
  //Waiting dialog
  // getWaitingDialog(context: context);
  Map result = await UserManagementCalls.loginUsingUsernamePassword(
    username: username,
    password: password,
  );

  // Map result = {'status': true};
  //Wait finished
  // Navigator.pop(context);

  if (result['status']) {
    getSnackBar(context, "Logged in");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('sessionToken', result['data']);
    AppRouterDelegate().setPathName(RouteData.home.name);
  } else {
    getDialog(
      title: const Text("Login Failed"),
      content: Text(result['message']),
      closeText: "Ok",
      context: context,
    );
  }
}
//
// Future signUpWithEmailPassword(
//   context, {
//   required String firstName,
//   required String lastName,
//   required String email,
//   required String country,
//   required String state,
//   required String address,
//   required String phone,
//   required String username,
//   required String password,
// }) async {
//   //Waiting dialog
//   getWaitingDialog(context: context);
//   Map result = await UserManagementCalls.signUpUsingEmailPassword(
//     firstName: firstName,
//     lastName: lastName,
//     email: email,
//     country: country,
//     state: state,
//     address: address,
//     phone: phone,
//     username: username,
//     password: password,
//   );
//   //Wait finished
//   Navigator.pop(context);
//   if (result['status']) {
//     getSnackBar(context, "Signed Up and Logged in!");
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLoggedIn', true);
//     AppRouterDelegate().setPathName(RouteData.home.name);
//   } else {
//     getDialog(
//       title: const Text("Sign up Failed"),
//       content: Text(result['message']),
//       closeText: "Ok",
//       context: context,
//     );
//   }
// }
//
// // Future signInWithGoogle(context) async {
// //   final user = await GoogleSignInApi.login();
// //   if (user != null) {
// //     String email = user.email;
// //     String name = user.displayName ?? "";
// //     //Waiting dialog
// //     getWaitingDialog(context: context);
// //     Map result =
// //         await UserManagementCalls.loginUsingGoogle(email: email, name: name);
// //     //Wait finished
// //     Navigator.pop(context);
// //
// //     if (result['status']) {
// //       getSnackBar(context, "Logged in");
// //       final prefs = await SharedPreferences.getInstance();
// //       await prefs.setBool('isLoggedIn', true);
// //       AppRouterDelegate().setPathName(RouteData.home.name);
// //     } else {
// //       getDialog(
// //         context: context,
// //         title: const Text("Login Failed"),
// //         content: const Text("Cannot Sign in with Google"),
// //         closeText: "Ok",
// //       );
// //     }
// //   } else {
// //     getDialog(
// //       context: context,
// //       title: const Text("Login Failed"),
// //       content: const Text("Cannot Sign in with Google"),
// //       closeText: "Ok",
// //     );
// //   }
// // }
//
// Future resetPassword(context,
//     {required String email, VoidCallback? nextStep}) async {
//   //Waiting dialog
//   getWaitingDialog(context: context);
//   Map result = await UserManagementCalls.resetPasswordRequest(email: email);
//   //Wait finished
//   Navigator.pop(context);
//   if (result['status']) {
//     getSnackBar(context, "Email Sent! Check your email");
//     //Close Current Dialog
//     Navigator.pop(context);
//     if (nextStep != null) {
//       nextStep();
//     }
//   } else {
//     getDialog(
//       title: const Text("Failed to Request Password Reset"),
//       content: Text(result['message']),
//       closeText: "Ok",
//       context: context,
//     );
//   }
// }
//
// Future confirmResetPassword(
//   context, {
//   required String email,
//   required String token,
//   required String password,
// }) async {
//   //Waiting dialog
//   getWaitingDialog(context: context);
//   Map result = await UserManagementCalls.resetPassword(
//       email: email, newPassword: password, token: token);
//   //Wait finished
//   Navigator.pop(context);
//
//   if (result['status']) {
//     getSnackBar(context, "Password Reset Complete! Login to continue");
//     //Close current Dialog
//     Navigator.pop(context);
//   } else {
//     getDialog(
//       title: const Text("Failed to Reset Password"),
//       content: Text(result['message']),
//       closeText: "Ok",
//       context: context,
//     );
//   }
// }
