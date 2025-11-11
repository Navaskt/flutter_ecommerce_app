import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("ShopX", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigoAccent,
      ),
      body: productsAsync.when(
        data: (products) => GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: .75,
          ),
          itemCount: products.length,
          itemBuilder: (context, idx) {
            final product = products[idx];
            return GestureDetector(
              onTap: () => context.go('/product/${product.id}'),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.indigo.shade100], begin: Alignment.topLeft, end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(product.image, width: 110, height: 110, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 10),
                      Text(product.name, style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16),
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                      SizedBox(height: 6),
                      Text("\$${product.price}", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.indigo.shade700, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error loading products')),
      ),
    );
  }
}