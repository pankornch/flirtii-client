import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final kGraphqlUrl = "http://localhost:4000/graphql";
final kGraphqlWs = "ws://localhost:4000/graphql";

class GqlConfig {
  static final HttpLink httpLink = HttpLink(kGraphqlUrl);

  static final link = Link.split(
      (request) => request.isSubscription,
      WebSocketLink(kGraphqlWs,
          config: SocketClientConfig(inactivityTimeout: Duration(hours: 1))),
      httpLink);

  static final ValueNotifier<GraphQLClient> client =
      ValueNotifier<GraphQLClient>(GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  ));
}
