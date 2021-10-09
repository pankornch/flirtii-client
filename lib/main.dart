import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'configs/gql.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final routes = Routes();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: GqlConfig.client,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.promptTextTheme(
              Theme.of(context).textTheme,
            ).apply(
              bodyColor: kMainDarkColor,
            ),
          ),
          getPages: routes.getPages,
          initialRoute: routes.getInitialPage(),
        ));
  }
}
