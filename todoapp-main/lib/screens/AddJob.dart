import 'package:flutter/material.dart';
import 'package:todoapp/data/NhiemVu.dart';
import 'package:todoapp/screens/HomeScreen.dart';
import 'package:todoapp/screens/widget/CustomTextFormField.dart';
import 'package:intl/intl.dart';
import '../data/ListNhiemVu.dart';

class AddJobs extends StatefulWidget {
  AddJobs({super.key});

  @override
  State<AddJobs> createState() => _AddJobsState();
}

class _AddJobsState extends State<AddJobs> {
  TextEditingController tenCongViecController = new TextEditingController();
  TextEditingController moTaCongViecController = new TextEditingController();
  TextEditingController thoiGianHoanThanhController = new TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        thoiGianHoanThanhController.text = DateFormat('yyyy-MM-dd ').format(picked);
        ;
      });
    }
  }

  ListNhiemVu listNvSgl = ListNhiemVu();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber[200],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Add Jobs",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Form(
                      child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 10),
                      CustomTFormField(
                        controller: tenCongViecController,
                        labelText: "Tên Công việc",
                      ),
                      const SizedBox(height: 10),
                      CustomTFormField(
                        controller: moTaCongViecController,
                        labelText: 'Mô tả công Việc',
                      ),
                      const SizedBox(height: 10),
                      CustomTFormField(
                        controller: thoiGianHoanThanhController,
                        labelText: 'Thời gian hoàn thành',
                        suffixIcon: InkWell(
                          child: IconButton(
                            icon: const Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              listNvSgl.listNhiemVu.add(NhiemVu(
                                tieuDe: tenCongViecController.text,
                                hanCongViec: thoiGianHoanThanhController.text,
                                moTaCongViec: moTaCongViecController.text,
                                isDone: false,
                              ));
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                            // print("${listNvSgl.listNhiemVu.length}");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text("Thêm công việc"),
                        ),
                      )
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
