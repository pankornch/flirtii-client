import 'package:flirtii/models/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUser {
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");
    return token;
  }

  Future<User> fetchUser(GraphQLClient client) async {
    final q = r"""
      query {
        me {
          _id
          email
          firstName
          lastName
        }
      }
    """;

    final result = await client.query(QueryOptions(document: gql(q)));
    final data = result.data!["me"];
    return User(
      id: data["_id"],
      email: data["email"],
      firstName: data["firstName"],
      lastName: data["lastname"],
    );
  }
}
