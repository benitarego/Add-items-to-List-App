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
  final List<JobModel> _jobModels = [
    JobModel(jtitle: 'Flutter Developer', jlocation: 'Mumbai'),
    JobModel(jtitle: 'ML Engineer', jlocation: 'Mumbai'),
  ];

  //making controller's to store what i input in text fields
  final _jobTitleController = TextEditingController();
  final _jobLocationController = TextEditingController();
  //see the input text fields below
  //function to pass controller data to addNewJobModel()
  void _submitData() {
    if (_jobTitleController.text.isEmpty) {
      return;
    }
    if (_jobLocationController.text.isEmpty) {
      return;
    }
    final _enteredTitle = _jobTitleController.text;
    final _enteredLocation = _jobLocationController.text;
    _addNewJobModel(_enteredTitle, _enteredLocation);

    //after adding here is a good place to clear your controller.text

    Navigator.of(context).pop();
  }

  //the method that add's stuff to the list above
  void _addNewJobModel(String jobtitle, String joblocation) {
    final newJobModel = JobModel(jtitle: jobtitle, jlocation: joblocation);

    setState(() {
      _jobModels.add(newJobModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Add data to List',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: _jobModels.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_jobModels[index].jtitle),
              subtitle: Text(_jobModels[index].jlocation),
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
                            decoration: InputDecoration(labelText: 'Job Title'),
                            controller: _jobTitleController,
                            onSubmitted: (_) => _submitData(),
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Job Location'),
                            controller: _jobLocationController,
                            onSubmitted: (_) => _submitData(),
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
                          onPressed: _submitData,
                          child: Text('Add'),
                        )
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
