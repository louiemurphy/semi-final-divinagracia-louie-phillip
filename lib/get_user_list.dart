import 'dart:convert';
import 'details_screen.dart';
import 'user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GetUsersList extends StatefulWidget {
  @override
  State<GetUsersList> createState() => _GetUsersListState();
}

class _GetUsersListState extends State<GetUsersList> {
  Future<http.Response> getData() async {
    http.Response response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    return response;
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Users"),
      ),
      body: FutureBuilder<http.Response>(
          future: getData(),
          builder: ((context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List list = jsonDecode(snapshot.data!.body.toString());
              print("snapshot.data " + list.toString());

              List<Model> usersModelList = list
                  .map((e) => Model.fromJson(e))
                  .toList();

              return ListView.builder(
                  itemCount: usersModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(usersModelList[index].id.toString()),
                      title: Text(usersModelList[index].title.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(model: usersModelList[index],)),
                        );
                      },
                    );
                  });
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          })),
    );
  }
}