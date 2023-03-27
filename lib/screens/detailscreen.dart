import 'package:flutter/material.dart';
import 'package:fullapp/screens/cartscreen.dart';

import 'package:fullapp/screens/homepage.dart';
import 'package:fullapp/widgets/notificationButton.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  const DetailScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          const NotificationButton()
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            Center(
              child: SizedBox(
                width: 350,
                // color: Colors.red,
                child: _buildImage(),
              ),
            ),
            Container(
              // color: Colors.red,5869
              // height: 80,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.price.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff9b96d6)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // margin: EdgeInsets.all(15),Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
                    height: 200,
                    // color: Colors.red,
                    child: Wrap(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    'Size',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildSizeProduct(name: 'S'),
                      _buildSizeProduct(name: 'M'),
                      _buildSizeProduct(name: 'L'),
                      _buildSizeProduct(name: 'XLL'),
                    ],
                  ),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildColorProduct(color: const Color(0xff56A5E6)),
                      _buildColorProduct(color: const Color(0xffE3E4FA)),
                      _buildColorProduct(color: const Color(0XFF3EB489)),
                      _buildColorProduct(color: Colors.black),
                    ],
                  ),
                  const Text(
                    'Quantity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildQuantity(),
                  _buildCheck(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildSizeProduct({required String name}) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 60,
      width: 60,
      color: Color(0xfff2f2f2),
      child: Center(
          child: Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget _buildColorProduct({required Color color}) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 60,
      width: 60,
      color: color,
    );
  }

  Widget _buildImage() {
    return Card(
      child: Container(
        height: 220,
        decoration: BoxDecoration(

            // color: Colors.red,
            image: DecorationImage(
                // fit: BoxFit.fill,
                image: AssetImage(widget.image))),
      ),
    );
  }

  Widget _buildQuantity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 50), backgroundColor: Colors.black),
          onPressed: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Icon(Icons.remove),
                onTap: (() {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                }),
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                child: Icon(Icons.add),
                onTap: (() {
                  setState(() {
                    count++;
                  });
                }),
              ),
            ],
          )),
    );
  }

  Widget _buildCheck() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(350, 55),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: (() {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CartScreen(
            image: widget.image,
            name: widget.name,
            price: widget.price,
          )));
        }),
        child: Text('Check Out'));
  }
}
