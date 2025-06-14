import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';

class FounderProductManage extends StatelessWidget {
  const FounderProductManage({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.productManage,
      isMain: false,
      title: 'Product & Investment Managemen',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ProductTableWidget(
              products: [
                Product(
                  name: 'Product 1',
                  price: '100',
                  roi: '10%',
                  availableQty: 50,
                  soldQty: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle headerStyle = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Color(0xFF718EBF),
);

class ProductTableWidget extends StatelessWidget {
  final List<Product> products;

  const ProductTableWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        SizedBox(height: 20),
        Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () {
              showAddProductDialog(context, (product) {
                // Save logic or setState
                print('Saved: ${product.name}');
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text('Add New', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              // headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
              columns: [
                DataColumn(label: Text('Product', style: headerStyle)),
                DataColumn(label: Text('Price', style: headerStyle)),
                DataColumn(label: Text('RoI', style: headerStyle)),
                DataColumn(label: Text('Available Qty', style: headerStyle)),
                DataColumn(label: Text('Sold Qty', style: headerStyle)),
              ],
              rows:
                  products.map((product) {
                    return DataRow(
                      cells: [
                        DataCell(Text(product.name)),
                        DataCell(Text(product.price)),
                        DataCell(Text(product.roi)),
                        DataCell(Text(product.availableQty.toString())),
                        DataCell(Text(product.soldQty.toString())),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final String price;
  final String roi;
  final int availableQty;
  final int soldQty;

  Product({
    required this.name,
    required this.price,
    required this.roi,
    required this.availableQty,
    required this.soldQty,
  });
}

void showAddProductDialog(
  BuildContext context,
  void Function(Product product) onSave,
) {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final roiController = TextEditingController();
  final availableQtyController = TextEditingController();
  final soldQtyController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios, size: 18),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Add Product',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField('Product Name', nameController),
                _buildTextField('Price', priceController),
                _buildTextField('ROI', roiController),
                _buildTextField('Available Qty', availableQtyController),
                _buildTextField('Sold Qty', soldQtyController),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      final product = Product(
                        name: nameController.text,
                        price: priceController.text,
                        roi: roiController.text,
                        availableQty:
                            int.tryParse(availableQtyController.text) ?? 0,
                        soldQty: int.tryParse(soldQtyController.text) ?? 0,
                      );
                      onSave(product);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildTextField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    ),
  );
}
