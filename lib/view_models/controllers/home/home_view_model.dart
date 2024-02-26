import 'package:get/get.dart';
import 'package:getx_practise/models/home/user_list_model.dart';
import 'package:getx_practise/repositories/home/home_repository.dart';

import '../../../data/response/status.dart';

class
HomeViewModel extends GetxController {
  final _api = HomeRepository();

  var rxResponseStatus = Status.Loading.obs;
  var userList = UserListModel().obs;
  var errorMessage = ''.obs;

  void setRxResponseStatus(Status status) {
    rxResponseStatus.value = status;
  }

  void setUserList(UserListModel myUserList) {
    userList.value = myUserList;
  }

  void setErrorMessage(String message) {
    errorMessage.value = message;
  }

  void userListApi() {
    _api.userListModel().then((value) {
      setRxResponseStatus(Status.Completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setErrorMessage(error.toString());
      setRxResponseStatus(Status.Error);
    });
  }

  void refreshApi() {
    setRxResponseStatus(Status.Loading);
    _api.userListModel().then((value) {
      setRxResponseStatus(Status.Completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setErrorMessage(error.toString());
      setRxResponseStatus(Status.Error);
    });
  }
}
