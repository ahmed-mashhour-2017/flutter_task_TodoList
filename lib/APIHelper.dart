import 'package:http/http.dart';
import 'dart:convert';
import 'package:assignmen_day3_tasks/models.dart';

class APIHelper {
  saveTask(Task std) async {
    var url = Uri.https("api.mohamed-sadek.com", "/Task/POST");
    var res = await post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, Object>{
          "ID": std.ID,
          "Title": std.Title,
          "IsDone": std.IsDone,
          "CreatedDate": std.CreatedDate,
        }));
    var data = jsonDecode(res.body);
    print(data);
  }

  Future<bool> deleteTask(int id) async {
    print(id);
    //https://api.mohamed-sadek.com/Student/Delete?id=609
    var url = Uri.https(
        "api.mohamed-sadek.com", "/Task/Delete", {'id': id.toString()});
    var res = await delete(url);
    print(res.statusCode);
    print(res.body);
    return jsonDecode(res.body)["Success"] as bool;
  }

  Future<List<Task>> getaAllTasks() async {
    //https://api.mohamed-sadek.com/Student/Get
    var url = Uri.https("api.mohamed-sadek.com", "/Task/Get");
    var res = await get(url);
    var data = jsonDecode(res.body)['Data'] as List;
    print(data);
    print("hello from api");
    List<Task> list = data
        .map((item) => Task(
              ID: item["ID"],
              Title: item["Title"],
              IsDone: item["IsDone"],
              CreatedDate: item['CreatedDate'],
            ))
        .toList();
    //         int ID;
    // String Title;
    // bool IsDone;
    // String CreatedDate;
    // print(list[0].Age);
    return list;
    // get(url).then((Response) {
    //   print(Response.statusCode);
    //   print(Response.body);
    // })
  }
}
