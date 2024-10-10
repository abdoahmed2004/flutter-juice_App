import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartclass.dart';
import 'cart.dart';
class Salad extends StatefulWidget {
  const Salad({super.key});

  @override
  State<Salad> createState() => _SaladState();
}

class _SaladState extends State<Salad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salad Page", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
        backgroundColor: Color(0xff6b7c38),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Fresh fruit salad !",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/splash.jpg', // Replace with your image path
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'splash Fruit Salad',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'A mix of fresh fruits including strawberries, blueberries, and kiwi.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$12',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false).addItem(
                                CartItem(name: 'splash Fruit Salad', price: 12.0),
                              );
                            },
                            child: Text('Add to Cart'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/berry.jpg', // Replace with your image path
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'berry Fruit Salad',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'A mix of fresh fruits including strawberries, blueberries, and kiwi.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$10',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          ElevatedButton(
                           onPressed: () {
                              Provider.of<CartModel>(context, listen: false).addItem(
                                CartItem(name: 'beryy Fruit Salad', price: 10.0),
                              );
                            },
                            child: Text('Add to Cart'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
