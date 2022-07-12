import 'package:flutter/material.dart';

class BeforeScrollingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        // width: size.width,
        // height: size.height - 100,
        top: 180,
        left: 30,
        right: 30,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Vietnamese Restaurant',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Breakfast and Brunch • Vietnamese • \$\$',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(IconData(0xee2d, fontFamily: 'MaterialIcons')),
                    Text(
                      '  30 - 40 MIN ',
                      //style: TextStyle(fontFamily: ),
                    ),
                    Text(
                      '  4.6',
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow[700],
                    ),
                    Text(
                      '(500+)',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            width: 500,
            height: 130,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 2),
              ],
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
          ),
        ));
  }
}
