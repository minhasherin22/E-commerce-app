import 'package:flutter/material.dart';
import 'package:fullapp/widgets/notificationButton.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                onPressed: (() {
                  setState(() {
                    edit = false;
                  });
                }),
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ))
            : Container(),
       
        backgroundColor: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          edit == false
              ? NotificationButton()
              : IconButton(
                  onPressed: (() {}),
                  icon: Icon(
                    Icons.check,
                    color: Colors.black,
                  ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 210,
                width: double.infinity,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const CircleAvatar(
                      maxRadius: 42,
                      backgroundImage: AssetImage('assets/minha'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220, top: 170),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                child: edit == true
                    ? Column(
                        children: [
                          _singleTextForm(name: '   Minha sherin'),
                          _singleTextForm(name: '   minhasherin890@gmail.com'),
                          _singleTextForm(name: '   1234567890'),
                          _singleTextForm(name: '   Female'),
                        ],
                      )
                    : Container(
                        child: Column(
                          children: [
                            _buildSingleContainer(
                                firstText: ' Name', secondText: 'Minha Sherin'),
                            _buildSingleContainer(
                                firstText: ' Email',
                                secondText: 'minhasherin890@gmail.com'),
                            _buildSingleContainer(
                                firstText: 'Phone Number',
                                secondText: '1234567890'),
                            _buildSingleContainer(
                                firstText: 'Gender', secondText: 'Female'),
                          ],
                        ),
                      )),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 46),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: (() {
                  setState(() {
                    edit = true;
                  });
                }),
                child: Text('Edit Profile')),
          )
        ],
      ),
    );
  }

  Widget _buildSingleContainer(
      {required String firstText, required String secondText}) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 46,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              firstText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              secondText,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _singleTextForm({required String name}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: name,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
