import 'package:flutter/cupertino.dart';
import 'package:zarcony_app_task/modules/home/provider/category/model/CategoryModel.dart';
///-----------------Home


class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.todo}) : super(key: key);
  final CategoryModel todo;
  @override
  Widget build(BuildContext context) {
    return Text(todo.name!);
  }
}



