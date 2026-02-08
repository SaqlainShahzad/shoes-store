import 'package:animate_do/animate_do.dart';
import 'package:shoes_store/shoes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["All", "Sneakers", "Football", "Soccer", "Golf"];
  List<String> images = [
    'assets/images/six.jpg',
    'assets/images/five.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/one.jpg',
    'assets/images/two.jpg',
  ];
  List<bool> liked = [];

  int selectedIndex = 0;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    liked = List.generate(6, (_) => false); // 6 items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: null,
        title: Text(
          "Shoes Store",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        // brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),

                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Shoes(image: i, tag: i, name: "Sneakers"),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(i, fit: BoxFit.cover),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 16,
                                bottom: 40,
                                child: Text(
                                  "Big Sale",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 16,
                                bottom: 16,
                                child: Text(
                                  "Up to 50% off",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  bool isActive = _currentIndex == entry.key;

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: isActive ? 18 : 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isActive ? Colors.blue : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1000 + (index * 100)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  fontSize: index == 0 ? 16 : 14,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: makeItem(
                        index: 0,
                        image: 'assets/images/six.jpg',
                        tag: 'Flat',
                        name: 'Footwear',
                        context: context,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: makeItem(
                        index: 5,
                        image: 'assets/images/five.jpg',
                        tag: 'Ndure',
                        name: 'Loafers',
                        context: context,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1700),
                      child: makeItem(
                        index: 2,
                        image: 'assets/images/four.jpg',
                        tag: 'Vans',
                        name: 'Sneakers',
                        context: context,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: makeItem(
                        index: 3,
                        image: 'assets/images/one.jpg',
                        tag: 'Nike',
                        name: 'Sneakers',
                        context: context,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: makeItem(
                        index: 4,
                        image: 'assets/images/two.jpg',
                        tag: 'Nike',
                        name: 'Sneakers',
                        context: context,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1500),
                      child: makeItem(
                        index: 1,
                        image: 'assets/images/three.jpg',
                        tag: 'puma',
                        name: 'Sneakers',
                        context: context,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({required int index, image, tag, name, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Shoes(image: image, tag: tag, name: name),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 126),
                            Container(
                              height: 26,
                              width: 44,
                              color: Colors.black.withOpacity(0.5),
                              child: Center(
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "100\$",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            liked[index] = !liked[index]; // toggle
                          });
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              liked[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 20,
                              color: liked[index] ? Colors.red : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
