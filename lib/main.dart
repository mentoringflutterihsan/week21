import 'package:flutter/material.dart';
import 'package:week2/age.dart';
import 'package:week2/bangundatar.dart';
import 'package:week2/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String username, password;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return 'data harus diisi';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Username", hintText: "masukkan username"),
                controller: usernameController,
              ),
              SizedBox(),
              TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return 'data harus diisi';
                  }
                  return null;
                },
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "Password", hintText: "masukkan password"),
              ),
              MaterialButton(
                onPressed: () {
                  username = usernameController.text;
                  password = passwordController.text;
                  if (_form.currentState.validate()) {
                    if (username != 'admin' && password != 'admin') {
                      print('username salah');
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => menu()));
                    }
                  }
                },
                child: Text('Login '),
              ),
              RaisedButton(
                  child: Text('bangun datar'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BangunDatar()));
                  }),
              RaisedButton(
                  child: Text('cek umur'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckAge()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
