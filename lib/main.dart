import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Color getSpecificIconColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return Colors.green;
    } else if (states.contains(MaterialState.error)) {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

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
          prefixIconColor: MaterialStateColor.resolveWith(getSpecificIconColor),
          suffixIconColor: MaterialStateColor.resolveWith(getSpecificIconColor),
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
  bool _errorTextValue = false;

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
              onChanged: (userEmail) {
                setState(() {
                  _errorTextValue = userEmail.contains(' ');
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Email',
                hintText: 'Email',
                errorText: _errorTextValue == false
                    ? null
                    : 'Please Enter Valid Email',
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
                    if (_emailController.text.isNotEmpty == true &&
                        _passwordController.text.isNotEmpty == true) {
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
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                print(_emailController.text);
                print(_passwordController.text);
                if (_emailController.text.contains('@') == false) {
                  setState(() {
                    _errorTextValue = true;
                  });
                }
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
