import 'package:flutter/material.dart';
import 'package:flutterapp1/JobModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List <JobModel> item = <JobModel>[];
//  String temp;

  JobModel _jobModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Add data to List', style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: item.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(item[index].jtitle),
//              subtitle: Text(item[index].jlocation),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add job'),
                      content: Column(
                        children: <Widget>[
                          TextField(
                            onChanged: (String value) {
                              _jobModel.jtitle = value;
                            },
                          ),
//                          TextField(
//                            onChanged: (String value1) {
//                              _jobModel.jlocation = value1;
//                            },
//                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              item.add(_jobModel);
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Add'),
                        )
                      ],
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}