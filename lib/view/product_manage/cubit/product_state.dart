part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductGetProductPageSuccess extends ProductState {
  final ProductPage? productPage;

  const ProductGetProductPageSuccess({this.productPage});
  @override
  List<Object?> get props => [productPage];
}

class ProductGetProductPageFailed extends ProductState {}

class ProductCreateProductSuccess extends ProductState {
  final Items item;

  const ProductCreateProductSuccess({required this.item});
  @override
  List<Object?> get props => [item];
}

class ProductCreateProductFailed extends ProductState {
  final String message;

  const ProductCreateProductFailed(this.message);
  @override
  List<Object?> get props => [message];
}

class ProductWaiting extends ProductState {}
