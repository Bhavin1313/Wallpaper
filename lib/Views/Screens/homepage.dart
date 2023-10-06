import 'package:flutter/material.dart';
import 'package:wallpaper/Utils/Helpers/apiHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder(
                future: ApiHelper.apiHelper.fetchWallPaper(search: "dog"),
                builder: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 400,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: ,
                    itemBuilder: itemBuilder);
              ),),
        ],
      ),
    );
  }
}
