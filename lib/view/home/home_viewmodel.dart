import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_test_project/api/model/user/user_model.dart';
import 'package:stacked_test_project/app/app.locator.dart';
import 'package:stacked_test_project/app/app.router.dart';
import 'package:stacked_test_project/repository/api_repository.dart';

class HomeViewmodel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _apiRep = locator<ApiRepository>();
  final List<UserModel> _accountList = [];
  int id = 1;
  bool _isloading = false;
  List<UserModel> get accountList => _accountList;
  bool get isloading => _isloading;
  bool scrollLoading = false;

  final ScrollController controller = ScrollController();

  navProfileView() {
    _navService.navigateToProfileView();
  }

  onReady() async {
    await callApi();
    _isloading = true;
    controller.addListener(loadMore);
  }

  loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      id = id + 1;
      debugPrint('$id');
      setBusy(true);
      notifyListeners();
      await Future.delayed(const Duration(seconds: 5));
      await callApi();
      setBusy(false);
      notifyListeners();
    } else {}
  }

  refresh() async {
    _isloading = false;
    notifyListeners();
    _accountList.clear();
    id = 1;
    await callApi();
    _isloading = true;
    notifyListeners();
  }

  callApi() async {
    var response = await _apiRep.getUserList("$id");
    response.fold((l) => null, (r) => _accountList.addAll(r));
    notifyListeners();
  }
}
