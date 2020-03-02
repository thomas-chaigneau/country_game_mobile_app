import 'package:flutter/cupertino.dart';

class RouteModel extends Route{
  String path;
  WidgetBuilder widgetBuilder;
  RouteModel(
    this.path,
    this.widgetBuilder,
  );
}