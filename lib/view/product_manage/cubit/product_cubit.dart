import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class MyCubit extends Cubit<ProductState> {
  MyCubit() : super(ProductInitial());
}
