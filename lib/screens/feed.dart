import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_provider_streambuilder/api/food_api.dart';
import 'package:firebase_provider_streambuilder/model/ad_manager.dart';
import 'package:firebase_provider_streambuilder/notifier/auth_notifier.dart';
import 'package:firebase_provider_streambuilder/notifier/food_notifier.dart';
import 'package:firebase_provider_streambuilder/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_form.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    print("building Feed");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 5,
            expandedHeight: 200,
            // flexibleSpace: Image.asset(
            //   "assets/images/name.png",
            //   fit: BoxFit.cover,
            // ),
            actions: [
              Container(
                height: 80,
                width: 80,
                child: Text(authNotifier.user != null
                    ? authNotifier.user.displayName
                    : "Unknown"),
              ),
              IconButton(
                  icon: Icon(
                    Icons.people,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => UploadData()));
                  }),
            ],
            floating: true,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            title: Text(
              "Movie Server",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: opulerContainerRow(foodNotifier),
          ),
          // SliverPadding(padding: EdgeInsets.only(top: 20)),
          // SliverToBoxAdapter(
          //   child: orangeContainerRow(orangeNotifier),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          foodNotifier.currentFood = null;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return FoodForm(
                isUpdating: false,
              );
            }),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget opulerContainerRow(
    FoodNotifier foodNotifier,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Food",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 238,
          child: ListView.builder(
            itemCount: foodNotifier.foodList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  foodNotifier.currentFood = foodNotifier.foodList[index];
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return FoodDetail();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: 135,
                          child: Image.network(
                            foodNotifier.foodList[index].imageurl.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodNotifier.foodList[index].name.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text((foodNotifier.foodList[index].category
                                  .toString())),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

//   Widget orangeContainerRow(OrangeNotifier orangeNotifier) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Text(
//             "Orange",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Container(
//           height: 238,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: orangeNotifier.orangeList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return GestureDetector(
//                 onTap: () {
//                   orangeNotifier.currentOrange =
//                       orangeNotifier.orangeList[index];
//                   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//                     return FoodDetail();
//                   }));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 180,
//                           width: 135,
//                           child: Image.network(
//                             orangeNotifier.orangeList[index].imageUrl
//                                 .toString(),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 1),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 orangeNotifier.orangeList[index].name
//                                     .toString(),
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Text((orangeNotifier.orangeList[index].category
//                                   .toString())),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

}
