import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flirtii/screens/discover/widgets/circle_status.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final q = gql(r"""
    query($id: String!) {
      user(id: $id) {
        _id
        email
        nickname
        bio
        firstName
      }
    }
  """);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Query(
      options:
          QueryOptions(document: q, variables: {"id": Get.parameters["id"]}),
      builder: (result, {fetchMore, refetch}) {
        final data = result.data?["user"];

        late User _user;

        if (!result.isLoading) {
          _user = User(
            id: data["_id"],
            email: data["email"],
            bio: data["bio"],
            nickname: data["nickname"],
          );
        }

        final img = "https://i.pravatar.cc/150?u";

        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: kMainDarkColor),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    color: kMainDarkColor,
                  ),
                ),
              ],
            ),
          ),
          body: result.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "$img=${_user.id}",
                            width: size.width * 0.9,
                            height: size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 3; i++)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "$img=${_user.id}$i",
                                  width: size.width * 0.25,
                                  height: size.height * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${_user.firstName}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "24",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "About me",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${_user.bio ?? ''}",
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleStatus(
                                  icon: Icons.close,
                                  color: Colors.red,
                                  onTap: () {},
                                ),
                                CircleStatus(
                                  icon: Icons.favorite,
                                  color: Colors.red[300]!,
                                  onTap: () {},
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
