import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/apiModel.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Future<List<ApiModel>?> fetchWallPaper({required String search}) async {
    String apiKey = "39873406-ff4b2aa4ad74d0d80df8ba5f6";
    String searchData = search;
    String Api =
        "https://pixabay.com/api/?key=$apiKey&q=$searchData&image_type=photo&pretty=true&orientation=vertical";
    http.Response response = await http.get(
      Uri.parse(Api),
    );
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      List imgList = decodedData['hits'];
      List<ApiModel> listData = imgList
          .map(
            (e) => ApiModel.formJSON(
              data: e,
            ),
          )
          .toList();
      return listData;
    } else {
      return null;
    }
  }
}
