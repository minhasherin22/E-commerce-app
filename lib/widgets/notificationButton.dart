import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
     position: BadgePosition.topEnd(top: 2, end: 5),
      badgeContent: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      child: IconButton(
        onPressed: () {
         

        },
       icon: Icon(Icons.notifications_none,color: Colors.black,)),
    );
  }
}
