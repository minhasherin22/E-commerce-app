import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fullapp/screens/checkout.dart';
import 'package:fullapp/screens/detailscreen.dart';

class CartScreen extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  CartScreen({required this.image, required this.name, required this.price});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          width: 100,
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xff746bc9)),
              onPressed: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CheckOut(
                        image: widget.image,
                        name: widget.name,
                        price: widget.price)));
              }),
              child: Text('Continue')),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        image: widget.image,
                        name: widget.name,
                        price: widget.price)));
              }),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          centerTitle: true,
          title: const Text(
            'Detail Page',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ))
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(children: [
            Column(
              children: [
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
              ],
            ),
          ]),
        ));
  }

  Widget _buildQuantity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 50),
              backgroundColor: Color(0xfff2f2f2)),
          onPressed: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
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
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
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

  Widget _buildSingleCartProduct() {
    return Card(
      child: Row(
        children: [
          Container(
            height: 130,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(widget.image))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Text('Cover',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text(
                '\$ ${widget.price}',
                style: TextStyle(
                    color: Color(0xff9b96d6),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              _buildQuantity(),
            ],
          )
        ],
      ),
    );
  }
}
