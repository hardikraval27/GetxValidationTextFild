import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:getxvalidation/controller/controllers.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController number = TextEditingController();

    return SafeArea(
        child: GetX<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Scaffold(
                body: controller.isLoding.value
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: TextField(
                              controller: name,
                              decoration: InputDecoration(
                                  errorText: controller.status1.value
                                      ? "hardfik"
                                      : null,
                                  hintText: "hardik",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (value) {
                                if (value != "") {
                                  controller.status1.value = false;
                                }
                              },
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: TextField(
                              controller: number,
                              decoration: InputDecoration(
                                  errorText:
                                      controller.status2.value ? "jay" : null,
                                  hintText: "jay",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (value) {
                                if (value != "") {
                                  controller.status2.value = false;
                                }
                              },
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                String s = name.text;
                                String ss = number.text;
                                print(s);
                                print(ss);
                                if (name.text == "") {
                                  controller.status1.value = true;
                                } else if (number.text == "") {
                                  controller.status2.value = true;
                                }
                              },
                              child: Text("submit"))
                        ],
                      ),
              );
            }));
  }
}
