import 'dart:convert';
import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:sqllite_practice/Database/database_helper.dart';
import 'package:sqllite_practice/Model/user_model.dart';

class APIs {
  static Future<void> fetchData() async {
    try {
      String url = "https://safidonbreakingnews.com/wp-json/wp/v2/posts?_embed";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var db = await DatabaseHelper.instance.database;
        var batch = db!.batch();
        for (var json in data) {
          NewsModel model = NewsModel.fromJson(json);
          batch.insert("newstable", model.toJson(),
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        await batch.commit();
      } else {
        log('Failed to load post');
      }
    } catch (e) {
      log("Error : $e");
    }
  }
}
