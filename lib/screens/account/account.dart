import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/user.dart';
import 'package:flirtii/screens/account/widgets/navbar.dart';
import 'package:flirtii/services/gql/query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Query(
        options: QueryOptions(
          document: GET_USER,
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          print(result.data!["me"]);
          final user = User.fromJson(result.data!["me"]);
          // print(user.birthDate);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AccountNavbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                              height: size.width,
                              width: size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var i = 0; i < 3; i++)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                                    height: 130,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "${user.firstName} ${user.lastName} (22)",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              user.gender! == "Male"
                                  ? Icon(
                                      Icons.male,
                                      color: Colors.blue,
                                      size: 32,
                                    )
                                  : Icon(
                                      Icons.female,
                                      color: kMainPinkColor,
                                      size: 32,
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Bio :"),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              user.bio == null ? "" : user.bio!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
