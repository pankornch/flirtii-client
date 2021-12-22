import 'package:graphql_flutter/graphql_flutter.dart';

final GET_USER = gql(r"""
  query {
    me {
      _id
      email
      firstName
      lastName
      birthDate
      bio
      avatar
      images
      gender
      preferred
    }
  }
""");

final GET_ALL_CHATS = gql(r"""
  query {
    chats {
      _id
      friend {
        firstName
        lastName
      }
      lastMessage {
        text
      }
    }
  }
""");

final GET_CHAT_BY_ID = gql(r"""
  query($input: GetChatInput!) {
    chat(input: $input) {
      _id
      friend {
        _id
        firstName
        lastName
      }
      messages {
        text
        user {
          _id
        }
      }
    }
  }
""");

final GET_LIKES = gql(r"""
  query($type: LikeTypes!) {
    likes(type: $type) {
      target {
        _id
        avatar
        firstName
        lastName
        createdAt
      }
      source {
         _id
        avatar
        firstName
        lastName
        createdAt
      }
      matched
    }

    me {
      _id
    }
  }
""");
