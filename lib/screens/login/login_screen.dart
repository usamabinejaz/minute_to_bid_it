import 'package:flutter/material.dart';
import '../../app_widgets/notifiers.dart';
import '../../backend_api/api_calls/login_api_calls.dart';
import '../../util/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 20),
                child: Center(
                  child: Icon(
                    Icons.flutter_dash,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (String? username) {
                      if (generalValidator(username)) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    controller: usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'User Name',
                      hintText: 'Enter user name. ',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscure,
                    validator: (String? password) {
                      if (generalValidator(password)) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        child: obscure
                            ? Icon(
                                Icons.visibility_off,
                                color: Theme.of(context).hintColor,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Theme.of(context).hintColor,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      signInWithUsernamePassword(
                        context,
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                    } else {
                      getSnackBar(context, "Error submitting form");
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
