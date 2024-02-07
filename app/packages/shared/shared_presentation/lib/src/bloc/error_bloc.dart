import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(ErrorInitial()) {
    on<ErrorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
