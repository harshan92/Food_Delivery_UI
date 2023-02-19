import 'package:flutter/material.dart';
import 'package:food_delevery_app/models/restaurant.dart';
import 'package:food_delevery_app/screens/restaurant_screen.dart';
import '../data/data.dart';
import '../widgets/rating_stars.dart';
import '../widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant))),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      RatingStars(restaurant.rating),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                            fontSize: 11.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "0.2 mile away",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
              )
            ],
          ),
        ),
      ));
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 30.0,
            onPressed: () {},
          ),
          title: Center(child: Text("Food delivery")),
          actions: <Widget>[
            Stack(children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                ),
              ),
              Positioned(
                top: 4,
                right: 6,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange,
                  ),
                  child: Center(
                      child: Text(
                    "${currentUser.cart.length}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ])
          ]),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8)),
                hintText: "Search Food or Restaurants",
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                )),
          ),
        ),
        RecentOrders(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Near Restaurants',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
            ),
            _buildRestaurants()
          ],
        )
      ]),
    );
  }
}
