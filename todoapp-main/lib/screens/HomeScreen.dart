import 'package:flutter/material.dart';
import 'package:todoapp/screens/AddJob.dart';

import '../data/ListNhiemVu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListNhiemVu listNvSgl = ListNhiemVu();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xfffbc193),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CircleAvatar(
                      radius: 100, // Image radius
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Quản lí công việc cá nhân",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < listNvSgl.listNhiemVu.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: int.parse(listNvSgl.listNhiemVu[i].hanCongViec.split('-')[2]) <= int.parse(DateTime.now().day.toString()) &&
                              int.parse(listNvSgl.listNhiemVu[i].hanCongViec.split('-')[1]) <= int.parse(DateTime.now().month.toString())
                          ? Colors.red
                          : Colors.amber,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tên công việc cần làm: ${listNvSgl.listNhiemVu[i].tieuDe}",
                                      style: TextStyle(
                                        decoration: listNvSgl.listNhiemVu[i].isDone == true ? TextDecoration.lineThrough : TextDecoration.none,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Mô tả công việc: ${listNvSgl.listNhiemVu[i].moTaCongViec}",
                                      style: TextStyle(
                                        decoration: listNvSgl.listNhiemVu[i].isDone == true ? TextDecoration.lineThrough : TextDecoration.none,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Thời gian cần hoàn thành: ${listNvSgl.listNhiemVu[i].hanCongViec}",
                                      style: TextStyle(
                                        decoration: listNvSgl.listNhiemVu[i].isDone == true ? TextDecoration.lineThrough : TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Checkbox(
                                    activeColor: Colors.blue,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        listNvSgl.listNhiemVu[i].isDone = !listNvSgl.listNhiemVu[i].isDone;
                                      });
                                    },
                                    value: listNvSgl.listNhiemVu[i].isDone,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        listNvSgl.listNhiemVu.removeAt(i);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddJobs()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        "Add job +",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
