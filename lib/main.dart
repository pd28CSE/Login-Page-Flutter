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
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red, //-----------------------------
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red, //-----------------------------
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
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
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              enableSuggestions: true,
              obscureText: _passwordShowHide,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                labelText: 'Enter Password',
                hintText: 'Password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    print('o--------');
                    if (_emailController.text.isNotEmpty == true &&
                        _passwordController.text.isNotEmpty == true) {
                      print('pon-------');
                      setState(() {
                        _passwordShowHide = !_passwordShowHide;
                      });
                    }
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
                labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: Theme.of(context)
                    .inputDecorationTheme
                    .enabledBorder!
                    .copyWith(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                // errorBorder:
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                print(_emailController.text);
                print(_passwordController.text);
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
