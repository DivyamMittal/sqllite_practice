import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqllite_practice/Database/database_helper.dart';
import 'package:sqllite_practice/Model/user_model.dart';

class InsertDataScreen extends StatelessWidget {
  const InsertDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var usernameController = TextEditingController();
    var idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Data'),
        centerTitle: true,
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                  hintText: "Enter Id",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: "Enter Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  // int id = int.parse(idController.text.toString());
                  // String name = nameController.text.toString();
                  // String username = usernameController.text.toString();
                  // await DatabaseHelper.instance
                  //     .insert(UserModel(id, name, username).toJson());
                  // log("${await DatabaseHelper.instance.getDataDB()}");
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
