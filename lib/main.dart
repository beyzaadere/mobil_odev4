// Flutter ana paketini import ediyoruz.
// Bu paket, uygulamanın temel yapı taşlarını sağlar.
import 'package:flutter/material.dart';

void main() {
  // Uygulamanın giriş noktası olan ana fonksiyon.
  runApp(MyApp());
}

// Ana uygulama widget'ı olan MyApp sınıfı.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ürün Uygulaması', // Uygulamanın adı.
      theme: ThemeData(
        primarySwatch: Colors.teal, // Tema rengi.
      ),
      home: ProductPage(), // Ana sayfa olarak ProductPage widget'ı atanır.
    );
  }
}

// Ana sayfa widget'ı olan ProductPage sınıfı.
// StatefulWidget, sayfa üzerinde değişiklik yapılmasına olanak sağlar.
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

// ProductPage widget'ının durumunu yöneten sınıf.
class _ProductPageState extends State<ProductPage> {
  // Ürün listesi oluşturuluyor.
  // Her ürünün adı ve fiyatı ile tanımlanıyor.
  final List<Product> products = [
    Product(name: 'Akıllı Telefon', price: 15000),
    Product(name: 'Tablet', price: 8000),
    Product(name: 'Dizüstü Bilgisayar', price: 20000),
    Product(name: 'Akıllı Saat', price: 3000),
    Product(name: 'Kulaklık', price: 1500),
  ];

  // Seçili ürünün indeksini tutar. Varsayılan olarak 0.
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Uygulaması'), // Uygulama üst kısmındaki başlık.
      ),
      body: Column(
        children: [
          // Ürünlerin yatay bir listede gösterilmesi için Container kullanıyoruz.
          Container(
            height: 100, // Yatay liste için sabit yükseklik.
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Yatay kaydırma.
              itemCount: products.length, // Listede kaç ürün olacağı.
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Ürün seçildiğinde selectedIndex güncelleniyor.
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(8), // Kenar boşlukları.
                    padding: EdgeInsets.all(8), // İçerik boşlukları.
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.red // Seçili ürün kırmızı çerçeveye sahip olur.
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8), // Yuvarlak kenarlar.
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products[index].name, // Ürün adı gösteriliyor.
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // GridView ile ürünlerin ızgarada gösterilmesi.
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 sütunlu bir ızgara.
                crossAxisSpacing: 8, // Sütunlar arası boşluk.
                mainAxisSpacing: 8, // Satırlar arası boşluk.
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Izgaradaki bir ürün seçildiğinde selectedIndex güncellenir.
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.amberAccent // Seçili ürün vurgulanır.
                          : Colors.purple[100], // Diğer ürünlerin rengi.
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products[index].name, // Ürün adı.
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          '${products[index].price}₺', // Ürün fiyatı.
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Ürün sınıfı; her ürünün adını ve fiyatını saklar.
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}
