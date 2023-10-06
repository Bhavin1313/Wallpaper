import 'package:flutter/material.dart';
import 'package:wallpaper/Utils/Helpers/apiHelper.dart';

import '../../Model/apiModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  String searchData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: search,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                suffix: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    setState(() {
                      searchData = search.text;
                    });
                    search.clear();
                  },
                ),
                hintText: "Search Hear........"),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiHelper.apiHelper.fetchWallPaper(search: searchData),
              builder: (cxt, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.hasError}"),
                  );
                } else if (snapshot.hasData) {
                  List<ApiModel>? alldata = snapshot.data;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 400,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: alldata?.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'imgDetail',
                              arguments: alldata?[i]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image:
                                  NetworkImage("${alldata?[i].largeImageURL}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
