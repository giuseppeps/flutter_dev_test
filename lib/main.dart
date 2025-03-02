import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app.dart';
import 'package:flutter_dev_test/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}
