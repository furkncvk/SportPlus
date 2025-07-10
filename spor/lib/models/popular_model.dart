/*Bu kod, popüler diyetlerin modellerini tanımlayan bir sınıf içerir. `PopularDietsModel` 
sınıfı, diyetin adı, ikonunun dosya yolu, zorluk seviyesi, süresi, kalorisi ve 
kutunun seçili olup olmadığını belirten bir özellik içerir. Ayrıca,
`getPopularDiets` adlı bir yöntem içerir, bu yöntem, önceden tanımlanmış 
popüler diyetler listesini döndürür. Bu örnekte, statik olarak tanımlanmış 
iki farklı popüler diyet örneği bulunmaktadır: Yabanmersinli Pancake ve 
Salmon Nigiri. Her bir diyet, adını, ikonunun dosya yolunu, zorluk seviyesini,
süresini, kalorisini ve kutunun seçili olup olmadığını içeren bir `PopularDietsModel`
örneği olarak oluşturulur ve listeye eklenir. Bu kod, uygulamamda popüler diyetlerin 
listelendiği veya gösterildiği bir yerde kullanılır.*/

class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected
  });

  static List < PopularDietsModel > getPopularDiets() {
    List < PopularDietsModel > popularDiets = [];

    popularDiets.add(
      PopularDietsModel(
       name: 'Yabanmersinli Pancake',
       iconPath: 'assets/icons/blueberry-pancake.svg',
       level: 'Orta',
       duration: '30 dk.',
       calorie: '230 kCal',
       boxIsSelected: true,
      )
    );

    popularDiets.add(
      PopularDietsModel(
       name: 'Salmon Nigiri',
       iconPath: 'assets/icons/salmon-nigiri.svg',
       level: 'Kolay',
       duration: '20 dk.',
       calorie: '120 kCal',
       boxIsSelected: false,
      )
    );

    return popularDiets;
  }
}