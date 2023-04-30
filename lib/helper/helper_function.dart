import 'package:shared_preferences/shared_preferences.dart';
class HelperFunction{
static const String USERKEY="USERKEY";
// create method set usersiginState
static Future UsersigninState(bool state)async{
  SharedPreferences preferences =await SharedPreferences.getInstance();
  preferences.setBool(USERKEY, state);
}
// create method getusersignState
static Future GetusersigninState()async {
  SharedPreferences preferences =await SharedPreferences.getInstance();
  return preferences.get(USERKEY);
}
}