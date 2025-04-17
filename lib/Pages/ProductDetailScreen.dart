import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logiology/CommonWidgets/LoadingWidgets.dart';
import 'package:logiology/Controller/ProductdetailsController.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final productDetailsCtrl = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Logiology Products',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade900,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (productDetailsCtrl.isProductLoading.value) {
          return Center(child: spinkit);
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child:
                          productDetailsCtrl.product.isNotEmpty
                              ? Image.network(
                                productDetailsCtrl.product['thumbnail'] ?? '',
                              )
                              : Icon(
                                Icons.image,
                                size: 100,
                                color: Colors.grey,
                              ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    productDetailsCtrl.product['title'] ?? 'NO title',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Category: ${productDetailsCtrl.product['category'] ?? 'NO category to show'}",
                    style: GoogleFonts.openSans(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text(
                        productDetailsCtrl.product['rating']?.toString() ??
                            'Rating not available',
                        style: GoogleFonts.lato(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    productDetailsCtrl.product['description'] ??
                        'No description ',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Price: ₹${productDetailsCtrl.product['price']?.toString() ?? 'Price not available'}",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo.shade800,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
