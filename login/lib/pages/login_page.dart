import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_textfield.dart';
import 'package:login/components/square_tile.dart';
import 'package:login/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock_person_outlined,
                size: 100,
              ),

              const SizedBox(height: 50),

              //Trang chủ
              Text(
                'Đăng nhập',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 40,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

             

              const SizedBox(height: 20),

              // const SizedBox(height: 50),

              // not a member? register now
              // Expanded(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) =>
              //               RegisterPage(),
              //         ),
              //       );
              //     },
              //     child: Text(
              //       'Register',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                    // children: ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) =>
                    //             RegisterPage(),
                    //       ),
                    //     );
                    //   },
                    //   child: Text(
                    //     'Register',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),

                children: [
                  TextButton(
                  // Within the `FirstScreen` Widget
                  onPressed: () {
                         Navigator.push(context,
                         MaterialPageRoute(builder: (context) => RegisterPage()),);
                  },

                      child: const Text("Đăng kí "))
                 ],


                  // Text(
                  //   'Not a member?',
                  //   style: TextStyle(color: Colors.grey[700]),
                  // ),
                  // const SizedBox(width: 4),
                  //
                  // const Text(
                  //   'Register now',
                  //   style: TextStyle(
                  //     color: Colors.blue,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                // ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
