import 'package:flutter/material.dart';


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Trang chủ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Chào mừng bạn đến với HomePage",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            // ),
            // SizedBox(
            //   width: 350,
            //   height: 60,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         primary: const Color(0xFF3F60A0),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(15))),
            //     onPressed: () {
            //       Navigator.pushNamed(context, 'Đăng nhập');
            //     },
            //     child: Text("Logout"),
            //   ),
            ),
          ],
        ),
      ),
    );
  }
}
