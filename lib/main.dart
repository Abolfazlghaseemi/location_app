import 'package:flutter/material.dart';
import 'package:location_app/Splash.dart';
import 'package:location_app/showDialog.dart';
// ignore: depend_on_referenced_packages
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _navigateToSecondPageAutomatically();
  }

  void _checkLocationPermission() async {
    PermissionStatus permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      // Location permission is granted, do something
      print('Location permission is granted');
    } else {
      // Request location permission
      permission = await Permission.location.request();
      if (permission == PermissionStatus.granted) {
        // Location permission is granted, do something
        print('Location permission is granted');
      } else {
        // Location permission is not granted, show message or take appropriate action
        print('Location permission is not granted');
      }
    }
  }

  void _navigateToSecondPageAutomatically() async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ShowDialogWidget(), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
    );
  }
}
