import 'package:flirtii/models/user.dart';
import 'package:flirtii/services/gql/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetUser {
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");
    return token;
  }

  Future<User> fetchUser(GraphQLClient client) async {
    final result = await client.query(QueryOptions(document: GET_USER));
    final data = result.data!["me"];
    return User.fromJson(data);
  }

  isLogin() async {
    final token = await getToken();
    final url = Uri.parse("http://localhost:4000/graphql");
    final headers = {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = {
      'query': 'query { me { _id } }',
    };

    final res = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    final data = jsonDecode(res.body)["data"];

    if (data == null) return false;

    return true;
  }
}
