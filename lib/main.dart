import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,

        // inputDecorationTheme: InputDecorationTheme()
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();

  final _password = TextEditingController();

  bool _passwordShowHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _password,
              enableSuggestions: false,
              obscureText: _passwordShowHide,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                labelText: 'Enter Password',
                hintText: 'Password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    print('o--------');
                    if (_email.text.isNotEmpty == true &&
                        _password.text.isNotEmpty == true) {
                      print('pon-------');
                      setState(() {
                        _passwordShowHide = !_passwordShowHide;
                      });
                    }
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
                labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(_email.text);
                print(_password.text);
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
