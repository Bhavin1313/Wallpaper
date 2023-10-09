import 'package:async_wallpaper/async_wallpaper.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: "${data.largeImageURL}",
            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
          );
        },
        label: Text("Set WallPaper"),
        icon: Icon(Icons.image),
      ),
      appBar: AppBar(
        title: Text("${data.tags}"),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("${data.largeImageURL}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
