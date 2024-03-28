import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:yes_no_generator/constants/status.dart';
import 'package:yes_no_generator/models/yes_no_model.dart';

class YesNoLogic extends ChangeNotifier{

  YesNoModel _yesNoModel = YesNoModel();
  YesNoModel get  yesNoModel => _yesNoModel;

  Status _status = Status.none;
  Status get status => _status;

  void setReadingLoading(){
    _status = Status.loading;
    notifyListeners();
  }

  Future getData() async {
    String url = "https://yesno.wtf/api";
    try{
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        _yesNoModel = await compute(yesNoModelFromJson, response.body);
        _status = Status.done;
      }
    } catch(e){
      print("Error while reading random user, ${e.toString()}");
      _status = Status.error;
    }
    notifyListeners();
  }
}

