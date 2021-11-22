import 'package:investment/models/app_user.dart';
import 'package:investment/models/create_user.dart';
import 'package:investment/utils/utils.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<dynamic> registerUser(CreateUser user) async {
    var result = await http.post(Uri.parse("${Utils.apiUrl}v1/users"),
        body: user.toJson(),
        headers: {
          'x-api-key': Utils.apiKey,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (result.statusCode == 201) {
      return result;
    } else {
      return null;
    }
  }

  Future<AppUser?> getUser() async {
    var result = await http.get(Uri.parse("${Utils.apiUrl}v1/users"), headers: {
      'Authorization': 'Bearer ${Utils.idToken!.token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (result.statusCode == 200) {
      return AppUser.fromJson(result.body);
    } else {
      return null;
    }
  }
}
