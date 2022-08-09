import 'package:designanddio/service/api_service.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  "All Categories",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4, right: 10),
                child: Text(
                  "View All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          _categoriesList(),
        ],
      ),
    );
  }

  Widget _categoriesList() {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<List<Category>> model) {
        if (model.hasData) {
          return _buildCategoryListTile(model.data as List<Category>);
        } else {
          return Container();
        }
      },
      future: apiService.getCategories(),
    );
  }

  Widget _buildCategoryListTile(List<Category> categories) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var data = categories[index];
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 15),
                  ],
                ),
                child: Image.network(
                  data.image!.url as String ,
                ),
              ),
              Row(
                children: [
                  Text(
                    data.categoryName.toString(),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 14,
                  ),
                ],
              )
            ],
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
