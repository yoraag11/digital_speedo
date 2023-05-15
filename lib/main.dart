import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:speedo_ev/views/screens/dashboard/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Speedo-EV',
      theme: ThemeData.dark(),
      home: const Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
