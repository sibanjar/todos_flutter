import 'dart:convert';
import '../resources/constants.dart';
import '../resources/url_names.dart';
import 'data_fetcher.dart';
import 'package:http/http.dart' as http;


class PostRepository{
// change DataFEtcher to good name
// 12,13 ma try catch
  Future<List<UserInformation>> fetchPosts() async {
    final response = await http.get(Uri.parse(UrlNames.usersUrl));
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => UserInformation.fromJson(item)).toList();
  }

  Future<String?> deleteDataFromAPI(int postId) async {
    final response = await http.delete(Uri.parse(UrlNames.postDeleteUrl(postId)));
    if (response.statusCode == 200) {
      return AppConstants.deleteSuccess(postId);
    } else {
      throw Exception(AppConstants.deleteFailApi);
    }
  }
  Future<void> updateDataToAPI(int id,String name) async {
    final dataToUpdate = UserInformation(name: name, id: id).toJson();
    final response = await http.put(Uri.parse('${UrlNames.usersUrl}/$id'),
      body: json.encode(dataToUpdate),
      headers: {'Content-Type': 'application/json'} );
    if (response.statusCode == 200) {
      print('Data updated successfully');
    } else {
      print('Failed to update data. Status code: ${response.statusCode}');
    }
  }

}