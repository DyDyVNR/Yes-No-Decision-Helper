import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_generator/logics/yes_no_logic.dart';
import 'package:yes_no_generator/pages/get_started_page.dart';
import 'package:yes_no_generator/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _init() async {
    await context.read<YesNoLogic>().getData();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => GetStartedPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.ac_unit, size: 100),
      ),
    );
  }
}
