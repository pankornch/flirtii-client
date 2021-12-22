import 'package:graphql_flutter/graphql_flutter.dart';

final SIGN_UP = gql(r"""
  mutation($input: SignUpInput!) {
    signUp(input: $input) {
      token
    }
  }
""");

final SIGN_IN = gql(r"""
  mutation($input: SignInInput!) {
    signIn(input: $input) {
      token
    }
  }
""");

final SEND_CHAT = gql(r"""
  mutation($input: SendChatInput!) {
    sendChat(input: $input) {
      _id
    }
  }
""");
