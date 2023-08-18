import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

neworderToArchitect(String mobileNumber, String userMobileNumber, String architectName) async {
  var url = Uri.parse('https://enterprise.smsgupshup.com/GatewayAPI/rest');

  var queryParams = {
    'method': 'SendMessage',
    'send_to': '91$mobileNumber',
    'msg':
        '''Dear $architectName, You got a new order From $userMobileNumber. You can see the details at DMH Archiect App.
SAWNA INFRABUILD PVT. LTD.''',
    'msg_type': 'TEXT',
    'userid': '2000230223',
    'auth_scheme': 'plain',
    'password': 'OTTQZ5sMl',
    'v': '1.1',
    'format': 'text',
  };

  var uri = url.replace(queryParameters: queryParams);
  try {
    var response = await http.get(uri).timeout(const Duration(seconds: 90));
    if (response.statusCode == 200) {
    } else {
      print('Status Code: ${response.statusCode}');
    }
  } catch (error) {
    print(error);
  }
}

neworderToAdmin(String mobileNumber, String userMobileNumber) async {
  var url = Uri.parse('https://enterprise.smsgupshup.com/GatewayAPI/rest');

  // String text = 'From Design My House App';

  var queryParams = {
    'method': 'SendMessage',
    'send_to': '91$mobileNumber',
    'msg':
        '''Dear Admin, You got a new order from $userMobileNumber, you can see the details at DMH Admin Panel.
SAWNA INFRABUILD PVT. LTD.''',
    'msg_type': 'TEXT',
    'userid': '2000230223',
    'auth_scheme': 'plain',
    'password': 'OTTQZ5sMl',
    'v': '1.1',
    'format': 'text',
  };

  var uri = url.replace(queryParameters: queryParams);
  try {
    var response = await http.get(uri).timeout(const Duration(seconds: 90));
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: 'OTP sent successfully');
    } else {
      Fluttertoast.showToast(msg: 'Failed to send OTP');
      print('Status Code: ${response.statusCode}');
    }
  } catch (error) {
    print(error);
    // Fluttertoast.showToast(msg: 'Failed to send OTP');
  }
}

costomerOrderUpdated(
    String mobileNumber, String userName, String orderId) async {
  // print('costomerOrderUpdated');
  var url = Uri.parse('https://enterprise.smsgupshup.com/GatewayAPI/rest');

  var queryParams = {
    'method': 'SendMessage',
    'send_to': '91$mobileNumber',
    'msg':
        '''Design My House - Dear $userName, Your order for $orderId is updated. Login and download from the Design My House Application.
SAWNA INFRABUILD PVT. LTD.''',
    'msg_type': 'TEXT',
    'userid': '2000230223',
    'auth_scheme': 'plain',
    'password': 'OTTQZ5sMl',
    'v': '1.1',
    'format': 'text',
  };

  var uri = url.replace(queryParameters: queryParams);
  try {
    var response = await http.get(uri).timeout(const Duration(seconds: 90));
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: 'OTP sent successfully');
    } else {
      Fluttertoast.showToast(msg: 'Failed to send OTP');
      print('Status Code: ${response.statusCode}');
    }
  } catch (error) {
    print(error);
    // Fluttertoast.showToast(msg: 'Failed to send OTP');
  }
}
