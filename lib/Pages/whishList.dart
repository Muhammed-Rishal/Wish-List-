import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/Provider/taskProvider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 5,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Consumer<TaskProvider>(
          builder: (context, value, child) {
            final wishlistIndices = value.wishlist;

            if (wishlistIndices.isEmpty) {
              return const Center(
                child: Text(
                  'No fruits in wishlist.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: wishlistIndices.length,
              itemBuilder: (context, i) {
                final index = wishlistIndices[i];
                final fruitName = value.fruits[index];
                final fruitImage = value.fruitImageUrls[index];

                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(fruitImage),
                          radius: 30,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            fruitName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            value.toggleWishlist(index);
                          },
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        backgroundColor: Colors.green,)
      ,
    );
  }
}
