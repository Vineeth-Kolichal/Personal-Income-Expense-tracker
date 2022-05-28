import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/models/category/category_model.dart';


const CATEGORY_DB_NAME='category_database';

abstract class CategoryDbFuctions{
  Future<List<CategoryModel>> listCategory();
  Future<void> insertCategory(CategoryModel value);
}
class categoryDB implements CategoryDbFuctions{
  @override
  Future<void> insertCategory(CategoryModel value) async{
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.add(value);
  
  }

  @override
  Future<List<CategoryModel>> listCategory() async{
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  
  }
  
}