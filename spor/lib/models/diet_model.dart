import 'package:flutter/material.dart';

/*Bu kod, diyet modellerini tanımlayan bir sınıf içerir. `DietModel` sınıfı, diyetin adı, ikonunun 
dosya yolu, zorluk seviyesi, süresi, kalorisi, kutunun arka plan rengi 
ve görünümünün seçili olup olmadığını belirten bir özellik içerir. 
Ayrıca, `getDiets` adlı bir yöntem içerir, bu yöntem, önceden tanımlanmış 
diyetler listesini döndürür. Bu örnekte, statik olarak tanımlanmış iki 
farklı diyet örneği bulunmaktadır: Ballı Pancake ve Canai Bread. Her bir
 diyet, adını, ikonunun dosya yolunu, zorluk seviyesini, süresini, 
 kalorisini, görünümünün seçili olup olmadığını ve kutunun arka plan 
 rengini içeren bir `DietModel` örneği olarak oluşturulur ve listeye eklenir. 
 Bu kod, uygulamamda diyetlerin listelendiği veya gösterildiği bir yerde kullanılır.
 */

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List < DietModel > getDiets() {
    List < DietModel > diets = [];

    diets.add(
      DietModel(
       name: 'Ballı Pancake',
       iconPath: 'assets/icons/honey-pancakes.svg',
       level: 'Kolay',
       duration: '30 dk.',
       calorie: '180 kCal',
       viewIsSelected: true,
       boxColor: Color(0xff9DCEFF)
      )
    );

    diets.add(
      DietModel(
       name: 'Canai Bread',
       iconPath: 'assets/icons/canai-bread.svg',
       level: 'Kolay',
       duration: '20 dk.',
       calorie: '230 kCal',
       viewIsSelected: false,
       boxColor: Color(0xffEEA4CE)
      )
    );

    return diets;
  }
}