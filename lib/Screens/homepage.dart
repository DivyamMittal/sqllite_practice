import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqllite_practice/Apis/apis.dart';
import 'package:sqllite_practice/Database/database_helper.dart';
import 'package:sqllite_practice/Screens/insert_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHelper.instance.addListener(() {
      setState(() {});
    });
    APIs.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite Practice"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => InsertDataScreen()));
        },
        child: Icon(Icons.add),
      ),

      // body
      body: FutureBuilder(
        future: DatabaseHelper.instance.getDataDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            log("${snapshot.data?.length}");
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(snapshot.data![index]['id'].toString()),
                  ),
                  title: Text(
                    snapshot.data![index]["title"].toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(snapshot.data![index]["date"].toString()),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
