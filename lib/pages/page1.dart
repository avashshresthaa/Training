import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/post_model.dart';
import 'package:flutter_application_3/network/dataprovider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // posts variable created to store all the json converted data. //Check DataProvider ko getpost ma return gareko part
  List<PostModel>? posts;

  //To show loading widget data load huna time lagcha tei bhayera first ma value true rakheko
  bool isLoading = true;

  //A function that call the getPost funciton from the class DataProvider
  getPostData() async {
    posts = await DataProvider().getPost();

    // post ma data null ayena bhane success print huncha ani setstate ma loading chai false to show the data
    if (posts != null) {
      print("success");
      setState(() {
        isLoading = false;
      });
    }
  }

//init bhaneko yo page kholne bela kei function or kei print garna lai use garcham
//aile hamle init ma getPostData lai call gareko cham to call the api when this page opens
  @override
  void initState() {
    getPostData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //isLoading ko value true cha bhane loading widget dekhaucha (CircularProgressIndicatior)
    return isLoading == true
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: posts!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(posts![index].title),
              );
            },
          );
  }
}

//ListView builder chai dynamic list bhako bhaye use garcham aba list ma jati ni data auna sakcha ani tyo sab data lai dekahuna na listview builder use gariracham

//Documentation
//https://www.geeksforgeeks.org/listview-builder-in-flutter/
