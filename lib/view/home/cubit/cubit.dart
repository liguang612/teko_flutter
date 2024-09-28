import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(MyInitial());
}
