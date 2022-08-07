import 'package:card_swiper/card_swiper.dart';
import 'package:example2/interface/my_slider.dart';
import 'package:example2/screen/about_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MySlider> banners = [
    MySlider(
      id: 1,
      title: "pdpa",
      image:
          "https://www.cmru.ac.th/assets/images/banners/th/10-05-2022/0cbb9fcbf628d81dfcd99d467cec92359cae3da4.png",
    ),
    MySlider(
      id: 2,
      title: "covid 19",
      image:
          "https://www.cmru.ac.th/assets/images/banners/th/02-05-2022/5b13d8b42e412d8c1c13d442701242d4a0cddbfb.png",
      link: "https://facebook.com",
    ),
    MySlider(
      id: 3,
      title: "วันแม่",
      image:
          "https://www.cmru.ac.th/assets/images/banners/th/03-08-2022/2e4d94c11d47ae8dfa8c31ddc0bdf652801cff56.png",
      link: "https://pantip.com",
    ),
  ];

  String name = "Bundit nuntates";
  int age = 35;
  bool lookingGood = true;

  List<String> myDognames = ["Prayut", "Praveena", "Mike", "Pravit"];

  Map<String, dynamic> user = {
    "id": 1,
    "name": "John Doe",
    "sex": "male",
    "married": false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.red,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.network(
                    banners[index].image,
                    fit: BoxFit.cover,
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: banners.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
            Text("สวัสดีฉันชื่อ $name"),
            Text("ฉันมีอายุ $age"),
            Text(
                "ฉันหล่อมากนั้นเป็นเรื่อง ${lookingGood ? "จริง" : "ไม่จริง"}"),
            Text(
                "หมาฉันชื่อ:  ${myDognames[0]}, ${myDognames[1]}, ${myDognames[2]}, และ ${myDognames[3]}"),
            //...myDognames.map((item) => Text(item)).toList(),
            Text("เพื่อนของฉันชื่อ : ${user["name"]}"),
            Text(
                "แล้วเขาก็ : ${user["married"] ? "แต่งงานแล้ว" : "ยังไม่ได้แต่งงาน"}"),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutScreen();
                    },
                  ),
                )
              },
              child: Text("Go to about screen"),
            ),
          ],
        ),
      ),
    );
  }
}
