import 'package:flutter/material.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'package:orangeneedles/Components/colours.dart';
import 'ProductPage.dart';
import 'package:orangeneedles/Components/product.dart';
import 'package:orangeneedles/Components/partials.dart';
import 'uploadscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Dashboard extends StatefulWidget {
  final String pageTitle;
  static const String id = 'Dashboard';

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinuser;
  int _selectedIndex = 0;

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser();
      if(user != null) {
        loggedinuser = user;
      }
    }catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      uploadScreen(),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Icons.filter_list),
          ),
          backgroundColor: primaryColor,
          title: Text('Orange Needle',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Icons.notifications),
            )
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory),
                title: Text(
                  'Store',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  'Search',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                title: Text(
                  'Upload',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text(
                  'My Cart',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: tabLinkStyle,
                )),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.orange,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget storeTab(BuildContext context) {
    // will pick it up from here
    // am to start another template
    List<Product> category1 = [
      Product(
          name: "Kurta",
          image: "images/3.JPG",
          price: 1000,
          userLiked: true,
          discount: 10),
      Product(
          name: "Saree",
          image: "images/5.jpg",
          price: 2000.00,
          userLiked: false,
          discount: 7.8),
      Product(
        name: "Kurta Pajama",
        image: 'images/2.jpg',
        price: 1500,
        userLiked: false,
      ),
      Product(
          name: "Royal Sherwani",
          image: "images/1.jpg",
          price: 2000.00,
          userLiked: false,
          discount: 14)
    ];

    List<Product> category2 = [
      Product(
          name: "Lehenga",
          image: "images/6.jpg",
          price: 3000,
          userLiked: true,
          discount: 2),
      Product(
          name: "Salwar",
          image: "images/7.jpg",
          price: 2800,
          userLiked: false,
          discount: 5.2),
      Product(
          name: " Ghagra",
          image: "images/8.jpg",
          price: 3000,
          userLiked: false),
      Product(
          name: "Sherwani",
          image: "images/9.jpg",
          price: 999,
          userLiked: false,
          discount: 3.4)
    ];

    return ListView(children: <Widget>[
      headerTopCategories(),
      deals('Hot Deals', onViewMore: () {}, items: <Widget>[
        dressSample(category1[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductPage(
                  productData: category1[0],
                );
              },
            ),
          );
        }, onLike: () {}),
        dressSample(category1[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: category1[1],
                );
              },
            ),
          );
        }, imgWidth: 250, onLike: () {}),
        dressSample(category1[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: category1[2],
                );
              },
            ),
          );
        }, imgWidth: 200, onLike: () {}),
        dressSample(category1[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: category1[3],
                );
              },
            ),
          );
        }, onLike: () {}),
      ]),
      deals('Wedding Designs', onViewMore: () {}, items: <Widget>[
        dressSample(category2[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: category2[0],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 60),
        dressSample(category2[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductPage(
                  productData: category2[1],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 75),
        dressSample(category2[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: category2[2],
                );
              },
            ),
          );
        }, imgWidth: 110, onLike: () {}),
        dressSample(category2[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductPage(
                  productData: category2[3],
                );
              },
            ),
          );
        }, onLike: () {}),
      ])
    ]);
  }

  Widget sectionHeader(String headerTitle, {onViewMore}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(headerTitle, style: h4),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 2),
          child: FlatButton(
            onPressed: onViewMore,
            child: Text('View all ›', style: contrastText),
          ),
        )
      ],
    );
  }

// wrap the horizontal listview inside a sizedBox..
  Widget headerTopCategories() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader('All Categories', onViewMore: () {}),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              headerCategoryItem(
                  'Men',
                  Image.asset(
                    'images/1.jpg',
                    height: 70,
                  ),
                  onPressed: () {}),
              headerCategoryItem(
                  'Women',
                  Image.asset(
                    'images/8.jpg',
                    height: 75,
                  ),
                  onPressed: () {}),
              headerCategoryItem(
                  'Kids',
                  Image.asset(
                    'images/9.jpg',
                    height: 75,
                  ),
                  onPressed: () {}),
              headerCategoryItem(
                  'Wedding Specials',
                  Image.asset(
                    'images/5.jpg',
                    height: 55,
                  ),
                  onPressed: () {}),
            ],
          ),
        )
      ],
    );
  }

  Widget headerCategoryItem(String name, Widget image, {onPressed}) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 90,
              height: 90,
              child: FloatingActionButton(
                shape: CircleBorder(),
                heroTag: name,
                onPressed: onPressed,
                backgroundColor: white,
                child: image,
              )),
          Text(name + ' ›', style: categoryText)
        ],
      ),
    );
  }

  Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          sectionHeader(dealTitle, onViewMore: onViewMore),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: (items != null)
                  ? items
                  : <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('No items available at this moment.',
                            style: taglineText),
                      )
                    ],
            ),
          )
        ],
      ),
    );
  }
}
