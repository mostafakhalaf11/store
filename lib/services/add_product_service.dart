import 'package:store/helpers/api.dart';
import 'package:store/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category,
        }
      },
      token: '',
    );
    return ProductModel.fromJson(data);
  }
}
