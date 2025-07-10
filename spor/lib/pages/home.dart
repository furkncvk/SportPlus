import 'package:spor/models/category_model.dart';
import 'package:spor/models/diet_model.dart';
import 'package:spor/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          _dietSection(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Popüler',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          popularDiets[index].iconPath,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie,
                              style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected ?
                       Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[index].boxIsSelected ? [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ] : []
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  /*Kodun buraya kadar olan kısmında, kod, ana sayfayı oluşturan bir `HomePage` widget'ı içerir. 
  Bu widget, kategori, diyet ve popüler diyet verilerini kullanarak bir ana sayfa görünümü 
  oluşturur. Sayfa, üst kısımda bir arama alanı, ardından kategorileri, diyetleri ve popüler diyetleri 
  listeler.

`HomePage` sınıfı, `categories`, `diets` ve `popularDiets` adında üç liste içerir. `build` metodu,
`_getInitialInfo` yöntemini çağırarak kategori, diyet ve popüler diyet verilerini alır ve ardından 
Scaffold içinde bir ListView döndürür. ListView'in içinde, arama alanı ve kategoriler bölümü için
`_categoriesSection` metodu, diyet bölümü için `_dietSection` metodu ve popüler diyetler bölümü 
için bir Column yer alır.

Popüler diyetler bölümü, ListView.separated içinde popüler diyetleri listeleyen bir liste oluşturur. 
Her bir popüler diyet öğesi, bir SvgPicture (SVG ikon) ile başlar, ardından diyet adı, zorluk seviyesi,
süre ve kalori bilgilerini içeren bir metin bölümü ve bir buton içerir. Listede her bir öğe için bir 
Container kullanılır ve seçili olduğunda (boxIsSelected true ise) arka plan rengi değişir ve gölge efekti eklenir.

Bu kod, uygulamamda ana sayfa oluşturmak için temel bir yapı sağlar. */


  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:20),
              child: Text(
                'Diyet için\nönerilen',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 240,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diets[index].iconPath),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                              style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          child: Center(
                            child: Text(
                              'İncele',
                              style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                                diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                              ]
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                left: 20,
                right: 20
              ),
              ),
            )
          ],
        );
  }

  /*Buraya kadar olan kod, bir `Column` widget'ı döndüren `_dietSection` adlı bir metod içerir. 
  Bu metod, diyetler bölümünü oluşturur ve bu bölümde diyet önerilerini listeleyen 
  bir yatay ListView bulunur.

Metod, bir `Column` içinde başlar. Bu `Column`'un çapraz eksende (cross axis) sola hizalanmış 
olduğuna dikkat edin. İçinde, bir metin (Text) widget'ı ile başlayan bir `Padding` yer alır. 
Metin, "Diyet için önerilen" ifadesini içerir.

Ardından, bir `SizedBox` ile boşluk bırakılır. Bu boşluktan sonra, diyet önerilerini listeleyen 
bir `Container` gelir. Bu `Container`, yüksekliği 240 birim olan bir yatay ListView içerir. 
ListView, `itemBuilder` ile tanımlanmış bir şekilde her bir diyet önerisi için bir `Container` oluşturur.

Her bir diyet önerisi `Container`'ı, belirli bir genişlik ve yüksekliğe sahip olup, 
`boxDecoration` ile arka plan rengini ve köşe yuvarlaklığını ayarlar. İçerisinde, önce bir 
`SvgPicture` (SVG ikon) ve ardından diyet adı, zorluk seviyesi, süre ve kalori bilgilerini 
içeren bir metin (`Text`) bölümü, ve son olarak "İncele" butonunu içeren bir `Container` yer 
alır. Bu butonun rengi, `viewIsSelected` özelliğine göre dinamik olarak değişir.

Bu kodu, uygulamamda diyet önerilerini listeleyen bir bölüm oluşturmak için kullandım. */

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:20),
              child: Text(
                'Kategori',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Ara, "Pancake"',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  /*Buraya kadar olan kod, kategori ve arama alanını oluşturan iki ayrı metodu içerir.

 `_categoriesSection` metodu: Bu metod, kategori bölümünü oluşturur. Bir `Column` widget'ı 
döndürür ve içinde `Padding` ile başlayarak "Kategori" başlığını içeren bir metin (`Text`) widget'ı yer alır. 
Ardından bir boşluk bırakılır (`SizedBox`), ve bu boşluktan sonra bir yatay `ListView.separated` gelir. 
Bu ListView, kategori öğelerini yatay olarak listeleyen bir liste oluşturur. Her bir kategori öğesi, 
bir `Container` içinde, belirli bir genişlik ve yükseklikte olup, `boxDecoration` ile arka plan rengini 
ve köşe yuvarlaklığını ayarlar. İçerisinde, önce bir `SvgPicture` (SVG ikon) ve ardından kategori adını 
içeren bir metin (`Text`) bölümü yer alır.

 `_searchField` metodu: Bu metod, arama alanını oluşturur. Bir `Container` döndürür ve içinde bir 
`TextField` yer alır. TextField, bir arama kutusu oluşturur ve içine yazılan metni alır. Arama kutusu, 
bir kenarda aramayı tetikleyen bir arama simgesi (`prefixIcon`) ve bir kenarda filtreleme işlemlerini 
açan bir simge (`suffixIcon`) içerir.

Bu kodu, uygulamamda ana sayfasında kategori listesini ve arama alanını oluşturmak için kullandım. */

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Kahvaltı',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ],
    );
  }
}

/* Bu kod, uygulamamın AppBar'ını oluşturan bir metod içerir. AppBar, uygulamanın en üstünde 
yer alan ve genellikle sayfa başlığını, geri dönüş işlemini ve ek işlevleri içeren bir çubuktur. 

Metod, bir `AppBar` widget'ı döndürür ve şu özelliklere sahiptir:

- `title`: AppBar'ın başlık metnini içerir. Bu kodda, başlık metni "Kahvaltı" olarak belirlenmiştir.

- `backgroundColor`: AppBar'ın arka plan rengini belirler. Bu kodda, arka plan rengi beyaz olarak belirlenmiştir.

- `elevation`: AppBar'ın z-eğimi (gölge efekti) miktarını belirler. Bu kodda, eğim sıfır olarak belirlenmiştir, 
   yani gölge efekti yoktur.

- `centerTitle`: Başlığın ortalanıp ortalanmayacağını belirler. Bu kodda, başlık metni ortalanır.

- `leading`: AppBar'ın sol tarafında yer alan öğeyi belirler. Bu kodda, geri dönüş işlemini gerçekleştiren bir 
   ok ikonu (`SvgPicture.asset`) içeren bir `Container` kullanılmıştır.

- `actions`: AppBar'ın sağ tarafında yer alan ek işlevleri belirler. Bu kodda, üç nokta simgesini 
içeren bir `Container` kullanılmıştır.

Bu kodu, uygulamamda bir AppBar oluşturmak için kullandım. AppBar, genellikle sayfanın 
üst kısmında sabit olarak görüntülenir ve kullanıcıya sayfa hakkında bilgi verir ve belirli işlevlere erişim sağlar. */
