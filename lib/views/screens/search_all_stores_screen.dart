import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/search_all_store_controller.dart';
import 'package:user_app/views/widgets/search_card_widget.dart';

class SearchFromAllStore extends StatelessWidget {
  const SearchFromAllStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<SearchAllStoreController>(
            id: "searchFromStore",
            builder: (controller) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    return SearchCardWiget(
                      index: index,
                    );
                  }),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: controller.searchModel.length);
            }));
  }
}
