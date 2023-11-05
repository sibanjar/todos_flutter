import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/utilities/Utils.dart';
import 'package:todos/api_test_app/data/data_fetcher.dart';
import 'package:todos/api_test_app/provider/post_provider.dart';
import 'package:todos/api_test_app/resources/constants.dart';
import 'edit_page_jsonTest.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  // String? deleteSuccess;

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
                                Text('${item.id}' ?? ''),
                                Text(item.name ?? ''),
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
  void deleteItem(PostProvider postProvider, int? itemId) {
    postProvider.deleteDataFromAPI(itemId!).then((value) => {
      Utils.showSnackBar(context, AppConstants.deleteSuccess(itemId))
    }).catchError((e) => {
    debugPrint(AppConstants.deleteFail+e.toString())
    }
    );
  }

  void editItem(PostProvider postProvider, UserInformation item) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EditUser(data: item))
    );
  }
}
