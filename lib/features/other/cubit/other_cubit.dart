import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'other_state.dart';

class OtherCubit extends Cubit<OtherState> {
  OtherCubit() : super(OtherInitial());
}
