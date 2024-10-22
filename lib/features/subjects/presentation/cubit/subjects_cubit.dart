import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/errors/api_error_handler.dart';
import '../../../../core/networking/errors/api_error_model.dart';
import '../../domain/entities/subject_entity.dart';
import '../../domain/use_cases/get_all_subjects_use_case.dart';

part 'subjects_state.dart';

@injectable
class SubjectsCubit extends Cubit<SubjectsState> {
  final GetAllSubjectsUseCase _getAllSubjectsUseCase;

  SubjectsCubit(this._getAllSubjectsUseCase) : super(SubjectsInitial());

  void getAllSubjects() async {
    emit(SubjectsLoading());

    final result = await _getAllSubjectsUseCase();

    switch (result) {
      case Success():
        emit(SubjectsLoaded(result.data));
      case Failure():
        emit(SubjectsError(ApiErrorHandler.handle(result.exception)));
    }
  }
}
