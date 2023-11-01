import 'package:flutter/cupertino.dart';

import '../data/data_fetcher.dart';
import '../data/post_repository.dart';
import '../resources/constants.dart';

class PostProvider extends ChangeNotifier{
  // change class name to PostProvider
  // fetch data from api
  // TODO: Move api function to another file

  List<DataFetcher> _items=[];
  bool _loading=false;
  PostRepository postRepository=PostRepository();

  bool get loading=>_loading;
  List<DataFetcher> get items=>_items;

  void setLoading(bool value){
    _loading=value;
  }
  Future<void> fetchDataFromAPI() async {
    try{
      setLoading(true);
      _items=await postRepository.fetchPosts();
      notifyListeners();
    }catch(e){
      rethrow;
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

  Future<void> updateData(DataFetcher data, int id, String name) async {
    try{
      await postRepository.updateDataToAPI(id,name);
    }catch(e){
      rethrow;
    }
   data.name=name;
    notifyListeners();
  }

  }


