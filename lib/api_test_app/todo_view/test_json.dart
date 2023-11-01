import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/utilities/Utils.dart';

import '../data/data_fetcher.dart';
import '../provider/post_provider.dart';
import '../resources/constants.dart';
import 'edit_page_jsonTest.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  String? deleteSuccess;

  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<PostProvider>(context, listen: false);
    apiProvider.fetchDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Consumer<PostProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if(value.loading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemCount: value.items.length,
              itemBuilder: (context, index) {
                final item = value.items[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey.withOpacity(0.2),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              children: [
                                Text(item.id.toString()),
                                Text(item.name.toString()),
                              ]
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            editItem(value, item);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                          deleteItem(value, item.id);
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10,); },
            );
          },
        ),
      ),
    );
  }
  void deleteItem(PostProvider postProvider, int? itemId) async {
    try {
    deleteSuccess=  await postProvider.deleteDataFromAPI(itemId!);
    } catch (e) {
      print(AppConstants.deleteFail+e.toString());
    }
    Utils.showSnackBar(context, AppConstants.deleteFailApi);
  }

  void editItem(PostProvider postProvider, DataFetcher item) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EditUser(data: item))
    );
  }
}
