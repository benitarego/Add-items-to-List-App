import 'package:flutter/foundation.dart';

class JobModel {
//  String jcompanyname;
  final String jtitle;
  final String jlocation;
//  String jcompanylogo;
//  String jsalary;
//  String jdesc;
//  String jpeopleapplied;
//  String jtype;

  JobModel(
//      this.jcompanyname,
      {
    @required this.jtitle,
    @required this.jlocation,
  }
//      this.jcompanylogo,
//      this.jsalary,
//      this.jdesc,
//      this.jpeopleapplied,
//      this.jtype
      );
}
