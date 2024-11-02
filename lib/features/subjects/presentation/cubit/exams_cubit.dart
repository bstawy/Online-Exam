import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/errors/api_error_handler.dart';
import '../../domain/use_cases/get_all_exams_use_case.dart';
import 'exams_state.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  final GetAllExamsUseCase _getAllExamsUseCase;

  ExamsCubit(this._getAllExamsUseCase) : super(ExamsInitial());

  Future<void> getAllExams(String subjectId) async {
    emit(ExamsLoading());

    final result = await _getAllExamsUseCase(subjectId);

    switch (result) {
      case Success():
        emit(ExamsLoaded(result.data));
      case Failure():
        emit(ExamsError(ApiErrorHandler.handle(result.exception)));
    }
  }
}
