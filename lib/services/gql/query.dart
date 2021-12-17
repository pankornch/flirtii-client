import 'package:graphql_flutter/graphql_flutter.dart';

final GET_USER = gql(r"""
      query {
        me {
          _id
          email
          firstName
          lastName
        }
      }
    """);
