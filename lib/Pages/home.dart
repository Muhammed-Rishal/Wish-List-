import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/Pages/whishList.dart';
import 'package:wishlist/Provider/taskProvider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fruits',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 5,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Consumer<TaskProvider>(
          builder: (context, value, child) {
            final fruits = value.fruits; // Assuming your TaskProvider has a 'tasks' list
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(value.fruitImageUrls[index]),
                          radius: 30, // Optional: specify size
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(fruits[index],style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.w500,),),
                        ),
                        IconButton(
                          onPressed: () {
                            value.toggleWishlist(index);
                          },

                icon: Icon(
                value.isInWishlist(index)
                ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: value.isInWishlist(index)
                ? Colors.red
                    : Colors.grey,)),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WishlistScreen()),
          );
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
