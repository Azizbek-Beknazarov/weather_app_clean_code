import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
import 'package:ob_havo_app/features/presentation/page/obhavo_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.blue)
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        child: ObHavoPage(),
        create: (BuildContext context) => sl<ObHavoBloc>(),
      ),
    );
  }
}
