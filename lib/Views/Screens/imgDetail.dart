import 'package:flutter/material.dart';
import 'package:wallpaper/Model/apiModel.dart';

class ImgDetail extends StatefulWidget {
  const ImgDetail({super.key});

  @override
  State<ImgDetail> createState() => _ImgDetailState();
}

class _ImgDetailState extends State<ImgDetail> {
  @override
  Widget build(BuildContext context) {
    ApiModel data = ModalRoute.of(context)!.settings.arguments as ApiModel;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.tags}"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: h * .7,
              width: w * .9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("${data.largeImageURL}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
