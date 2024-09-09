import 'package:store/helpers/api.dart';

import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    print('Updated_id >>>>>>>>>>>>>$id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'id': id,
        'title': title,
        'price': price.toString(),
        'description': desc,
        'image': image,
        'category': category,
      },
      token: '',
    );
    print("response data :: $data");
    return ProductModel.fromJson(data);
  }
}
