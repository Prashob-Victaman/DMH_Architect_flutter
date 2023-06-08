
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ArchitectDataController extends GetxController{

  String? name;
  String? email;
  String? number;

  setData(name,email,number){
    this.name = name;
    this.email = email;
    this.number = number;
    refresh();
  }

}