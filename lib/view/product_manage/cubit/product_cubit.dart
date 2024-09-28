import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_flutter/data/repository/remote/product_repository.dart';
import 'package:teko_flutter/di/di.dart';
import 'package:teko_flutter/domain/api/base_response.dart';
import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart';
import 'package:teko_flutter/domain/entity/product_page/product_page.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository = getIt.get();

  ProductCubit() : super(ProductInitial());

  getProductPage() async {
    emit(ProductInitial());

    final response = await productRepository.getProductPage();

    if (response.status == ResponseStatus.success) {
      emit(ProductGetProductPageSuccess(productPage: response.data));
    }
  }

  createProductPage(Items item) {
    emit(ProductWaiting());

    emit(ProductCreateProductSuccess(item: item));
  }
}
