import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UserManagementCalls {
  static String baseUrl = "http://192.168.1.48:5000/";

  static Future<Map<String, dynamic>> loginUsingUsernamePassword({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> credential = {
      "username": username,
      "password": password,
    };
    try {
      var response = await http.post(
        Uri.parse("${baseUrl}Login"),
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
        body: credential,
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return {
          "status": true,
          "data": body['token'],
          "message": 'Login Successful',
          "statusCode": response.statusCode,
        };
      } else {
        return {
          "status": false,
          "data": null,
          "message":
              'Invalid data received from the server! Please try again in a moment.',
          "statusCode": response.statusCode,
        };
      }
    } catch (e) {
      String message = e.toString();
      return {
        "status": false,
        "data": null,
        "message": message,
        "statusCode": -1,
      };
    }
  }

// static Future<Map<String, dynamic>> loginUsingGoogle({
//   required String email,
//   required String name,
// }) async {
//   Map<String, String> credential = {"email": email, "name": name};
//
//   try {
//     Response response = await ApiConfiguration.dio()
//         .post('/auth/login_with_google/', data: credential);
//     if (response.statusCode == 200) {
//       if (response.data['success']) {
//         Map<String, dynamic> data = response.data['data'];
//         User user = User.fromJson(data);
//         bool success = response.data['success'];
//         String message = response.data['message'];
//
//         return {
//           "status": success,
//           "data": user,
//           "message": message,
//           "statusCode": 0,
//         };
//       } else {
//         return {
//           "status": false,
//           "data": null,
//           "message": response.data['message'],
//           "statusCode": response.statusCode,
//         };
//       }
//     } else {
//       return {
//         "status": false,
//         "data": null,
//         "message":
//             'Invalid data received from the server! Please try again in a moment.',
//         "statusCode": response.statusCode,
//       };
//     }
//   } catch (e) {
//     late String message;
//     if (e is DioError) {
//       message = "Connection Error, try again later";
//     } else {
//       message = e.toString();
//     }
//     return {
//       "status": false,
//       "data": null,
//       "message": message,
//       "statusCode": -1,
//     };
//   }
// }
//
// static Future<Map<String, dynamic>> signUpUsingEmailPassword({
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
//   Map<String, String> credential = {
//     "first_name": firstName,
//     "last_name": lastName,
//     "email": email,
//     "country": country,
//     "state": state,
//     "address": address,
//     "phone": phone,
//     "username": username,
//     "password": password,
//   };
//
//   try {
//     Response response =
//         await ApiConfiguration.dio().post('/auth/signup/', data: credential);
//     if (response.statusCode == 200) {
//       if (response.data['success']) {
//         Map<String, dynamic> data = response.data['data'];
//         User user = User.fromJson(data);
//         bool success = response.data['success'];
//         String message = response.data['message'];
//         return {
//           "status": success,
//           "data": user,
//           "message": message,
//           "statusCode": 0,
//         };
//       } else {
//         return {
//           "status": false,
//           "data": null,
//           "message": response.data['message'],
//           "statusCode": response.statusCode,
//         };
//       }
//     } else {
//       return {
//         "status": false,
//         "data": null,
//         "message":
//             'Invalid data received from the server! Please try again in a moment.',
//         "statusCode": response.statusCode,
//       };
//     }
//   } catch (e) {
//     late String message;
//     if (e is DioError) {
//       message = "Connection Error, try again later";
//     } else {
//       message = e.toString();
//     }
//     return {
//       "status": false,
//       "data": null,
//       "message": message,
//       "statusCode": -1,
//     };
//   }
// }
//
// static Future<Map<String, dynamic>> resetPasswordRequest({
//   required String email,
// }) async {
//   Map<String, String> credential = {
//     "email": email,
//   };
//
//   try {
//     Response response = await ApiConfiguration.dio()
//         .post('/auth/reset_password/', data: credential);
//     if (response.statusCode == 200) {
//       if (response.data['success']) {
//         Map<String, dynamic> data = response.data['data'];
//         User user = User.fromJson(data);
//         bool success = response.data['success'];
//         String message = response.data['message'];
//
//         return {
//           "status": success,
//           "data": user,
//           "message": message,
//           "statusCode": 0,
//         };
//       } else {
//         return {
//           "status": false,
//           "data": null,
//           "message": response.data['message'],
//           "statusCode": response.statusCode,
//         };
//       }
//     } else {
//       return {
//         "status": false,
//         "data": null,
//         "message":
//             'Invalid data received from the server! Please try again in a moment.',
//         "statusCode": response.statusCode,
//       };
//     }
//   } catch (e) {
//     late String message;
//     if (e is DioError) {
//       message = "Connection Error, try again later";
//     } else {
//       message = e.toString();
//     }
//     return {
//       "status": false,
//       "data": null,
//       "message": message,
//       "statusCode": -1,
//     };
//   }
// }
//
// static Future<Map<String, dynamic>> resetPassword({
//   required String email,
//   required String token,
//   required String newPassword,
// }) async {
//   Map<String, String> credential = {
//     "email": email,
//     "new_password": newPassword,
//     "token": token,
//   };
//
//   try {
//     Response response = await ApiConfiguration.dio()
//         .patch('/auth/reset_password/', data: credential);
//     if (response.statusCode == 200) {
//       if (response.data['success']) {
//         Map<String, dynamic> data = response.data['data'];
//         User user = User.fromJson(data);
//         bool success = response.data['success'];
//         String message = response.data['message'];
//         return {
//           "status": success,
//           "data": user,
//           "message": message,
//           "statusCode": 0,
//         };
//       } else {
//         return {
//           "status": false,
//           "data": null,
//           "message": response.data['message'],
//           "statusCode": response.statusCode,
//         };
//       }
//     } else {
//       return {
//         "status": false,
//         "data": null,
//         "message":
//             'Invalid data received from the server! Please try again in a moment.',
//         "statusCode": response.statusCode,
//       };
//     }
//   } catch (e) {
//     late String message;
//     if (e is DioError) {
//       message = "Connection Error, try again later";
//     } else {
//       message = e.toString();
//     }
//     return {
//       "status": false,
//       "data": null,
//       "message": message,
//       "statusCode": -1,
//     };
//   }
// }
//
  static Future<Map<String, dynamic>> logout({required String token}) async {
    if (token == "") {
      return {
        "status": false,
        "data": null,
        "message": "No session found",
        "statusCode": -1,
      };
    }
    try {
      var response = await http.get(
        Uri.parse("${baseUrl}Logout"),
        headers: {
          "Access-Control-Allow-Origin": "*",
          HttpHeaders.authorizationHeader: "Bearer $token",
        },

      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return {
          "status": true,
          "data": body['msg'],
          "message": 'Login Successful',
          "statusCode": response.statusCode,
        };
        // if (response.data['success']) {
        //   Map data = response.data['data'];
        //   bool success = response.data['success'];
        //   String message = response.data['message'];
        //
        //   return {
        //     "status": success,
        //     "data": data,
        //     "message": message,
        //     "statusCode": 0,
        //   };
        // } else {
        //   return {
        //     "status": false,
        //     "data": null,
        //     "message": response.data['message'],
        //     "statusCode": response.statusCode,
        //   };
        // }
      } else {
        return {
          "status": false,
          "data": null,
          "message":
              'Invalid data received from the server! Please try again in a moment.',
          "statusCode": response.statusCode,
        };
      }
    } catch (e) {
      String message = e.toString();
      return {
        "status": false,
        "data": null,
        "message": message,
        "statusCode": -1,
      };
    }
  }
}
