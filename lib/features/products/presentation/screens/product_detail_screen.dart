import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));

    return Scaffold(
      appBar: AppBar(title: Text("Product Detail", style: GoogleFonts.montserrat()), backgroundColor: Colors.indigoAccent),
      body: productAsync.when(
        data: (product) => Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(product.image, width: 250, height: 250, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 36),
              Text(product.name, style: GoogleFonts.poppins(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.indigo.shade900)),
              SizedBox(height: 10),
              Text("\$${product.price}", style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.indigo)),
              SizedBox(height: 28),
              Text(product.description, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Added to basket!"))
                  ),
                  icon: Icon(Icons.shopping_basket),
                  label: Text("Add to Basket", style: GoogleFonts.montserrat()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: EdgeInsets.symmetric(horizontal: 34, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              )
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error loading product')),
      ),
    );
  }
}