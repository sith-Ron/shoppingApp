import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star_fashion/firebase_options.dart';
//import 'package:star_fashion/screens/home.dart';
import 'package:star_fashion/widget_tree.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://bjttkzkiyqfooxanapzg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqdHRremtpeXFmb294YW5hcHpnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE0MjIxMjgsImV4cCI6MjA0Njk5ODEyOH0.A_hjt3AqV6AXmc7JKdRSnGFXtozk-VhF9agmegge2U0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Unna',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetTree(),
    );
  }
}
