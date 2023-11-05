import 'package:flutter/cupertino.dart';
import 'package:todos/api_test_app/data/data_fetcher.dart';
import 'package:todos/api_test_app/data/post_repository.dart';
import 'package:todos/api_test_app/resources/constants.dart';

class PostProvider extends ChangeNotifier{
  // change class name to PostProvider
  // fetch data from api
  // TODO: Move api function to another file

  List<UserInformation> _items=[];
  bool _loading=false;
  PostRepository postRepository=PostRepository();

  bool get loading=>_loading;
  List<UserInformation> get items=>_items;

  void setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  Future<void> fetchDataFromAPI() async {
    try{
      setLoading(true);
      _items = await postRepository.fetchPosts();
      notifyListeners();
    }catch(e){
    debugPrint('$e');
    }
    finally{
      setLoading(false);
    }
  }

  Future<String?> deleteDataFromAPI(int postId) async {
    try {
      final response = await postRepository.deleteDataFromAPI(postId);
      _items.removeWhere((element) => element.id == postId);
      notifyListeners();
      return response;
    } catch (e) {
      throw Exception(AppConstants.deleteFailApi+e.toString());
    }
  }

  Future<void> updateData(UserInformation data, int id, String name) async {
    try{
      await postRepository.updateDataToAPI(id,name);
      data.name=name;
      notifyListeners();
    }catch(e){
      debugPrint('$e');
    }

  }

  }


