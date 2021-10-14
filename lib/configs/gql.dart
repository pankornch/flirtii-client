import 'package:flirtii/services/getUser.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final kGraphqlUrl = "http://localhost:4000/graphql";
final kGraphqlWs = "ws://localhost:4000/graphql";

class GqlConfig {
  static ValueNotifier<GraphQLClient> client() {
    final HttpLink httpLink = HttpLink(
      kGraphqlUrl,
    );
    final AuthLink authLink = AuthLink(
      getToken: () async {
        final token = await GetUser().getToken();
        return "Bearer $token";
      },
    );
    final link = Link.split(
      (request) => request.isSubscription,
      WebSocketLink(
        kGraphqlWs,
        config: SocketClientConfig(inactivityTimeout: Duration(hours: 1)),
      ),
      httpLink,
    );

    final policies = Policies(
      fetch: FetchPolicy.noCache,
    );

    final ValueNotifier<GraphQLClient> client =
        ValueNotifier<GraphQLClient>(GraphQLClient(
      link: authLink.concat(link),
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: policies,
        mutate: policies,
        watchQuery: policies,
      ),
    ));

    return client;
  }
}
