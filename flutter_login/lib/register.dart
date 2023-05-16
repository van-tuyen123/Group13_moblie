import 'package:flutter/material.dart';
import 'package:flutter_login/login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  Future sign_up() async{
    String url = "http://localhost:8080/flutter_login/register.php";
    final response = await http.post(Uri.parse(url),body: {
      'name' : name.text,
      'password': pass.text,
      'email': email.text,
    });
    var data = json.decode(response.body);
    print(data);
    if(data == "Error"){
      Navigator.pushNamed(context, 'register');
    }else{
      Navigator.pushNamed(context, 'login');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Đăng kí',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold ,height: 5),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // // const Text(
                  // //   'Please complete your',
                  // //   style: TextStyle(fontSize: 20),
                  // // ),
                  // // const Text(
                  // //   'biodata correctly',
                  // //   style: TextStyle(fontSize: 20),
                  // // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your name',
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      controller: name,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your E-Mail',
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Please enter email';
                        }
                        return null;
                      },
                      controller: email,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Create your Password',
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Please enter password';
                        }
                        return null;
                      },
                      controller: pass,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Input your Password',
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Please enter password';
                        }else if(val != pass.text){
                          return 'Password not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF3F60A0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        // Navigator.pushNamed(context, 'home');
                        bool pass = formKey.currentState!.validate();
                        if(pass){
                          sign_up();
                        }
                      },
                      child: const Text(
                        'Đăng kí',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
