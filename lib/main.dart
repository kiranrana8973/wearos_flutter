import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

// Run this app using below command because wear plugin does not support null safety
// flutter run --no-sound-null-safety

// For further details go to the link below
// https://fluttercorner.com/cannot-run-with-sound-null-safety-because-dependencies-dont-support-null-safety/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear OS Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wear OS Demo'),
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
  late String _text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: WatchShape(
        builder: (context, shape, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (value) {
                      _text = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Text',
                    ),
                  ),
                  TextFormField(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: _text,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: const Text('Add'),
                    ),
                  ),
                  // child,
                ],
              ),
            ),
          );
        },
        // child: AmbientMode(
        //   builder: (context, mode, child) {
        //     return Text(
        //       'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
        //     );
        //   },
        // ),
      ),
    );
  }
}
