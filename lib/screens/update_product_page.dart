import 'package:flutter/material.dart';
import 'package:store/helpers/show_snack_bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product_service.dart';
import 'package:store/widgets/custom_form_textfield.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, price, image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 150,
              ),
              CustomFormTextfield(
                hintText: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextfield(
                hintText: 'Description',
                onChanged: (data) {
                  desc = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextfield(
                hintText: 'Price',
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data.toString();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextfield(
                hintText: 'Image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  buttonLabel: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(product);
                    } catch (e) {
                      print(e.toString());
                      showSnackBar(context, e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  }),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    print('step 1 => ${product.id.runtimeType}');
    try {
      await UpdateProductService().updateProduct(
          id: product.id,
          title: productName == null ? product.title : productName!,
          price: price == null ? product.price : price!,
          desc: desc == null ? product.description : desc!,
          image: image == null ? product.image : image!,
          category: product.category);
    } catch (e, st) {
      print('error sent => $e');
      print('stack sent => $st');
    }
  }
}
