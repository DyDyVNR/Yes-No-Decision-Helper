import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_generator/logics/yes_no_logic.dart';
import 'package:yes_no_generator/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> YesNoLogic())
      ],
      child: MaterialApp(
        theme: ThemeData(
          
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: SplashPage(),
        
      ),
    );
  }
}