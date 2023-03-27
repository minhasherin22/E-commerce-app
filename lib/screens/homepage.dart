import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fullapp/screens/detailscreen.dart';
import 'package:fullapp/screens/listproduct.dart';
import 'package:fullapp/screens/profileScreen.dart';
import '../widgets/notificationButton.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int imageIndex = 0;
bool HomeColor = false;
bool CartColor = false;
bool AboutColor = false;
bool ContactUsColor = false;
bool LogoutColor = false;

class _HomePageState extends State<HomePage> {
  List image = [
    const Image(image: AssetImage('assets/images__1_-removebg-preview.png')),
    const Image(image: AssetImage('assets/womanwatch-removebg-preview.png')),
    const Image(image: AssetImage('assets/pants-removebg-preview.png')),
    const Image(image: AssetImage('assets/menswatch-removebg-preview.png')),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer:  _buildMyDrawer(),
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          const NotificationButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 120,
          width: double.infinity,
          // color: Colors.amber,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   _buildImageSlider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32,right: 260),
                    child: const Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildCategory(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Featured',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => ListProduct()));
                          }),
                          child: const Text(
                            'View More',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  _buildFeatured(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'New Achieves',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                 _buildArchieve(),
                ],
              ),
            ],
          ),
        ),
      ),
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
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffB7CEEC)),
              ),
            ),
            Text(
              name,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProduct({required String image, required int color}) {
    return CircleAvatar(
        maxRadius: 37,
        backgroundColor: Color(color),
        child: Image(
          image: AssetImage(image),
          color: Colors.white,
        ));
  }

  Widget _buildMyDrawer(){
   return  Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Minha Sherin',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('minhasherin@gmail.com',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/minha'),
              ),
              decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            ),
            ListTile(
              selected: HomeColor,
              onTap: () {
                setState(() {
                  HomeColor = true;
                  ContactUsColor = false;
                  CartColor = false;
                  AboutColor = false;
                  LogoutColor = false;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                });
              },
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              selected: CartColor,
              onTap: () {
                setState(() {
                  CartColor = true;
                  ContactUsColor = false;
                  HomeColor = false;
                  AboutColor = false;
                  LogoutColor = false;
                  
                });
              },
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
            ),
            ListTile(
              selected: AboutColor,
              onTap: () {
                setState(() {
                  AboutColor = true;
                  ContactUsColor = false;
                  HomeColor = false;
                  CartColor = false;
                  LogoutColor = false;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                });
              },
              leading: const Icon(Icons.info),
              title: const Text('About'),
            ),
            ListTile(
              selected: ContactUsColor,
              onTap: () {
                setState(() {
                  ContactUsColor = true;
                  AboutColor = false;
                  HomeColor = false;
                  CartColor = false;
                  LogoutColor = false;
                });
              },
              leading: const Icon(Icons.phone),
              title: const Text('Contact Us'),
            ),
            ListTile(
              selected: LogoutColor,
              onTap: () {
                setState(() {
                  LogoutColor = true;
                  AboutColor = false;
                  HomeColor = false;
                  CartColor = false;
                  ContactUsColor = false;
                });
              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
            ),
          ],
        ),
      );
  }

  Widget _buildImageSlider(){
    return CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder: (context, index, realIndex) => Container(
                      child: image[index],
                      // color: Colors.red,
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      height: 200,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      onPageChanged: (index, reason) {
                        setState(() {
                          imageIndex = index;
                        });
                      },
                    ),
                  );
  }

  Widget _buildCategory(){
    return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                         
                          _buildCategoryProduct(
                              image: "assets/download-removebg-preview.png",
                              color: 0xff33dcfd),
                          _buildCategoryProduct(
                              image: "assets/shirt-removebg-preview.png",
                              color: 0xfff38cdd),
                          _buildCategoryProduct(
                              image: "assets/shoe-removebg-preview.png",
                              color: 0xff4ff2af),
                          _buildCategoryProduct(
                              image: "assets/pant-removebg-preview.png",
                              color: 0xff74acf7),
                          _buildCategoryProduct(
                              image: "assets/tie-removebg-preview.png",
                              color: 0xfffc6c8d),
                        ],
                      ),
                    ),
                  );
  }

  Widget _buildFeatured(){
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailScreen(
                                  name: 'Men Shirt',
                                  price: 499.0,
                                  image:
                                      'assets/images__1_-removebg-preview.png'
                                )));
                              },
                              child: _buildFeaturedProduct(
                                  name: 'Men Shirt',
                                  price: 499.0,
                                  image:
                                      'assets/images__1_-removebg-preview.png'),
                            ),
                            GestureDetector(
                              onTap: (() {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailScreen(
                                name: 'Woman Watch',
                                  price: 1500.0,
                                  image: 'assets/womanwatch-removebg-preview.png'
                                )));
                              }),
                              child: _buildFeaturedProduct(
                                  name: 'Woman Watch',
                                  price: 1500.0,
                                  image: 'assets/womanwatch-removebg-preview.png'),
                            )
                          ],
                        ),
                      )
                    ],
                  );
  }

  Widget _buildArchieve(){
    return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailScreen(
                                     name: 'Pants',
                                    price: 499.0,
                                    image: 'assets/pants-removebg-preview.png'
                                    )));
                                }),
                                child: _buildFeaturedProduct(
                                    name: 'Pants',
                                    price: 499.0,
                                    image: 'assets/pants-removebg-preview.png'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailScreen(
                                    name: 'Woman Watch',
                                  price: 1500.0,
                                  image: 'assets/menswatch-removebg-preview.png'
                                    )));
                                },
                                child: _buildFeaturedProduct(
                                  name: 'Woman Watch',
                                  price: 1500.0,
                                  image: 'assets/menswatch-removebg-preview.png',
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
  }
}
