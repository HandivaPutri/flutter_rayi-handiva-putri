import 'package:api_demo/models/user_model.dart';
import 'package:api_demo/service/services.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  List<Data> userData = [];
  bool isLoading = false;

  void getUser() async {
    //panggil fetchData dari class myServices
    Service services = Service();
    isLoading = true;
    final api = await services.fetchData();
    userData = api!;
    isLoading = false;

    notifyListeners();
  }
}
