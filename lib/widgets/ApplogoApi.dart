import 'dart:convert';
import 'package:hopegamings/contant/Api_constant.dart';
import 'package:http/http.dart'as http;


var logo;
Future<void> fetchApplogo() async {
  final url = Uri.parse(Apiconst.App_Logo);
  final response = await http.get(
    url,
  );
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    print(responseData);

    logo = responseData['data'];
    print(logo);
    //return UserProfile.fromJson(responseData);
  } else {
    throw Exception("Failed to fetch notifications");
  }
}