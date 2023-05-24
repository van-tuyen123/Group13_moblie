import 'dart:convert';
import 'package:login/models/cocktail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class CocktailController extends GetxController {
  List<CocktailModel> cocktails = [];
  var isLoading = false.obs;

  Future<List<CocktailModel>> getCocktails() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"));
    isLoading.value = false;
    var json = jsonDecode(response.body);
    cocktails.add(CocktailModel.fromJson(json));
    update();
    return cocktails;
  }

  @override
  void onInit() {
    getCocktails();
    super.onInit();
  }
}