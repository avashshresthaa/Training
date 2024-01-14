import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/photo_model.dart';
import 'package:flutter_application_3/network/dataprovider.dart';

import 'page2details.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var getPhoto;

  Future<PhotosModel?> getPhotoData() async {
    var getData = await DataProvider().getPhoto();
    return getData;
  }

  @override
  void initState() {
    getPhoto = getPhotoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PhotosModel?>(
          future: getPhoto,
          builder: (context, snapshot) {
            print(snapshot.data?.message);
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.photos!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageDetail(
                            photos: snapshot.data!.photos![index],
                          );
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        color: Colors.grey,
                        child: ListTile(
                            title: Text(snapshot.data!.photos![index].title!)),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
