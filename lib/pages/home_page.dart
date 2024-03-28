import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_generator/constants/status.dart';
import 'package:yes_no_generator/logics/yes_no_logic.dart';
import 'package:yes_no_generator/models/yes_no_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // context.read<YesNoLogic>().getData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.orangeAccent,
      title: Text("Decision Maker"),
    );
  }

  Widget get _buildBody {
    Status readingStatus = context.watch<YesNoLogic>().status;

    switch (readingStatus) {
      case Status.none:
      case Status.loading:
        return Center(child: CircularProgressIndicator());
      case Status.done:
        return _buildListView;
      case Status.error:
        return _buildErrorInternet;
    }
  }

  Widget get _buildErrorInternet {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off),
          Text("Something Went Wrong \n No Internet Connection"),
          ElevatedButton.icon(
            onPressed: () async {
              context.read<YesNoLogic>().setReadingLoading();
              await context.read<YesNoLogic>().getData();
            },
            icon: Icon(Icons.refresh),
            label: Text("RETRY"),
          ),
        ],
      ),
    );
  }

  Widget get _buildListView {
    YesNoModel results =
        context.watch<YesNoLogic>().yesNoModel;

    return Container(
      child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(results.answer, style: TextStyle(color: results.answer=='yes'?Colors.green:Colors.red, fontSize: 30, fontWeight: FontWeight.bold),), 
              Image(image: NetworkImage(results.image))
            ],
          ),
        )
                
                );
  }
}
