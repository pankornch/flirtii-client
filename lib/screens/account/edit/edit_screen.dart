import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/Checkbox.dart';
import 'package:flirtii/shared/DatePicker.dart';
import 'package:flirtii/shared/RadioGroup.dart';
import 'package:flirtii/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kMainDarkColor),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
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
                          for (var i = 0; i < 2; i++)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                                height: 130,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate,
                              size: 48,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Input(hintText: "Email", labelText: "Email"),
                      SizedBox(
                        height: 10,
                      ),
                      Input(hintText: "First Name", labelText: "First Name"),
                      SizedBox(
                        height: 10,
                      ),
                      Input(hintText: "Last Name", labelText: "Last Name"),
                      SizedBox(
                        height: 10,
                      ),
                      DatePicker(title: "Date of Birth"),
                      SizedBox(
                        height: 10,
                      ),
                      RadioGroup(
                        title: "Gender",
                        selected: 1,
                        options: [
                          OptionProps(title: "Male", value: "Male"),
                          OptionProps(title: "Female", value: "Female"),
                          OptionProps(title: "LGBT", value: "LGBT"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SharedCheckBox(
                        title: "Preferred",
                        options: [
                          OptionProps(title: "Male", value: "Male"),
                          OptionProps(title: "Female", value: "Female"),
                          OptionProps(title: "LGBT", value: "LGBT")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus &&
                              currentFocus.focusedChild != null) {
                            currentFocus.focusedChild?.unfocus();
                          }
                        },
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "About Me",
                          labelText: "About Me",
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(14),
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: kMainPinkColor,
                          ),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
