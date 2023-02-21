import 'package:flutter/material.dart';

import 'home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login Screen",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 36),
                TextFormField(
                  key: const Key("user_name"),
                  controller: txtUserName,
                  decoration: const InputDecoration(
                    hintText: "User name",
                    labelText: "User name",
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter some value.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  key: const Key("password"),
                  controller: txtPassword,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter some value.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  key: const Key("login_button"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
