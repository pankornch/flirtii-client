import 'package:flirtii/models/like.dart';
import 'package:flirtii/models/user.dart';
import 'package:flirtii/screens/likes/widgets/card.dart';
import 'package:flirtii/screens/likes/widgets/navbar_screen.dart';
import 'package:flirtii/screens/likes/widgets/top_tabs.dart';
import 'package:flirtii/services/getUser.dart';
import 'package:flirtii/services/gql/query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LikesScreen extends StatelessWidget {
  LikesScreen({Key? key}) : super(key: key);
  final tabs = ["All", "You Liked", "Request Likes"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        LikeNavBar(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: LikeTopTabs(
            tabs: tabs,
            renderItem: (int index) {
              final q = ["ALL", "LIKES", "LIKERS"];
              return Query(
                  options: QueryOptions(
                    document: GET_LIKES,
                    variables: {
                      "type": q[index],
                    },
                  ),
                  builder: (result, {refetch, fetchMore}) {
                    if (result.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var _likes = Like().fromList(result.data!["likes"]);
                    var _user = User.fromJson(result.data!["me"]);
                    return Container(
                      height: size.height - (100 + 210),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var l in _likes)
                              LikeCard(
                                buttonType: l.getType(_user) == "LIKE"
                                    ? "UNLIKE"
                                    : "LIKE_BACK",
                              ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
