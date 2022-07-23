import 'package:api_dio_practice/User_Model/user_model.dart';
import 'package:api_dio_practice/repository/user_apiservices.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<UserModel>>? _usermodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: _usermodel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(snapshot.data![index].id.toString()),
                    ),
                    title: Text(snapshot.data![index].username.toString()),
                    subtitle: Text(snapshot.data![index].email.toString()),
                    trailing: Text(snapshot.data![index].name.toString()),
                  );
                },
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Colors.cyan,
              ));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final usersApi = UserApiServices();
            final users = await usersApi.fetchUsers();
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
