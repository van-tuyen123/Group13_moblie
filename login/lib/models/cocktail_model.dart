// To parse this JSON data, do
//
//     final cocktailModel = cocktailModelFromJson(jsonString);

import 'dart:convert';

CocktailModel cocktailModelFromJson(String str) =>
    CocktailModel.fromJson(json.decode(str));

String cocktailModelToJson(CocktailModel data) => json.encode(data.toJson());

class CocktailModel {
  CocktailModel({
    required this.drinks,
  });

  List<Drink> drinks;

  factory CocktailModel.fromJson(Map<String, dynamic> json) => CocktailModel(
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Drink {
  Drink({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  String strDrink;
  String strDrinkThumb;
  String idDrink;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    strDrink: json["strDrink"],
    strDrinkThumb: json["strDrinkThumb"],
    idDrink: json["idDrink"],
  );

  Map<String, dynamic> toJson() => {
    "strDrink": strDrink,
    "strDrinkThumb": strDrinkThumb,
    "idDrink": idDrink,
  };
}
