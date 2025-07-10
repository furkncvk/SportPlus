import 'package:flutter/material.dart';

/* Bu kod,kategori modellerini tanımlayan 
bir sınıf içerir. `CategoryModel` sınıfı, kategori adı, ikonunun dosya yolu ve kutunun 
arka plan rengini içeren özelliklere sahiptir. Ayrıca, `getCategories` adlı bir yöntem içerir, 
bu yöntem, önceden tanımlanmış kategoriler listesini döndürür. Bu örnek, statik olarak 
tanımlanmış dört farklı kategori örneğini içerir: Salata, Pasta, Turta ve Smoothies. 
Her bir kategori, adını, ikonunun dosya yolunu ve kutunun arka plan rengini içeren 
bir `CategoryModel` örneği olarak oluşturulur ve listeye eklenir. Bu kod, uygulamamda 
kategorilerin listelendiği veya gösterildiği bir yerde kullanılabilir.
*/

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
        name: 'Salata',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff9DCEFF)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Pasta',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffEEA4CE)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Turta',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff9DCEFF)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color(0xffEEA4CE)
      )
    );
    

    return categories;
  }
}