import 'package:bloc/bloc.dart';

import '../../../../core/networking/errors/api_error_model.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(ResultInitial());
}
