import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/user.dart';
import 'package:flirtii/services/getUser.dart';
import 'package:flirtii/shared/Checkbox.dart';
import 'package:flirtii/shared/DatePicker.dart';
import 'package:flirtii/shared/MainCotainer.dart';
import 'package:flirtii/shared/RadioGroup.dart';
import 'package:flirtii/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  _GetStartScreenState createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  User user = User();
  bool isFectched = false;
  var nicknameController = TextEditingController();
  var bioController = TextEditingController();
  Map<String, dynamic> form = {};

  fetchUser(GraphQLClient client) async {
    if (isFectched) return;
    final res = await GetUser().fetchUser(client);

    setState(() {
      user = res;
      isFectched = true;
    });
  }

  onSubmit(GraphQLClient client) async {
    setState(() {
      form["nickname"] = nicknameController.text;
      form["bio"] = bioController.text;
      form["avatar"] = "https://i.pravatar.cc/150?u=${user.id}";
      if (form["birthDate"] == null) {
        form["birthDate"] = DateTime.now().toString();
      }
      if (form["gender"] == null) {
        form["gender"] = "Male";
      }
    });

    final q = r"""
      mutation($input: GetStartInput!) {
        getStart(input: $input) {
          _id
        }
      }
    """;

    await client.mutate(
      MutationOptions(
        document: gql(q),
        variables: {"input": form},
      ),
    );

    Get.toNamed("/discover");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GraphQLConsumer(
      builder: (GraphQLClient client) {
        fetchUser(client);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: MainContainer(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        "https://i.pravatar.cc/150?u=${user.id}",
                        width: size.width,
                        height: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Input(
                      hintText: "Nickname",
                      labelText: "Nickname",
                      controller: nicknameController,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    DatePicker(
                      title: "Date of Birth",
                      onChange: (DateTime date) {
                        setState(() {
                          form["birthDate"] = date.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    RadioGroup(
                      title: "Gender",
                      onChange: (OptionProps val) {
                        setState(() {
                          form["gender"] = val.value;
                        });
                      },
                      options: [
                        OptionProps(title: "Male", value: "Male"),
                        OptionProps(title: "Female", value: "Female"),
                        OptionProps(title: "LGBT", value: "LGBT"),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Input(
                      hintText: "Bio",
                      labelText: "Bio",
                      controller: bioController,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    SharedCheckBox(
                      title: "Preferred",
                      options: [
                        OptionProps(title: "Male", value: "Male"),
                        OptionProps(title: "Female", value: "Female"),
                        OptionProps(title: "LGBT", value: "LGBT"),
                      ],
                      onChange: (List<OptionProps> val) {
                        setState(() {
                          form["preferred"] = val.map((e) => e.value).toList();
                        });
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () => onSubmit(client),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: kMainPinkColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text("GET START",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
