import 'dart:convert';
import 'package:example2/config/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isLoading = false;

  List todoList = [];

  Future<void> fetchTodoList() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(Uri.parse("$apiUrl/todos"));
    if (response.statusCode == 200) {
      setState(() {
        todoList.addAll(json.decode(response.body));
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo",
        ),
      ),
      body: isLoading
          ? const Center(
              child: Text(
                "กำลังโหลด...",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      todoList[index]['title'],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
