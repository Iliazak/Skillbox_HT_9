import 'package:http_dio/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool isLoading = false;
  bool hasError = false;
  late String errorMassage;
  late List<User> users;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    // getDatahttp();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });
    try {
      final responce = await _dio
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      users = responce.data.map<User>((user) => User.fromJson(user)).toList();
      // print(responce.data);
    } on DioError catch (e) {
      print(e.error);
      errorMassage = e.response!.data['massage'];
      setState(() {
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  // getDatahttp() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'));
  //     var data = json.decode(response.body);
  //     users = data.map<User>((user) => User.fromJson(user)).toList();
  //   } catch (e) {
  //     setState(() {
  //       hasError = true;
  //     });
  //   }

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : hasError
                ? Text('Error')
                : ListView(
                    children: users.map((user) {
                      return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.info!.poster));
                    }).toList(),
                  ));
  }
}
