import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fullapp/screens/homepage.dart';

class ListProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context)=>HomePage()
                ));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Featured',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // const Text(
                  //   'View More',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // )
                ],
              ),
            ),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Men Shirt',
                          price: 499.0,
                          image: 'assets/images__1_-removebg-preview.png'),
                      _buildFeaturedProduct(
                          name: 'Woman Watch',
                          price: 1500.0,
                          image: 'assets/womanwatch-removebg-preview.png'),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Mobile Cover',
                          price: 499.0,
                          image: 'assets/mobileCase-removebg-preview.png'),
                      _buildFeaturedProduct(
                          name: 'Kurti Set',
                          price: 1500.0,
                          image: 'assets/kurti-removebg-preview.png'),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Mouse',
                          price: 499.0,
                          image: 'assets/camera.png'),
                      _buildFeaturedProduct(
                          name: 'Woman Watch',
                          price: 1500.0,
                          image: 'assets/mouse.jpeg'),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Earings',
                          price: 499.0,
                          image: 'assets/earings.jpeg'),
                      _buildFeaturedProduct(
                          name: 'Bangles',
                          price: 1500.0,
                          image: 'assets/bangles.jpeg'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildFeaturedProduct(
      {required String name, required double price, required String image}) {
    return Card(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 190,
              width: 160,
              child: Padding(
                padding: const EdgeInsets.only(right: 32, top: 24),
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$price',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB7CEEC)),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
