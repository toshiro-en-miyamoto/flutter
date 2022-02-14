import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import './flutterfire_register.dart';
import './flutterfire_signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const AuthExampleApp());
}

class AuthExampleApp extends StatelessWidget {
  const AuthExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example App',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: AuthTypeSelector(),
      ),
    );
  }
}

class AuthTypeSelector extends StatelessWidget {
  const AuthTypeSelector({Key? key}) : super(key: key);
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Example App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: 'Registration',
              onPressed: () => _pushPage(context, const RegisterPage()),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              icon: Icons.verified_user,
              backgroundColor: Colors.orange,
              text: 'Sign In',
              onPressed: () => _pushPage(context, const SignInPage()),
            ),
          ),
        ],
      ),
    );
  }
}
