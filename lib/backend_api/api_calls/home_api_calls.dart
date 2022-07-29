import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/core.dart';

Future logout(context) async {
  // await GoogleSignInApi.logout();
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("sessionToken");
  Map result = await UserManagementCalls.logout(token: token??"");
  if (result['status']) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.setString("sessionToken", "");
    getSnackBar(context, "Signed out!");
    AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false);
  } else {
    getDialog(
      title: const Text("Logout Failed"),
      content: Text(result["message"]),
      closeText: "Ok",
      context: context,
    );
  }
}
