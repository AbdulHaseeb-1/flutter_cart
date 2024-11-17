import 'package:flutter/material.dart';

class NewProductForm extends StatefulWidget {
  const NewProductForm({super.key});

  @override
  State<NewProductForm> createState() => _NewProductFormState();
}

class _NewProductFormState extends State<NewProductForm> {
  String? selectedCategory; // To store the selected category

  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Home Appliances',
    'Books',
    'Others'
  ]; // Example categories

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Add New Product',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
              decoration: InputDecoration(
            labelText: 'Product Name',
            prefixIcon: const Icon(Icons.production_quantity_limits),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Price',
              prefixIcon: const Icon(Icons.attach_money),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: selectedCategory,
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Category',
              prefixIcon: const Icon(Icons.category),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    // Add form submission logic here, such as validating inputs
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
