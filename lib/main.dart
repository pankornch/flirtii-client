import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/configs/gql.dart';
import 'package:flirtii/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  final client = GqlConfig.client();
  runApp(GraphQLProvider(
    client: client,
    child: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final routes = Routes();
  bool loading = true;
  late String initialRoute;

  @override
  void initState() {
    routes.getInitialPage().then((value) {
      setState(() {
        initialRoute = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.promptTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: kMainDarkColor,
        ),
      ),
      getPages: routes.getPages,
      initialRoute: initialRoute,
    );
  }
}
