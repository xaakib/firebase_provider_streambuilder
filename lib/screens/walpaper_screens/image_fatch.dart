import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_provider_streambuilder/screens/walpaper_screens/details_screen.dart';
import 'package:flutter/material.dart';

class ImageRetive extends StatefulWidget {
  @override
  _ImageRetiveState createState() => _ImageRetiveState();
}

// getData() async {
//   var firestore = Firestore.instance;
//   QuerySnapshot qn = await firestore.collection("images").getDocuments();
//   return qn.documents;
// }

class _ImageRetiveState extends State<ImageRetive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              child: StreamBuilder(
                stream: Firestore.instance.collection("images").snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (_, index) {
                          DocumentSnapshot data =
                              snapshot.data.documents[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(data: data),
                                ),
                              );
                            },
                            child: GridTile(
                                child: Image.network(
                              data["image"],
                              fit: BoxFit.cover,
                            )),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
