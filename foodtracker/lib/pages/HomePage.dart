import 'package:flutter/material.dart';
import 'package:foodtracker/models/Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> data = [
    Product(name: "Kylling", price: 150.0, quantity: 1, shop: "Rema 1000", producer: "Solvinge", unit: "kg"),
    Product(name: "Gulrot", price: 20, quantity: 1, shop: "Coop", producer: "Bonden", unit: "kg"),
  ];

  List<Product> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = data; // show everything at start
  }

  void onQueryChanged(String query) {
    setState(() {
      searchResults = data
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hjem"),
      ),
      body: Column(
        children: [
          SearchBar(onQueryChanged: onQueryChanged),
          Expanded(
            child: Center(
              child: ListView.builder(
  itemCount: searchResults.length,
  itemBuilder: (context, index) {
    final product = searchResults[index];
    return ListTile(
      title: Text(product.name),
      subtitle: Text(
        "Pris: ${product.price} NOK | "
        "Mengde: ${product.quantity} ${product.unit} | "
        "Kilopris: ${product.pricePerQuantity.toStringAsFixed(2)} NOK | "
        "Butikk: ${product.shop} | "
        "Produsent: ${product.producer} "
      ),
    );
  },
),
            )),
        ],
      )
    );
  }
}
// https://www.dhiwise.com/post/flutter-search-bar-tutorial-for-building-a-powerful-search-functionality
class SearchBar extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  const SearchBar({super.key, required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: onQueryChanged, // ← call the parent's callback
        decoration: InputDecoration(
          labelText: "Søk",
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Colors.amber.shade400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.amber.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.amber.shade600, width: 2),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}