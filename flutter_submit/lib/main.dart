import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_submit/food.dart';
import 'package:grouped_list/grouped_list.dart';
import 'BeforeScrollingWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Vietnamese Restaurant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List listFood = [];
  @override
  Widget build(BuildContext context) {
    List<Food> listFood = [
      Food('Pho Ga', 'Rice noodle with chicken', 23.23, 'Pho'),
      Food('Pho Bo', 'Rice noodle with beef', 10.99, 'Pho'),
      Food('Banh Mi Trung', 'Bread with Omelette', 5.66, 'Banh Mi'),
      Food('Banh Mi Thit', 'Bread with Pork Meat', 12.11, 'Banh Mi'),
      Food('Com Tam', 'Rice with Short Rib and Omelette', 11.11, 'Com'),
      Food('Com Chien Trung', 'Egg Fried Rice', 19.99, 'Com')
    ];
    var seen = Set<String>();
    final listCategory =
        listFood.where((element) => seen.add(element.category)).toList();
    final _controller = ScrollController();

    bool changeWidget = false;

    void listenScrolling() {
      if (_controller.position.pixels > 0) {
        setState(() {
          changeWidget = true;
        });
      } else {
        setState(() {
          changeWidget = false;
        });
      }
    }

    @override
    void initState() {
      _controller.addListener(() => listenScrolling());
      super.initState();
    }

    final size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
            body: CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        //SliverPersistentHeader(delegate: ),
        SliverAppBar(
          snap: true,
          collapsedHeight: 150,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   systemNavigationBarColor: Colors.blue, // Navigation bar
          // ),
          //backwardsCompatibility: false,
          //actionsIconTheme: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
          pinned: true,
          backgroundColor: Colors.white,

          // title: Text(
          //   'Vietnamese Restaurant',
          //   style: TextStyle(fontSize: 24, color: Colors.black),
          // ),

          actions: <Widget>[
            Icon(
              Icons.favorite_border_outlined,
              size: 27,
            )
          ],
          leading: BackButton(),
          centerTitle: true,
          expandedHeight: 200,
          floating: true,
          //pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var top = constraints.biggest.height;
              return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(top: 10),
                  centerTitle: true,
                  //expandedTitleScale: 50,
                  title: AnimatedOpacity(
                      curve: Curves.slowMiddle,
                      duration: Duration(seconds: 2),
                      opacity: 1.0,
                      child: top > 170 && top < 220
                          ? Container(
                              //duration: const Duration(seconds: 2),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 20, bottom: 5),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          BackButton(),
                                          Text(
                                            'Vietnamese Restaurant ',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black),
                                          ),
                                          Icon(
                                            Icons.search_sharp,
                                            size: 24,
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Row(
                                            children: List.generate(
                                                listCategory.length, (index) {
                                          return Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        listCategory[index]
                                                            .category,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      bottom: 8,
                                                      top: 8)),
                                            ),
                                          );
                                        })),
                                      ),
                                    ],
                                  ),
                                  width: 500,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(10),
                              clipBehavior: Clip.none,
                              decoration: BoxDecoration(color: Colors.white),
                              width: 220,
                              height: 100,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Text(
                                    'Vietnamese Restaurant',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Breakfast and Brunch • Vietnamese • \$\$',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        IconData(0xee2d,
                                            fontFamily: 'MaterialIcons'),
                                        color: Colors.black,
                                        size: 14,
                                      ),
                                      Text(
                                        '30 - 40 MIN',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Text(
                                        '4.6',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.yellow[700],
                                      ),
                                      Text(
                                        '(500+)',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                      // Text(
                      //   top > 71 && top < 91 ? "Collapse" : "Expanded",
                      //   style: TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.bold),
                      // )
                      )

                  // Stack(clipBehavior: Clip.none, children: [
                  //   Container(
                  //     padding: EdgeInsets.all(10),
                  //     clipBehavior: Clip.none,
                  //     decoration: BoxDecoration(color: Colors.white),
                  //     width: 220,
                  //     height: 100,
                  //     child: Column(
                  //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.start,

                  //       children: <Widget>[
                  //         Text(
                  //           'Vietnamese Restaurant',
                  //           style: TextStyle(fontSize: 18, color: Colors.black),
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Text(
                  //           'Breakfast and Brunch • Vietnamese • \$\$',
                  //           style: TextStyle(fontSize: 10, color: Colors.black),
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Row(
                  //           children: <Widget>[
                  //             Icon(
                  //               IconData(0xee2d, fontFamily: 'MaterialIcons'),
                  //               color: Colors.black,
                  //               size: 14,
                  //             ),
                  //             Text(
                  //               '30 - 40 MIN',
                  //               style: TextStyle(
                  //                   fontSize: 10, color: Colors.black),
                  //             ),
                  //             SizedBox(
                  //               width: 40,
                  //             ),
                  //             Text(
                  //               '4.6',
                  //               style: TextStyle(
                  //                   fontSize: 10, color: Colors.black),
                  //             ),
                  //             Icon(
                  //               Icons.star,
                  //               size: 10,
                  //               color: Colors.yellow[700],
                  //             ),
                  //             Text(
                  //               '(500+)',
                  //               style:
                  //                   TextStyle(color: Colors.grey, fontSize: 10),
                  //             )
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ])
                  ,
                  background: Image(
                    image: NetworkImage(
                        "https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/v1622728130/The-Best-Food-In-Vietnam-Main/The-Best-Food-In-Vietnam-Main.jpg"),
                    fit: BoxFit.cover,
                  ));
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 50, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Location and hours'),
                  Spacer(),
                  Text(
                    'View info',
                    style: TextStyle(color: Colors.green[800]),
                  ),
                  Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.green[800],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              )),
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: Row(
                children: [
                  Text(
                    'Lunch',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 27,
                  ),
                  Spacer(),
                  Icon(
                    Icons.search_sharp,
                    size: 27,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 17),
              child: GroupedListView<Food, String>(
                shrinkWrap: true,
                elements: listFood,
                groupBy: (element) => element.category,
                groupSeparatorBuilder: (String groupByValue) => Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black12),
                  )),
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    groupByValue,
                    style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                  ),
                ),
                itemBuilder: (context, Food element) => SingleChildScrollView(
                  controller: _controller,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black12),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            element.name,
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            element.description,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            "\$" + element.price.toString(),
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                order: GroupedListOrder.ASC,
              ) as Widget,
            ),
          ]),
        )
      ],
    )));

    //      Container(
    //   child: Column(
    //     children: <Widget>[
    //       //header
    //       Positioned(
    //         width: size.width,
    //         //duration: const Duration(seconds: 2),
    //         child: Center(
    //           child: Container(
    //             padding:
    //                 EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
    //             child: Column(
    //               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               //crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Row(
    //                   children: <Widget>[
    //                     BackButton(),
    //                     Text(
    //                       'Vietnamese Restaurant ',
    //                       style: TextStyle(fontSize: 27),
    //                     ),
    // Icon(
    //   Icons.search_sharp,
    //   size: 27,
    // )
    //                   ],
    //                 ),
    //                 Expanded(
    //                   child: Row(
    //                       children:
    //                           List.generate(listCategory.length, (index) {
    //                     return Padding(
    //                       padding: EdgeInsets.only(right: 20),
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                             color: Colors.black,
    //                             borderRadius: BorderRadius.circular(20)),
    //                         child: Padding(
    //                             child: Row(
    //                               children: <Widget>[
    //                                 Text(
    //                                   listCategory[index].category,
    //                                   style: TextStyle(
    //                                       fontSize: 18,
    //                                       fontWeight: FontWeight.w500,
    //                                       color: Colors.white),
    //                                 )
    //                               ],
    //                             ),
    //                             padding: EdgeInsets.only(
    //                                 left: 15, right: 15, bottom: 8, top: 8)),
    //                       ),
    //                     );
    //                   })),
    //                 ),
    //               ],
    //             ),
    //             width: 500,
    //             height: 130,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //       //list products
    //       Expanded(
    //         child: Container(
    //           padding: EdgeInsets.only(left: 17),
    //           child: GroupedListView<Food, String>(
    //             elements: listFood,
    //             groupBy: (element) => element.category,
    //             groupSeparatorBuilder: (String groupByValue) => Container(
    //               decoration: BoxDecoration(
    //                   border: Border(
    //                 bottom: BorderSide(width: 1.0, color: Colors.black12),
    //               )),
    //               padding: EdgeInsets.only(
    //                 top: 10,
    //                 bottom: 10,
    //               ),
    //               child: Text(
    //                 groupByValue,
    //                 style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
    //               ),
    //             ),
    //             itemBuilder: (context, Food element) => SingleChildScrollView(
    //               controller: _controller,
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                     border: Border(
    //                   bottom: BorderSide(width: 1.0, color: Colors.black12),
    //                 )),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.stretch,
    //                   children: <Widget>[
    //                     SizedBox(
    //                       height: 15,
    //                     ),
    //                     Container(
    //                       child: Text(
    //                         element.name,
    //                         style:
    //                             TextStyle(fontSize: 20, fontFamily: 'Roboto'),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 5,
    //                     ),
    //                     Container(
    //                       child: Text(
    //                         element.description,
    //                         style: TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: 15,
    //                             fontFamily: 'Roboto'),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 5,
    //                     ),
    //                     Container(
    //                       child: Text(
    //                         "\$" + element.price.toString(),
    //                         style: TextStyle(
    //                             color: Colors.black87,
    //                             fontSize: 15,
    //                             fontFamily: 'Roboto'),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 15,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             order: GroupedListOrder.ASC,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // )

    //     Container(
    //   child: Stack(
    //     clipBehavior: Clip.none,
    //     children: <Widget>[
    //       AppBar(
    //         leading: BackButton(onPressed: (() {})),
    //         actions: [
    //           IconButton(
    //               onPressed: () {},
    //               icon: Icon(Icons.favorite_border_outlined))
    //         ],
    //         flexibleSpace: Container(
    //             height: 250,
    //             width: size.width,
    //             child: Text(''),
    //             decoration: new BoxDecoration(
    //                 image: new DecorationImage(
    //                     fit: BoxFit.fill,
    //                     image: NetworkImage(
    //                         "https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/v1622728130/The-Best-Food-In-Vietnam-Main/The-Best-Food-In-Vietnam-Main.jpg")))),
    //       ),
    //       Positioned(
    //         bottom: 0,
    //         child: Container(
    //           padding: EdgeInsets.all(20),
    //           height: MediaQuery.of(context).size.height - 250,
    //           width: size.width,
    //           child: Column(
    //             children: [
    //               Container(
    //                 // decoration: BoxDecoration(
    //                 //     border: Border(
    //                 //   bottom: BorderSide(width: 1.0, color: Colors.black12),
    //                 // )),
    //                 padding: EdgeInsets.only(top: 50, right: 20, left: 20),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     Text('Location and hours'),
    //                     Spacer(),
    //                     Text(
    //                       'View info',
    //                       style: TextStyle(color: Colors.green[800]),
    //                     ),
    //                     Icon(
    //                       Icons.chevron_right_sharp,
    //                       color: Colors.green[800],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                     border: Border(
    //                   top: BorderSide(width: 1.0, color: Colors.black12),
    //                   bottom: BorderSide(width: 1.0, color: Colors.black12),
    //                 )),
    //                 padding: EdgeInsets.only(
    //                     top: 10, bottom: 10, right: 5, left: 5),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    // Text(
    //   'Lunch',
    //   style: TextStyle(fontSize: 17),
    // ),
    // Icon(
    //   Icons.arrow_drop_down,
    //   size: 27,
    // ),
    // Spacer(),
    // Icon(
    //   Icons.search_sharp,
    //   size: 27,
    // )
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                 child: Container(
    //                   child: GroupedListView<Food, String>(
    //                     elements: listFood,
    //                     groupBy: (element) => element.category,
    //                     groupSeparatorBuilder: (String groupByValue) =>
    //                         Container(
    //                       decoration: BoxDecoration(
    //                           border: Border(
    //                         bottom:
    //                             BorderSide(width: 1.0, color: Colors.black12),
    //                       )),
    //                       padding: EdgeInsets.only(
    //                         top: 10,
    //                         bottom: 10,
    //                       ),
    //                       child: Text(
    //                         groupByValue,
    //                         style:
    //                             TextStyle(fontSize: 25, fontFamily: 'Roboto'),
    //                       ),
    //                     ),
    //                     itemBuilder: (context, Food element) =>
    //                         SingleChildScrollView(
    //                       controller: _controller,
    //                       child: Container(
    //                         decoration: BoxDecoration(
    //                             border: Border(
    //                           bottom: BorderSide(
    //                               width: 1.0, color: Colors.black12),
    //                         )),
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.stretch,
    //                           children: <Widget>[
    //                             SizedBox(
    //                               height: 15,
    //                             ),
    //                             Container(
    //                               child: Text(
    //                                 element.name,
    //                                 style: TextStyle(
    //                                     fontSize: 20, fontFamily: 'Roboto'),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             Container(
    //                               child: Text(
    //                                 element.description,
    //                                 style: TextStyle(
    //                                     color: Colors.grey,
    //                                     fontSize: 15,
    //                                     fontFamily: 'Roboto'),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             Container(
    //                               child: Text(
    //                                 "\$" + element.price.toString(),
    //                                 style: TextStyle(
    //                                     color: Colors.black87,
    //                                     fontSize: 15,
    //                                     fontFamily: 'Roboto'),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 15,
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     order: GroupedListOrder.ASC,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           decoration: BoxDecoration(color: Colors.white),
    //         ),
    //       ),

    //       BeforeScrollingWidget()

    //       ///afterAnimatedWidget(size: size, listCategory: listCategory),
    //       // AnimatedSwitcher(
    //       //   duration: const Duration(seconds: 2),
    //       //   child: afterAnimatedWidget(size: size, listCategory: listCategory),
    //       // ),
    //       //afterAnimatedWidget(size: size, listCategory: listCategory)
    //     ],
    //   ),
    // )
    //);
  }
}

class afterAnimatedWidget extends StatelessWidget {
  const afterAnimatedWidget({
    Key? key,
    required this.size,
    required this.listCategory,
  }) : super(key: key);

  final Size size;
  final List<Food> listCategory;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      width: size.width,
      duration: const Duration(seconds: 2),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  BackButton(),
                  Text(
                    'Vietnamese Restaurant ',
                    style: TextStyle(fontSize: 27),
                  ),
                  Icon(
                    Icons.search_sharp,
                    size: 27,
                  )
                ],
              ),
              Expanded(
                child: Row(
                    children: List.generate(listCategory.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                          child: Row(
                            children: <Widget>[
                              Text(
                                listCategory[index].category,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: 15, right: 15, bottom: 8, top: 8)),
                    ),
                  );
                })),
              ),
            ],
          ),
          width: 500,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
